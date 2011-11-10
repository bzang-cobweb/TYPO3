<?php

/***************************************************************
 *  Copyright notice
 *
 *  (c) 2011 Jennifer Erlemann <mrke@zhaw.ch>, ZHAW School of Management and Law
 *  
 *  All rights reserved
 *
 *  This script is part of the TYPO3 project. The TYPO3 project is
 *  free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
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
 *
 *
 * @package raperson
 * @license http://www.gnu.org/licenses/lgpl.html GNU Lesser General Public License, version 3 or later
 *
 */
class Tx_Raperson_Domain_Model_CertificateOwnerships extends Tx_Extbase_DomainObject_AbstractEntity {

	/**
	 * date
	 *
	 * @var DateTime
	 */
	protected $date;

	/**
	 * the certificate
	 *
	 * @var Tx_Raperson_Domain_Model_Certificate
	 */
	protected $certificate;

	/**
	 * __construct
	 *
	 * @return void
	 */
	public function __construct() {

	}

	/**
	 * Returns the date
	 *
	 * @return DateTime $date
	 */
	public function getDate() {
		return $this->date;
	}

	/**
	 * Sets the date
	 *
	 * @param DateTime $date
	 * @return void
	 */
	public function setDate($date) {
		$this->date = $date;
	}

	/**
	 * Returns the certificate
	 *
	 * @return Tx_Raperson_Domain_Model_Certificate $certificate
	 */
	public function getCertificate() {
		return $this->certificate;
	}

	/**
	 * Sets the certificate
	 *
	 * @param Tx_Raperson_Domain_Model_Certificate $certificate
	 * @return void
	 */
	public function setCertificate(Tx_Raperson_Domain_Model_Certificate $certificate) {
		$this->certificate = $certificate;
	}

}
?>