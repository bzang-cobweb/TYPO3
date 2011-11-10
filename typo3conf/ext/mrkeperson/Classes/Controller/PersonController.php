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
class Tx_Raperson_Controller_PersonController extends Tx_Extbase_MVC_Controller_ActionController {

	/**
	 * personRepository
	 *
	 * @var Tx_Raperson_Domain_Repository_PersonRepository
	 */
	protected $personRepository;

	/**
	 * injectPersonRepository
	 *
	 * @param Tx_Raperson_Domain_Repository_PersonRepository $personRepository
	 * @return void
	 */
	public function injectPersonRepository(Tx_Raperson_Domain_Repository_PersonRepository $personRepository) {
		$this->personRepository = $personRepository;
	}

	/**
	 * injectCertificateRepository
	 *
	 * @param Tx_Raperson_Domain_Repository_CertificateRepository $certificateRepository
	 * @return void
	 */
	public function injectCertificateRepositoryy(Tx_Raperson_Domain_Repository_CertificateRepository $certificateRepository) {
		$this->certificateRepository = $certificateRepository;
	}

	/**
	 * action list
	 * @param Tx_Raperson_Domain_Model_Certificate $certificate
	 * @return void
	 */
	public function listAction(Tx_Raperson_Domain_Model_Certificate $certificate = NULL) {
		// $persons = $this->personRepository->findAll();
		//$persons = $this->personRepository->findByStartOfLastname('Erle');

		$persons = $this->personRepository->findByCertificate($certificate);
		
		$certificates = $this->certificateRepository->findAll();
		
		$this->view->assign('persons', $persons);
		$this->view->assign('certificates', $certificates);
		$this->view->assign('currentcertificate', $certificate);
	}

	/**
	 * action show
	 *
	 * @param $person
	 * @return void
	 */
	public function showAction(Tx_Raperson_Domain_Model_Person $person) {
		$this->view->assign('person', $person);
	}

	/**
	 * action new
	 *
	 * @param $newPerson
	 * @dontvalidate $newPerson
	 * @return void
	 */
	public function newAction(Tx_Raperson_Domain_Model_Person $newPerson = NULL) {
		$this->view->assign('newPerson', $newPerson);
	}

	/**
	 * action create
	 *
	 * @param $newPerson
	 * @return void
	 */
	public function createAction(Tx_Raperson_Domain_Model_Person $newPerson) {
		$this->personRepository->add($newPerson);
		$this->flashMessageContainer->add('Your new Person was created.');
		$this->redirect('list');
	}

	/**
	 * action edit
	 *
	 * @param $person
	 * @dontvalidate $person	 
	 * @return void
	 */
	public function editAction(Tx_Raperson_Domain_Model_Person $person) {
		$this->view->assign('person', $person);
	}

	/**
	 * action update
	 *
	 * @param $person
	 * @return void
	 */
	public function updateAction(Tx_Raperson_Domain_Model_Person $person) {
		$this->personRepository->update($person);
		$this->flashMessageContainer->add('Your Person was updated.');
		$this->redirect('list');
	}

	/**
	 * action delete
	 *
	 * @param $person
	 * @return void
	 */
	public function deleteAction(Tx_Raperson_Domain_Model_Person $person) {
		$this->personRepository->remove($person);
		$this->flashMessageContainer->add('Your Person was removed.');
		$this->redirect('list');
	}

}
?>