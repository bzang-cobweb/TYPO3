<?php
	/**
	* Description of PersonValidator
	* @authorpn
	*
	*
	**/
	class Tx_Mrkeperson_Domain_Validator_PersonValidator extends Tx_Extbase_Validation_Validator_AbstractValidator {
		

		/**
		* @param Tx_Mrkeperson_Domain_Model_Person $person The person
		* @return boolean
		**/
		public function isValid($person){
			$valid = TRUE;
			if(strtolower($person->getFirstname()) == strtolower($person->getLastname())) {
				$msg = Tx_Extbase_Utility_Localization::translate('error.namesequal.test', 'Mrkeperson');
				$this->addError($msg, 1320830407);
				$valid = FALSE;
			}

			return $valid;
		}


	}
?>
