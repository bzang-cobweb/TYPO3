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
 * Test case for class Tx_Mrkeperson_Domain_Model_Person.
 *
 * @version $Id$
 * @copyright Copyright belongs to the respective authors
 * @license http://www.gnu.org/licenses/gpl.html GNU General Public License, version 3 or later
 *
 * @package TYPO3
 * @subpackage Manage Persons
 *
 * @author Jennifer Erlemann <mrke@zhaw.ch>
 */
class Tx_Mrkeperson_Domain_Model_PersonTest extends Tx_Extbase_Tests_Unit_BaseTestCase {
	/**
	 * @var Tx_Mrkeperson_Domain_Model_Person
	 */
	protected $fixture;

	public function setUp() {
		$this->fixture = new Tx_Mrkeperson_Domain_Model_Person();
	}

	public function tearDown() {
		unset($this->fixture);
	}
	
	
	/**
	 * @test
	 */
	public function getLastnameReturnsInitialValueForString() { }

	/**
	 * @test
	 */
	public function setLastnameForStringSetsLastname() { 
		$this->fixture->setLastname('Conceived at T3CON10');

		$this->assertSame(
			'Conceived at T3CON10',
			$this->fixture->getLastname()
		);
	}
	
	/**
	 * @test
	 */
	public function getFirstnameReturnsInitialValueForString() { }

	/**
	 * @test
	 */
	public function setFirstnameForStringSetsFirstname() { 
		$this->fixture->setFirstname('Conceived at T3CON10');

		$this->assertSame(
			'Conceived at T3CON10',
			$this->fixture->getFirstname()
		);
	}
	
	/**
	 * @test
	 */
	public function getCvReturnsInitialValueForString() { }

	/**
	 * @test
	 */
	public function setCvForStringSetsCv() { 
		$this->fixture->setCv('Conceived at T3CON10');

		$this->assertSame(
			'Conceived at T3CON10',
			$this->fixture->getCv()
		);
	}
	
	/**
	 * @test
	 */
	public function getImageReturnsInitialValueForString() { }

	/**
	 * @test
	 */
	public function setImageForStringSetsImage() { 
		$this->fixture->setImage('Conceived at T3CON10');

		$this->assertSame(
			'Conceived at T3CON10',
			$this->fixture->getImage()
		);
	}
	
	/**
	 * @test
	 */
	public function getCompetenciesReturnsInitialValueForObjectStorageContainingTx_Mrkeperson_Domain_Model_Competency() { 
		$newObjectStorage = new Tx_Extbase_Persistence_ObjectStorage();
		$this->assertEquals(
			$newObjectStorage,
			$this->fixture->getCompetencies()
		);
	}

	/**
	 * @test
	 */
	public function setCompetenciesForObjectStorageContainingTx_Mrkeperson_Domain_Model_CompetencySetsCompetencies() { 
		$competency = new Tx_Mrkeperson_Domain_Model_Competency();
		$objectStorageHoldingExactlyOneCompetencies = new Tx_Extbase_Persistence_ObjectStorage();
		$objectStorageHoldingExactlyOneCompetencies->attach($competency);
		$this->fixture->setCompetencies($objectStorageHoldingExactlyOneCompetencies);

		$this->assertSame(
			$objectStorageHoldingExactlyOneCompetencies,
			$this->fixture->getCompetencies()
		);
	}
	
	/**
	 * @test
	 */
	public function addCompetencyToObjectStorageHoldingCompetencies() {
		$competency = new Tx_Mrkeperson_Domain_Model_Competency();
		$objectStorageHoldingExactlyOneCompetency = new Tx_Extbase_Persistence_ObjectStorage();
		$objectStorageHoldingExactlyOneCompetency->attach($competency);
		$this->fixture->addCompetency($competency);

		$this->assertEquals(
			$objectStorageHoldingExactlyOneCompetency,
			$this->fixture->getCompetencies()
		);
	}

	/**
	 * @test
	 */
	public function removeCompetencyFromObjectStorageHoldingCompetencies() {
		$competency = new Tx_Mrkeperson_Domain_Model_Competency();
		$localObjectStorage = new Tx_Extbase_Persistence_ObjectStorage();
		$localObjectStorage->attach($competency);
		$localObjectStorage->detach($competency);
		$this->fixture->addCompetency($competency);
		$this->fixture->removeCompetency($competency);

		$this->assertEquals(
			$localObjectStorage,
			$this->fixture->getCompetencies()
		);
	}
	
	/**
	 * @test
	 */
	public function getCertificateownershipReturnsInitialValueForObjectStorageContainingTx_Mrkeperson_Domain_Model_CertificateOwnerships() { 
		$newObjectStorage = new Tx_Extbase_Persistence_ObjectStorage();
		$this->assertEquals(
			$newObjectStorage,
			$this->fixture->getCertificateownership()
		);
	}

	/**
	 * @test
	 */
	public function setCertificateownershipForObjectStorageContainingTx_Mrkeperson_Domain_Model_CertificateOwnershipsSetsCertificateownership() { 
		$certificateownership = new Tx_Mrkeperson_Domain_Model_CertificateOwnerships();
		$objectStorageHoldingExactlyOneCertificateownership = new Tx_Extbase_Persistence_ObjectStorage();
		$objectStorageHoldingExactlyOneCertificateownership->attach($certificateownership);
		$this->fixture->setCertificateownership($objectStorageHoldingExactlyOneCertificateownership);

		$this->assertSame(
			$objectStorageHoldingExactlyOneCertificateownership,
			$this->fixture->getCertificateownership()
		);
	}
	
	/**
	 * @test
	 */
	public function addCertificateownershipToObjectStorageHoldingCertificateownership() {
		$certificateownership = new Tx_Mrkeperson_Domain_Model_CertificateOwnerships();
		$objectStorageHoldingExactlyOneCertificateownership = new Tx_Extbase_Persistence_ObjectStorage();
		$objectStorageHoldingExactlyOneCertificateownership->attach($certificateownership);
		$this->fixture->addCertificateownership($certificateownership);

		$this->assertEquals(
			$objectStorageHoldingExactlyOneCertificateownership,
			$this->fixture->getCertificateownership()
		);
	}

	/**
	 * @test
	 */
	public function removeCertificateownershipFromObjectStorageHoldingCertificateownership() {
		$certificateownership = new Tx_Mrkeperson_Domain_Model_CertificateOwnerships();
		$localObjectStorage = new Tx_Extbase_Persistence_ObjectStorage();
		$localObjectStorage->attach($certificateownership);
		$localObjectStorage->detach($certificateownership);
		$this->fixture->addCertificateownership($certificateownership);
		$this->fixture->removeCertificateownership($certificateownership);

		$this->assertEquals(
			$localObjectStorage,
			$this->fixture->getCertificateownership()
		);
	}
	
}
?>