<?php
/**
* The content of this file is (c) 2003-2007 digital media center GmbH
* All rights reserved
*
* Utilizes the PHP tokenizer functions to parse all class files of the Typo3
* installation and its extensions for hookPoints.
*
* Currently all .php files are analyzed.
*
* @package			typo3
* @subpackage		dmc_hooklist
* @access 			public
* @author 			Dominique Stender <dst@dmc.de>
* @copyright		(c) 2003-2007 digital media center GmbH, all rights reserved
* @version			$Id: index.php 4099 2007-07-20 14:34:53Z dst $
*/

//---- initialization ----------------------------------------------------------
// DEFAULT initialization of a module [BEGIN]
unset($MCONF);
require ('conf.php');
require ($BACK_PATH . 'init.php');
require ($BACK_PATH . 'template.php');
$LANG->includeLLFile('EXT:dmc_hooklist/mod1/locallang.xml');
require_once (PATH_t3lib . 'class.t3lib_scbase.php');
$BE_USER->modAccess($MCONF, 1);	// This checks permissions and exits if the users has no permission for entry.
// DEFAULT initialization of a module [END]

//---- classes -----------------------------------------------------------------
/**
* Hook list backend class.
*
* @package			typo3
* @subpackage		dmc_hooklist
* @access			public
* @author			Dominique Stender <dst@dmc.de>
* @version			1.0.1
*/
class tx_dmchooklist_module1 extends t3lib_SCbase {
	/**
	* pageinfo
	*
	* @var		string 	pageinfo
	* @access	protected
	*/
	var $pageinfo;

	/**
	 * Initializes the Module
	 *
	 * @access	public
	 * @return	void
	 */
	function init()	{
		global $BE_USER,$LANG,$BACK_PATH,$TCA_DESCR,$TCA,$CLIENT,$TYPO3_CONF_VARS;

		parent::init();
	}

	/**
	 * Adds items to the ->MOD_MENU array. Used for the function menu selector.
	 *
	 * @access	protected
	 * @return	void
	 */
	function menuConfig()	{
		global $LANG;

		if (function_exists('token_get_all')) {
			$this->MOD_MENU = array(
				'function' => array(
					1 => $LANG->getLL('function1'),
					2 => $LANG->getLL('function2'),
					3 => $LANG->getLL('function3'),
					4 => $LANG->getLL('function4'),
					5 => $LANG->getLL('function5'),
					6 => $LANG->getLL('function6'),
				),
			);

		} else {
			$this->MOD_MENU = array(
				'function' => array(
					1 => $LANG->getLL('function1'),
				),
			);
		} // end: if

		parent::menuConfig();
	}

	/**
	 * Main function of the module. Write the content to $this->content
	 * If you chose "web" as main module, you will need to consider the $this->id parameter which will contain the uid-number of the page clicked in the page tree
	 *
	 * @access	public
	 * @return	void
	 */
	function main()	{
		global $BE_USER,$LANG,$BACK_PATH,$TCA_DESCR,$TCA,$CLIENT,$TYPO3_CONF_VARS;

		// Access check!
		// The page will show only if there is a valid page and if this page may be viewed by the user
		$this->pageinfo = t3lib_BEfunc::readPageAccess($this->id,$this->perms_clause);
		$access = is_array($this->pageinfo) ? 1 : 0;

		if (($this->id && $access) || ($BE_USER->user["admin"] && !$this->id))	{

				// Draw the header.
			$this->doc = t3lib_div::makeInstance("mediumDoc");
			$this->doc->backPath = $BACK_PATH;
			$this->doc->form='<form action="" method="POST">';

				// JavaScript
			$this->doc->JScode = '
				<script language="javascript" type="text/javascript">
					script_ended = 0;
					function jumpToUrl(URL)	{
						document.location = URL;
					}
				</script>
			';
			$this->doc->postCode='
				<script language="javascript" type="text/javascript">
					script_ended = 1;
					if (top.fsMod) top.fsMod.recentIds["web"] = 0;
				</script>
			';

			$headerSection = $this->doc->getHeader("pages",$this->pageinfo,$this->pageinfo["_thePath"])."<br />".$LANG->sL("LLL:EXT:lang/locallang_core.xml:labels.path").": ".t3lib_div::fixed_lgd_pre($this->pageinfo["_thePath"],50);

			$this->content.=$this->doc->startPage($LANG->getLL("title"));
			$this->content.=$this->doc->header($LANG->getLL("title"));
			$this->content.=$this->doc->spacer(5);
			$this->content.=$this->doc->section("",$this->doc->funcMenu($headerSection,t3lib_BEfunc::getFuncMenu($this->id,"SET[function]",$this->MOD_SETTINGS["function"],$this->MOD_MENU["function"])));
			$this->content.=$this->doc->divider(5);

			// Render content:
			$this->moduleContent();

			// ShortCut
			if ($BE_USER->mayMakeShortcut())	{
				$this->content.=$this->doc->spacer(20).$this->doc->section("",$this->doc->makeShortcutIcon("id",implode(",",array_keys($this->MOD_MENU)),$this->MCONF["name"]));
			}

			$this->content.=$this->doc->spacer(10);
		} else {
				// If no access or if ID == zero

			$this->doc = t3lib_div::makeInstance("mediumDoc");
			$this->doc->backPath = $BACK_PATH;

			$this->content.=$this->doc->startPage($LANG->getLL("title"));
			$this->content.=$this->doc->header($LANG->getLL("title"));
			$this->content.=$this->doc->spacer(5);
			$this->content.=$this->doc->spacer(10);
		}
	}

