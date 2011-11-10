<?php
	/**
	* Description of Firstname
	* @authorpn
	*
	*
	**/
	class Tx_Mrkeperson_Domain_Validation_FirstnameValidator extends Tx_Extbase_Validation_Validator_AbstractValidator {
		

		/**
		* @param strin $value
		* @return boolean
		**/
		protected function isValid($value){
			$valid = TRUE;
			if($value == 'test') {
				//1320830406
				$msg = Tx_Extbase_Utility_Localization::translate('error.firstname.test', 'Mrkeperson');
				$this->addError($msg, 1320830406);
				$valid = FALSE;
			}

			return $valid;
		}


	}
?>
