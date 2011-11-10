<?php
	/**
	* Description of Firstname
	* @author mrke
	* @param Tx_Raperson_Domain_Model_Person $person The person
	*
	**/
	
class Tx_Raperson_Domain_Validator_PersonValidator extends Tx_Extbase_Validation_Validator_AbstractValidator {
	
	/**
	* Check
	* @param Tx_Raperson_Domain_Model_Person $person The person
	*
	**/
		public function isValid($person) {
			$valid = true;
			if (strtolower($person->getFirstname()) == strtolower($person->getLastname())) {
				$msg = Tx_Extbase_Utility_Localization::translate('error.firstname.equalsnotlastname','raperson');
				//Achtung: Wenn keine Uebersetzung vorhanden ist, dann erscheint diese Meldung auch nicht!
				$this->addError($msg,1297418975);
				$valid = false;
			}
			return $valid;
		}
	}
?>