	/**
	 * Prints out the module HTML
	 *
	 * @access	protected
	 * @return	void
	 */
	function printContent()	{

		$this->content.=$this->doc->endPage();
		echo $this->content;
	}

	/**
	 * Generates the module content
	 *
	 * @access	protected
	 * @return	void
	 */
	function moduleContent() {
		global $LANG;

		$baseDir		= '';
		$functionNum	= (string) $this->MOD_SETTINGS['function'];

        switch($functionNum) {

            case 2:
				// all sources
            	$baseDir = PATH_site;
				break;

            case 3:
				// the Typo3 sources
				$baseDir = PATH_site . 'typo3_src';
				break;

            case 4:
				// local extensions
				$baseDir = PATH_site . 'typo3conf/ext';
				break;

            case 5:
				// global extensions
				$baseDir = PATH_site . 'typo3/ext';
				break;

            case 6:
				// system extensions
				$baseDir = PATH_site . 'typo3/sysext';
				break;

            case 1:
			default:

				if (is_array($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['moduleFunction'])) {

					foreach($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['moduleFunction'] as $funcRef) {
						$params = array(&$baseDir);
						t3lib_div::callUserFunction($funcRef, $params, $this);
					} // end: foreach
				} // end: if

				if (function_exists('token_get_all')) {
					$this->content .= $LANG->getLL('introText');

				} else {
					$this->content .= $LANG->getLL('noTokenizer');
				} // end: if
		} // end: switch

		// if a basedir is set, start fetching files and generate the tokens
		if ($baseDir != '') {

			if (ini_get('safe_mode') == false
				|| strtolower(ini_get('safe_mode')) != 'off') {
				// if safemode is NOT active, make sure the analysis runs through
				set_time_limit(0);
			} // end: if

			$hookList 	= '';
			$hooks		= array();
			$files		= $this->recFind($baseDir, '\.php$');
			$content	= '';

			foreach ($files as $file) {
				$hookList = $this->generateHookList($file);

				if ($hookList != '') {
					$content .= $this->doc->section('~' . str_replace(PATH_site, '', $file) . ':', $hookList, 1, 1)
							. '<br /><br />';
				} // end: if
			} // end: foreach

			if ($content != '') {
				$this->content .= sprintf($LANG->getLL('hooksFound'), $LANG->getLL('function' . $functionNum))
								. $content;

			} else {
				$this->content .= sprintf($LANG->getLL('noHooksFound'), $LANG->getLL('function' . $functionNum));
			} // end: if
		} // end: if
	}


