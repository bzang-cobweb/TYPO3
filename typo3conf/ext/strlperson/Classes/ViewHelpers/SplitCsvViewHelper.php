<?php
	class Tx_Mrkeperson_ViewHelpers_SplitCsvViewHelper extends Tx_Fluid_Core_ViewHelper_AbstractViewHelper {
		
		/**
		 *
		 * @param string $value
		 * @param integer $index
		 * @param integer $maxWidth
		 * @param integer $maxHeight
		 * @return string
		 */
		public function render($value, $index, $maxWidth = 0, $maxHeight = 0) {
			$result = '';
			$elements = t3lib_div::trimExplode(',', $value);
			if (sizeof($elements) >= ($index+1)) {
				$result = $elements[$index];
			} else {
				return 'test';
			}

			$result .= $this->renderChildren();
			return $result;
		}
	}

?>
