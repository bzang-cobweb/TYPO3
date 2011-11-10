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
class Tx_Mrkeperson_Controller_PageController extends Tx_Extbase_MVC_Controller_ActionController {

	/**
	 * pageRepository
	 *
	 * @var Tx_Mrkeperson_Domain_Repository_PageRepository
	 */
	protected $pageRepository;

	/**
	 * injectPageRepository
	 *
	 * @param Tx_Mrkeperson_Domain_Repository_PageRepository $pageRepository
	 * @return void
	 */
	public function injectPageRepository(Tx_Mrkeperson_Domain_Repository_PageRepository $pageRepository) {
		$this->pageRepository = $pageRepository;
	}

	/**
	 * action list
	 *
	 * @return void
	 */
	public function listAction() {
		$pages = $this->pageRepository->findAll();
		$this->view->assign('pages', $pages);
	}

	/**
	 * action show
	 *
	 * @param $page
	 * @return void
	 */
	public function showAction(Tx_Mrkeperson_Domain_Model_Page $page) {
		$this->view->assign('page', $page);
	}

	/**
	 * action new
	 *
	 * @param $newPage
	 * @dontvalidate $newPage
	 * @return void 
	 */
	public function newAction(Tx_Mrkeperson_Domain_Model_Page $newPage = NULL) {
		$this->view->assign('newPage', $newPage);
	}

	/**
	 * action create
	 *
	 * @param $newPage
	 * @return void
	 */
	public function createAction(Tx_Mrkeperson_Domain_Model_Page $newPage) {
		$this->pageRepository->add($newPage);
		$this->flashMessageContainer->add('Your new Page was created.');
		$this->redirect('list');
	}

	/**
	 * action edit
	 *
	 * @param $page
	 * @return void
	 */
	public function editAction(Tx_Mrkeperson_Domain_Model_Page $page) {
		$this->view->assign('page', $page);
	}

	/**
	 * action update
	 *
	 * @param $page
	 * @return void
	 */
	public function updateAction(Tx_Mrkeperson_Domain_Model_Page $page) {
		$this->pageRepository->update($page);
		$this->flashMessageContainer->add('Your Page was updated.');
		$this->redirect('list');
	}

	/**
	 * action delete
	 *
	 * @param $page
	 * @return void
	 */
	public function deleteAction(Tx_Mrkeperson_Domain_Model_Page $page) {
		$this->pageRepository->remove($page);
		$this->flashMessageContainer->add('Your Page was removed.');
		$this->redirect('list');
	}

}
?>