	/**
	* Reads in the requested file and starts the tokenizer to generate
	* the list of hooks.
	*
	* @param	string	$file	file to find tokens in
	*
	* @access	protected
	* @return	string
	*/
	function generateHookList($file) {
		$returnValue	= '';
		$hooks			= array();

		// tokenize the file content

		if (is_file($file)
			&& is_readable($file)) {

			$tokens	= token_get_all(file_get_contents($file));

			// remove all whitespace tokens
			$tokens = $this->removeWhitespace($tokens);

			// walk through the tokens and find hooks
			$hooks	= $this->findHooks($tokens);

			// append list of hooks to content
			foreach ($hooks as $hookPoint) {

				if (count($hookPoint['hooks']) > 0) {

					if ($hookPoint['class'] != '') {
						$returnValue .= '<strong>class:</strong> ' . $hookPoint['class'] . "<br />\n";
					} // end: if

					if ($hookPoint['function'] != '') {
						$returnValue 	.= '<strong>function:</strong> ' . $hookPoint['function'] . "()<br />\n";
					} // end: if

					$returnValue .= "<ul>\n";

					foreach ($hookPoint['hooks'] as $hook) {
						$returnValue	.= '<li>' . $hook . "</li>\n";
					} // end: foreach

					$returnValue .= "</ul>\n";
				} // end: if
			} // end: foreach
		} // end: if

		return $returnValue;
	}

	/**
	* Iterates over an array of tokens and removes the tokens
	* that happen to be whitespace.
	*
	* @param	array		$tokens		Array of tokens
	* @access	protected
	* @return	array
	*/
	function removeWhitespace($tokens) {
		$returnValue	= array();
		$tokenNum		= count($tokens);

		for ($i = 0; $i < $tokenNum; $i++) {

			if (is_array($tokens[$i])) {
				// complex token

				switch ($tokens[$i][0]) {

					case T_ENCAPSED_AND_WHITESPACE:
					case T_WHITESPACE:
						// not doing anything here, get rid of whitespace
						break;

					default:
						// keep this token
						$returnValue[] = $tokens[$i];
				} // end: switch

			} else {
				// character token, always keep it
				$returnValue[] = $tokens[$i];
			} // end: if
		} // end: for

		return $returnValue;
	}

