<?php
/***************************************************************
*  Copyright notice
*  
*  (c) 2003 Peter Niederlag (peter@niederlag.de)
*  All rights reserved
*
*  This script is part of the TYPO3 project. The TYPO3 project is 
*  free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.
* 
*  The GNU General Public License can be found at
*  http://www.gnu.org/copyleft/gpl.html.
* 
*  This script is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  This copyright notice MUST APPEAR in all copies of the script!
***************************************************************/
/** 
 * Plugin 'multipageoutput' for the 'rrzn_multipage' extension.
 *
 * If You have problems with this extension please read the documentation before asking questions
 *
 * Make sure you have added 
 * $TYPO3_CONF_VARS['FE']['addRootLineFields'] = 'tx_rrznmultipage_levels,tx_multipage_excludes
 * in localconf.php
 *
 * @author	Peter Niederlag <peter@niederlag.de>
 */


require_once(PATH_tslib."class.tslib_pibase.php");

class tx_rrznmultipage_pi1 extends tslib_pibase {
	var $cObj;													// The backReference to the mother cObj object set at call time
	var $prefixId = "tx_rrznmultipage_pi1";						// Same as class name
	var $scriptRelPath = "pi1/class.tx_rrznmultipage_pi1.php";	// Path to this script relative to the extension dir.
	var $extKey = "rrzn_multipage";								// The extension key.
	// var $config;												// Array() with Config used to get the CONTENT-Objects from the Multipage_set-Record
	// var $recordData;											// Holds the current Data from multipage_set-Record
	// var $levels;
	// var $startPids;
	// var $excludePids;
	var $confContent;											// Holds Typoscript-Array for render-Configuration
	var $allowedDokTypes = "1,2,4,5";
	// var $multiSetID;
	var $fieldList = "uid, pid, title";
	var $pageType ="211";
	


	/******************************************************************************
	* Public Functions for class tx_rrznmultipage_pi1
	* 
	*  printLink()
	*  generateOutput()
	*
	* these can be used from "outside"
	********************************************************************************/

	
	
	/**
	 * Main function for Extension 'MultiPage'->pi3.
	 * It will get a Page-Record from behind in rootline and
	 * - return a link either to that Page or a Page that has been setup for display with conf->fixedPID
	 * - applys a type-value to the link
	 * The Link is supposed to trigger 'MultiPage'->pi1 
	 *
	 * Should work with simulateStatic 
	 *
	 * @param	string		$content: content
	 * @param	array		$conf: constants
	 * @return	string		$thisPageLink: a full '<a href=...>text</a>' String for output
	 */
	
