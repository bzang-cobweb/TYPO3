<?php
	/**
	* Description of Tx_Raperson_ViewHelpers_SplitCsvViewHelper
	* @author mrke
	*
	**/

//Beim Erstellen eines ViewHelpers, der HTML-Tags ausgeben soll - Abstract*TagBased*ViewHelper	
class Tx_Raperson_ViewHelpers_SplitCsvViewHelper extends Tx_Fluid_Core_ViewHelper_AbstractViewHelper {
		/**
		* takes a list of images and returns an image at a $index
		* @param string $values
		* @param integer $index
		* @return string
		**/		
		public function render($values,$index) {
			$result = '';
			$elements = t3lib_div::trimExplode(',',$values);
			if (count($elements) >= ($index+1)) {
				$result = $elements[$index];
			}
			//Übergabe von ChildElements an einen ViewHelper
			//$result .= '<pre>' . $this->renderChildren() . '</pre>';
			return $result;
		}
	}
?>