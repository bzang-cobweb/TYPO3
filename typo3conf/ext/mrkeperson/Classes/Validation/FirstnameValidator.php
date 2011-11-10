<?php
	/**
	* Description of Firstname
	* @author mrke
	*
	*
	**/
	class Tx_Raperson_Validation_FirstnameValidator extends Tx_Extbase_Validation_Validator_AbstractValidator {
		protected function isValid($value) {
			$valid = true;
			if ($value == 'test') {
				$msg = Tx_Extbase_Utility_Localization::translate('error.firstname.test','raperson');
				//Achtung: Wenn keine Uebersetzung vorhanden ist, dann erscheint diese Meldung auch nicht!
				$this->addError($msg,1297418974);
				$valid = false;
			}
			return $valid;
		}
	}
?>