	function main($content,$conf)	{
		
		$this->conf = $conf;
		$linkTrue = FALSE;
	
		// TODO:
		// * use type-Param from conf-Parameter
		// * use linktext from Page-Record
		// * right now the current page-id will be used,
		// * maybe it is useful to give the ability to change the page-id that will be used to display
		// * ->pi_linkTP seems not to overrule the type for simulateStatic or if type-Parameter is set
		// $rootline = $this->cObj->rootLineValue('uid']);
		// $levels = $this->cObj->rootLineValue('10','tx_rrznmultipage_levels','1');
		// $excludes = t3lib_div::trimExplode(',',$this->cObj->rootLineValue('10','tx_rrznmultipage_excludes','1'),'1');
		
		// What Level are we?
		// do count() on rootline-Array
		$level = count($GLOBALS['TSFE']->rootLine);
		
		// Check and see if we are in reach of a page with multiprint-feature
		for ($i = $level; $i >= 1 ;$i--) {
			$distLevels = $level-$i;
			// Are we in "reach"?
			$checkPids[]=$GLOBALS['TSFE']->rootLine[$i-1]['uid'];
			if ($GLOBALS['TSFE']->rootLine[$i-1]['tx_rrznmultipage_levels'] > 0 && $GLOBALS['TSFE']->rootLine[$i-1]['tx_rrznmultipage_levels'] >= $distLevels) {
				$excludes = explode(',',$GLOBALS['TSFE']->rootLine[$i-1]['tx_rrznmultipage_excludes']);
				
				// BUG: We need to check the rootline for $excludes!
				// Should be fixed as of now, 19.2.04
				$checkArray = array_intersect($checkPids,$excludes);
				//if (!t3lib_div::inArray($excludes,$GLOBALS['TSFE']->id)) {
				if (count($checkArray) < 1) {
					$linkTrue = TRUE;
					$linkId = $GLOBALS['TSFE']->rootLine[$i-1]['uid'];
					$linkText = $GLOBALS['TSFE']->rootLine[$i-1]['title'];
					break;
				}
			}
		}
		// If there is nothing to do we return immediately
		if(!$linkTrue===TRUE) return;
		
		// Continue otherwise
		// $pageType = 'tx_rrznmultipage';   // Not Used right now
		// $link_conf['parameter.']['current'] = '1';
		// $link_conf['parameter'] = $linkId.',527 _blank';
		
		// printLink
		// $pageLink = $this->cObj->typoLink($linkText,$link_conf);
		// Here we could supply additional Parameters for the link!
		$linkParams = array();
		
		// Get the type-Value for the link
		// $linkParams['type'] = t3lib_div::intInRange($this->conf['linkConf.']['type'],1,1000,$this->pageType);
		$linkType = t3lib_div::intInRange($this->conf['linkConf.']['type'],1,1000,$this->pageType);
		
		// Get the Target-Value
		$linkTarget = $this->conf['linkConf.']['target'] ? $this->conf['linkConf.']['target'] : '_blank';

		// Apply some optional TS-Setup
		if ($linkTextOverride = $this->conf['linkConf.']['linkText']) $linkText = $linkTextOverride;
		if ($innerWrap = $this->conf['linkConf.']['innerWrap']) $linkText = $this->cObj->wrap($linkText,$innerWrap);
		
		// Get the Link
		// $pageLink = $this->cObj->getTypoLink($linkText,$linkId,$linkParams,$linkTarget);
		// $linkParams not used as of now, coul be used for additional linkVars?
		$pageLink = $this->cObj->getTypoLink($linkText,$linkId.','.$linkType,$linkParams,$linkTarget);
		
		// Apply lwrap
		if ($wrap = $this->conf['linkConf.']['wrap']) $pageLink = $this->cObj->wrap($pageLink,$wrap);		
				
		// return printLink
		return $pageLink;	
	} // end function main
	
		
		
	/**
	 * generateOutput function for Extension 'MultiPage'.
	 *
	 * @param	string		$content: content
	 * @param	array		$conf: constants
	 * @return	string		$content: The whole HTML-Stuff that we collect from various pages
	 */
	
	function generateOutput($content,$conf)	{

		
		// ***************************
		// *** TODO/Problems
		// *** check possible problems with all incoming vars
		// *** check if there is a problem about caching
		// *** add possibility to write HTML-File to filesystem
		// *** check if there could be some problems with FE-User access
		// ******************************************
		$content = "";	
		$this->conf = $conf;
	
		$startPids = array();    // This is an array of page-uids to collect children of
		$pagesOnLevel = array(); 	 // This is an array with one element for each Level holding all pages on that level in an array
		//$pageTree = array();  //	This will hold the array with the page-records, sorted in the order of the treeview
		$this->confContent = array ();
		$this->confContent['table'] = 'tt_content';
		$this->confContent['select.']['orderBy'] = 'sorting';
		$this->confContent['select.']['where'] = 'colPos=0';
		$this->confContent['select.']['languagefield'] = 'sys_language_uid';
		$this->confContent['select.']['pidInList'] = '';
		
		
		// With some validation we cold maybe adopt this based on TS-Setup
		// $this->allowedDokTypes = trim($this->conf['allowedDokTypes']);
		
	
		// Get the uid of the page-record where we want to start from GPvar, or quit anyway because there is nothing Todo
		
		// THAT IS STUPID!!!!!!
		// We would use this as a "fixed" starting point instead!
		// Other than that the link-method will already have taken care of the correct Page.id
		// if(!$pageUid=t3lib_div::GPvar('tx_multipage_pid')) return;
		
		$startPids[] = $GLOBALS['TSFE']->page['uid']; //this->cObj["data"]);
		$levels = t3lib_div::intInRange($GLOBALS['TSFE']->page['tx_rrznmultipage_levels'], 1, 20);
		$excludes = t3lib_div::intExplode(',',$GLOBALS['TSFE']->page['tx_rrznmultipage_excludes']);
		

		$pagesOnLevel = $this->getPagesOnLevel($startPids ,$levels, $excludes);
		
		// get the Content
		$content = $this->walkTree($pagesOnLevel);
		// t3lib_div::debug($this->walkTree($pagesOnLevel));
		
		return $content;
		//return "generateOutput has not been implemented yet";
		
	} // end generateOuPut
	
	

	
	/******************************************************************************
	* private Functions for class tx_rrznmultipage_pi1
	* 
	*  THESE SHOULD NOT BE USED FROM OUTSIDE
	*
	********************************************************************************
	*/
	
		
			
	
		// expects and array of page-uids to start with and goes $levels deep
		// would be better to start with an array of page-records !!!!!!!!!!!!!!!!!
		
