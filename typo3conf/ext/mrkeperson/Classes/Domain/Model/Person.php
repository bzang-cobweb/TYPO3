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
 * @package mrkeperson
 * @license http://www.gnu.org/licenses/lgpl.html GNU Lesser General Public License, version 3 or later
 *
 */
class Tx_Mrkeperson_Domain_Model_Person extends Tx_Extbase_DomainObject_AbstractEntity {

	/**
	 * lastname 
	 *
	 * @var string
	 * @validate NotEmpty
	 */
	protected $lastname;

	/**
	 * firstname
	 *
	 * @var string
	 * @validate NotEmpty
	 */
	protected $firstname;

	/**
	 * cv
	 *
	 * @var string
	 */
	protected $cv;

	/**
	 * image
	 *
	 * @var string
	 */
	protected $image;

	/**
	 * list of competencies
	 *
	 * @var Tx_Extbase_Persistence_ObjectStorage<Tx_Mrkeperson_Domain_Model_Competency>
	 */
	protected $competencies;

	/**
	 * certificate akquired
	 *
	 * @var Tx_Extbase_Persistence_ObjectStorage<Tx_Mrkeperson_Domain_Model_CertificateOwnerships>
	 */
	protected $certificateownership;

	/**
	 * __construct
	 *
	 * @return void
	 */
	public function __construct() {
		//Do not remove the next line: It would break the functionality
		$this->initStorageObjects();
	}

	/**
	 * Initializes all Tx_Extbase_Persistence_ObjectStorage properties.
	 *
	 * @return void
	 */
	protected function initStorageObjects() {
		/**
		 * Do not modify this method!
		 * It will be rewritten on each save in the extension builder
		 * You may modify the constructor of this class instead
		 */
		$this->competencies = new Tx_Extbase_Persistence_ObjectStorage();
		
		$this->certificateownership = new Tx_Extbase_Persistence_ObjectStorage();
	}

	/**
	 * Returns the lastname
	 *
	 * @return string $lastname
	 */
	public function getLastname() {
		return $this->lastname;
	}

	/**
	 * Sets the lastname
	 *
	 * @param string $lastname
	 * @return void
	 */
	public function setLastname($lastname) {
		$this->lastname = $lastname;
	}

	/**
	 * Returns the firstname
	 *
	 * @return string $firstname
	 */
	public function getFirstname() {
		return $this->firstname;
	}

	/**
	 * Sets the firstname
	 *
	 * @param string $firstname
	 * @return void
	 */
	public function setFirstname($firstname) {
		$this->firstname = $firstname;
	}

	/**
	 * Returns the cv
	 *
	 * @return string $cv
	 */
	public function getCv() {
		return $this->cv;
	}

	/**
	 * Sets the cv
	 *
	 * @param string $cv
	 * @return void
	 */
	public function setCv($cv) {
		$this->cv = $cv;
	}

	/**
	 * Returns the image
	 *
	 * @return string $image
	 */
	public function getImage() {
		return $this->image;
	}

	/**
	 * Sets the image
	 *
	 * @param string $image
	 * @return void
	 */
	public function setImage($image) {
		$this->image = $image;
	}

	/**
	 * Adds a Competency
	 *
	 * @param Tx_Mrkeperson_Domain_Model_Competency $competency
	 * @return void
	 */
	public function addCompetency(Tx_Mrkeperson_Domain_Model_Competency $competency) {
		$this->competencies->attach($competency);
	}

	/**
	 * Removes a Competency
	 *
	 * @param Tx_Mrkeperson_Domain_Model_Competency $competencyToRemove The Competency to be removed
	 * @return void
	 */
	public function removeCompetency(Tx_Mrkeperson_Domain_Model_Competency $competencyToRemove) {
		$this->competencies->detach($competencyToRemove);
	}

	/**
	 * Returns the competencies
	 *
	 * @return Tx_Extbase_Persistence_ObjectStorage<Tx_Mrkeperson_Domain_Model_Competency> $competencies
	 */
	public function getCompetencies() {
		return $this->competencies;
	}

	/**
	 * Sets the competencies
	 *
	 * @param Tx_Extbase_Persistence_ObjectStorage<Tx_Mrkeperson_Domain_Model_Competency> $competencies
	 * @return void
	 */
	public function setCompetencies(Tx_Extbase_Persistence_ObjectStorage $competencies) {
		$this->competencies = $competencies;
	}

	/**
	 * Adds a CertificateOwnerships
	 *
	 * @param Tx_Mrkeperson_Domain_Model_CertificateOwnerships $certificateownership
	 * @return void
	 */
	public function addCertificateownership(Tx_Mrkeperson_Domain_Model_CertificateOwnerships $certificateownership) {
		$this->certificateownership->attach($certificateownership);
	}

	/**
	 * Removes a CertificateOwnerships
	 *
	 * @param Tx_Mrkeperson_Domain_Model_CertificateOwnerships $certificateownershipToRemove The CertificateOwnerships to be removed
	 * @return void
	 */
	public function removeCertificateownership(Tx_Mrkeperson_Domain_Model_CertificateOwnerships $certificateownershipToRemove) {
		$this->certificateownership->detach($certificateownershipToRemove);
	}

	/**
	 * Returns the certificateownership
	 *
	 * @return Tx_Extbase_Persistence_ObjectStorage<Tx_Mrkeperson_Domain_Model_CertificateOwnerships> $certificateownership
	 */
	public function getCertificateownership() {
		return $this->certificateownership;
	}

	/**
	 * Sets the certificateownership
	 *
	 * @param Tx_Extbase_Persistence_ObjectStorage<Tx_Mrkeperson_Domain_Model_CertificateOwnerships> $certificateownership
	 * @return void
	 */
	public function setCertificateownership(Tx_Extbase_Persistence_ObjectStorage $certificateownership) {
		$this->certificateownership = $certificateownership;
	}

}
?>