	/**
	* Walks through an array of PHP tokens and identifies every hook
	* according with the class and fundtion it resides in.
	*
	* @param	array		$tokens		array of PHP tokens
	 * @access	protected
	* @return	array
	*/
	function findHooks($tokens) {
		$returnValue		= array();
		$returnCount		= -1;
		$inClass			= '';
		$inClassDepth		= 0;
		$inFunction			= '';
		$inFunctionDepth	= 0;
		$nestingDepth		= 0;
		$hookString			= '';
		$numOfTokens		= count($tokens);

		for ($i = 0; $i < $numOfTokens; $i++) {

			if (is_array($tokens[$i])) {
				// complex token
				list($index, $value) = $tokens[$i];

				switch ($index) {

					case T_CLASS:
						// entering a class
						$i++;

						if (is_array($tokens[$i])
							&& $tokens[$i][0] == T_STRING) {
							$inClass		= $tokens[$i][1];
							$inClassDepth	= $nestingDepth;
						} // end: if
						break;

					case T_FUNCTION:
						// entering a function
						$i++;

						if (is_array($tokens[$i])
							&& $tokens[$i][0] == T_STRING) {
							$inFunction			= $tokens[$i][1];
							$inFunctionDepth	= $nestingDepth;
						} // end: if

						$returnCount++;
						$returnValue[$returnCount] = array(
							'class' 	=> $inClass,
							'function'	=> $inFunction,
							'hooks'		=> array(),
						);
						break;

					case T_FOREACH:
						/* probably a loop over hooks, we have to check
							...and do some probability guessing */

						if (
								is_array($tokens[$i+2]) && $tokens[$i+2][0] == T_VARIABLE && $tokens[$i+2][1] == '$GLOBALS'
							&&	is_string($tokens[$i+3]) && $tokens[$i+3] == '['
							&&	is_array($tokens[$i+4]) && $tokens[$i+4][0] == T_CONSTANT_ENCAPSED_STRING && $tokens[$i+4][1] == '\'TYPO3_CONF_VARS\''
							&&	is_string($tokens[$i+5]) && $tokens[$i+5] == ']'
							&&	is_string($tokens[$i+6]) && $tokens[$i+6] == '['
							&&	is_array($tokens[$i+7]) && $tokens[$i+7][0] == T_CONSTANT_ENCAPSED_STRING && $tokens[$i+7][1] == '\'SC_OPTIONS\''
							&&	is_string($tokens[$i+8]) && $tokens[$i+8] == ']'
							&&	is_string($tokens[$i+9]) && $tokens[$i+9] == '['
							&&	is_array($tokens[$i+10]) && $tokens[$i+10][0] == T_CONSTANT_ENCAPSED_STRING
							&&	is_string($tokens[$i+11]) && $tokens[$i+11] == ']'
							&&	is_string($tokens[$i+12]) && $tokens[$i+12] == '['
							&&	is_array($tokens[$i+13]) && $tokens[$i+13][0] == T_CONSTANT_ENCAPSED_STRING
							&&	is_string($tokens[$i+14]) && $tokens[$i+14] == ']'
						) {
							// hooks that are triggered via $GLOBALS
							$returnValue[$returnCount]['hooks'][] = '$TYPO3_CONF_VARS'
																	. $tokens[$i+6]
																	. $tokens[$i+7][1]
																	. $tokens[$i+8]
																	. $tokens[$i+9]
																	. $tokens[$i+10][1]
																	. $tokens[$i+11]
																	. $tokens[$i+12]
																	. $tokens[$i+13][1]
																	. $tokens[$i+14];

						} elseif (
								is_array($tokens[$i+2]) && $tokens[$i+2][0] == T_VARIABLE && $tokens[$i+2][1] == '$this'
							&&	is_array($tokens[$i+3]) && $tokens[$i+3][0] == T_OBJECT_OPERATOR
							&&  is_array($tokens[$i+4]) && $tokens[$i+4][0] == T_STRING && $tokens[$i+4][1] == 'TYPO3_CONF_VARS'
							&&	is_string($tokens[$i+5]) && $tokens[$i+5] == '['
							&&	is_array($tokens[$i+6]) && $tokens[$i+6][0] == T_CONSTANT_ENCAPSED_STRING && $tokens[$i+6][1] == '\'SC_OPTIONS\''
							&&	is_string($tokens[$i+7]) && $tokens[$i+7] == ']'
							&&	is_string($tokens[$i+8]) && $tokens[$i+8] == '['
							&&	is_array($tokens[$i+9]) && $tokens[$i+9][0] == T_CONSTANT_ENCAPSED_STRING
							&&	is_string($tokens[$i+10]) && $tokens[$i+10] == ']'
							&&	is_string($tokens[$i+11]) && $tokens[$i+11] == '['
							&&	is_array($tokens[$i+12]) && $tokens[$i+12][0] == T_CONSTANT_ENCAPSED_STRING
							&&	is_string($tokens[$i+13]) && $tokens[$i+13] == ']'
						) {
							// hooks that are triggered via $this->
							$returnValue[$returnCount]['hooks'][] = '$'
																	. $tokens[$i+4][1]
																	. $tokens[$i+5]
																	. $tokens[$i+6][1]
																	. $tokens[$i+7]
																	. $tokens[$i+8]
																	. $tokens[$i+9][1]
																	. $tokens[$i+10]
																	. $tokens[$i+11]
																	. $tokens[$i+12][1]
																	. $tokens[$i+13];

						} elseif (
								is_array($tokens[$i+2]) && $tokens[$i+2][0] == T_VARIABLE && $tokens[$i+2][1] == '$TYPO3_CONF_VARS'
							&&	is_string($tokens[$i+3]) && $tokens[$i+3] == '['
							&&	is_array($tokens[$i+4]) && $tokens[$i+4][0] == T_CONSTANT_ENCAPSED_STRING && $tokens[$i+4][1] == '\'SC_OPTIONS\''
							&&	is_string($tokens[$i+5]) && $tokens[$i+5] == ']'
							&&	is_string($tokens[$i+6]) && $tokens[$i+6] == '['
							&&	is_array($tokens[$i+7]) && $tokens[$i+7][0] == T_CONSTANT_ENCAPSED_STRING
							&&	is_string($tokens[$i+8]) && $tokens[$i+8] == ']'
							&&	is_string($tokens[$i+9]) && $tokens[$i+9] == '['
							&&	is_array($tokens[$i+10]) && $tokens[$i+10][0] == T_CONSTANT_ENCAPSED_STRING
							&&	is_string($tokens[$i+11]) && $tokens[$i+11] == ']'
						) {
							// hooks where $TYPO3_CONF_VARS is accessible directly
							$returnValue[$returnCount]['hooks'][] = $tokens[$i+2][1]
																	. $tokens[$i+3]
																	. $tokens[$i+4][1]
																	. $tokens[$i+5]
																	. $tokens[$i+6]
																	. $tokens[$i+7][1]
																	. $tokens[$i+8]
																	. $tokens[$i+9]
																	. $tokens[$i+10][1]
																	. $tokens[$i+11];
						} // end: if

						// add your own hook-detection logic here
						if (is_array($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['hookDetection'])) {

							foreach($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['hookDetection'] as $funcRef) {
								$params = array(&$returnValue, $tokens, $returnCount, $i);
								t3lib_div::callUserFunction($funcRef, $params, $this);
							} // end: foreach
						} // end: if
						break;

					default:
					// add additional hook-detection logics here
					if (is_array($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['hookDetectionDefault'])) {

						foreach($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['hookDetectionDefault'] as $funcRef) {
							$params = array(&$returnValue, $tokens, $returnCount, $i);
							t3lib_div::callUserFunction($funcRef, $params, $this);
						} // end: foreach
					} // end: if
				} // end: switch

			} else {
				// character token - we need to count curly braces
				switch ($tokens[$i]) {

					case '{':
						$nestingDepth++;
						break;

					case '}':
						// decrease nesting
						$nestingDepth--;

						if ($nestingDepth < $inClassDepth) {
							$inClass		= '';
							$inClassDepth	= 0;

						} elseif ($nestingDepth < $inFunctionDepth) {
							$inFunction 		= '';
							$inFunctionDepth 	= 0;
						} // end: if
						break;

					default:
					// add additional hook-detection logics here
					if (is_array($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['charToken'])) {

						foreach($TYPO3_CONF_VARS['SC_OPTIONS']['dmc_hooklist/mod1/index.php']['charToken'] as $funcRef) {
							$params = array(&$returnValue, $tokens, $returnCount, $i);
							t3lib_div::callUserFunction($funcRef, $params, $this);
						} // end: foreach
					} // end: if
				} // end: switch

			} // end: if
		} // end: foreach

		return $returnValue;
	}