		function getPagesOnLevel($pids,$level='1',$excludes=array()) {
			$result = array();
			$table = 'pages';
			$fieldList = 'uid, pid, title';
			$excludePidList = implode(', ',$excludes);
			$queryEnable = $this->cObj->enableFields('pages');
			$queryDocType = 'AND pages.doktype IN ('.$this->allowedDokTypes.')';
			// $pidList = implode (' ,',$pids);
			// Array auf Level Null mit aktuellen Aufrufwerten füllen
			// 
			foreach ($pids as $pid) $result[0][] = array('uid' => $pid);
			unset($pids);
			
			// Schleife durch Levels
			for ($i=1; $i <= $level; $i++) {			
				// pids aus Level i-1 auslesen
				$pidArray = array();
				foreach ($result[$i-1] as $pid) {
					$pidArray[]=$pid['uid'];
					}
				// apply $excludes at First
				// $pidArray = array_diff($pidArray,$excludes);
				$pidList = implode(' ,', $pidArray);	
				$query = 'SELECT ' .$fieldList. ' FROM pages WHERE pages.pid IN ('.$pidList.')
						 AND pages.uid NOT IN ('.$excludePidList.') '. $queryDocType . $queryEnable .' ORDER BY pages.pid, pages.sorting';
						
				$res = mysql(TYPO3_db,$query);
				// TODO commentout ?
				echo mysql_error();
				if (mysql_num_rows($res) == 0) break; // end for loop cause there is no further children

				while ($row = mysql_fetch_assoc($res))	{
					// TODO
					// We still need to check and apply language-overlay here !!!!!!!!!!!!!!!!!!!!
					$result[$i][] = $row;
					}
			}
			return $result;	
		} //end getPagesOnLevel
		
		
		function walkTree(&$pageTree,$pid=0,$level=0,$position=array()) {
				$sibling = 1;
				if (is_array($pageTree[$level]) ) {
					foreach($pageTree[$level] as $page) {
						if ($level>0 && $page['pid']!=$pid) continue ;
						// for compatibility reasons it is possible to start with more than one page from the beginning
						// childposition on RootLevel makes only sense if there is more than one page on the RootLevel
						// $childposition = array_merge($position,array($sibling));
						if (count($pageTree[$level]) <= 1 && $level == 0) {
							//@todo label
							$pageHeader = '<h1>'.'TYPO3 Extension-Development (Seminar Net and Works/Peter Niederlag)' . " ".$page['title'] . '</h1>';
						}
						else {
							$childposition = array_merge($position,array($sibling));
							//$pageHeader = '<h1 class="pagetitle">'.implode('.',$childposition) . ". ".$page['title'] . '</h1>';
							$pageHeader = '<h1 class="pagetitle">' . $page['title'] . '</h1>';							
							
						}
						// $content .= 'Seite: '.implode('.',$childposition) . " ".$page['title'] . '<br>';
						// $content .= 'Seite: '.implode('.',$pagePrefix) . " ".$page['title'] . '<br>';
						$content .= $pageHeader;
						//HIER WIRD DIE Funktion aufgerufen, die den Content erzeugt
						$this->confContent['select.']['pidInList'] = $page['uid'];
						//$myContent .='<h5 style="font-color: red;"> NUMMER: '.$num.'&nbsp;PAGE-Id: '.$page['uid'].'</h5>';
						$content.=$this->cObj->CONTENT($this->confContent);				
						// Bsp:
						// $this->foo (page,position)
						// In foo kann dann $this->content gebaut werden
						// Daann kann der content.= append hier raus
						$content .= $this->walkTree(&$pageTree,$page['uid'],$level+1,$childposition);
						$sibling++;
						}
				}
				// Kann weg, wenn 
				return $content;
		}

		

} // End Class


if (defined("TYPO3_MODE") && $TYPO3_CONF_VARS[TYPO3_MODE]["XCLASS"]["ext/rrzn_multipage/pi1/class.tx_rrznmultipage_pi1.php"])	{
	include_once($TYPO3_CONF_VARS[TYPO3_MODE]["XCLASS"]["ext/rrzn_multipage/pi1/class.tx_rrznmultipage_pi1.php"]);
}

?>