    /**
    * Generates an array with all files within the given directory and it's subdirectories
    * that match the pattern. If the second parameter is skipped, all files are included
    * in the array.
    *
	* @access	protected
    * @param  	string  $s_directory Directorytree to search the files in
    * @param  	string  $s_pattern Pattern (Perl syntax) the files must match. Default is (.*?) (all files)
    * @return 	array
    */
    function recFind($directory, $pattern = "(.*?)") {
		clearstatcache();
		$files = array();

		if ($dh = @opendir($directory)) {
			$i = 0;

			while ($file = readdir($dh)) {

				if (($file != '.') && ($file != '..')) {
					$tempdir = $directory . '/' . $file;

					if (is_dir($tempdir)) {
						$files = array_merge($files, $this->recFind($tempdir, $pattern));

					} else {

						if (preg_match('/' . $pattern . '/', $file)) {
							$files[] = $tempdir;
						} // end: if
					} // end: if
					$i++;
				} // end: if
			} // end: while
		} // end: if
		@closedir($dh);

		return $files;
    }
}

//---- logic -------------------------------------------------------------------
if (defined('TYPO3_MODE') && $TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/dmc_hooklist/mod1/index.php'])	{
	include_once($TYPO3_CONF_VARS[TYPO3_MODE]['XCLASS']['ext/dmc_hooklist/mod1/index.php']);
} // end: if

// Make instance:
$SOBE = t3lib_div::makeInstance('tx_dmchooklist_module1');
$SOBE->init();

// Include files?
foreach ($SOBE->include_once as $INC_FILE) {
	include_once($INC_FILE);
} // end: foreach

//---- content -----------------------------------------------------------------
$SOBE->main();
$SOBE->printContent();

?>