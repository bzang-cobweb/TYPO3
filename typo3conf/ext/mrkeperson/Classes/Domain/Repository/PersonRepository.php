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
class Tx_Raperson_Domain_Repository_PersonRepository extends Tx_Extbase_Persistence_Repository {
	protected $defaultOrderings = array(
		'lastname' => Tx_Extbase_Persistence_QueryInterface::ORDER_ASCENDING,
		'firstname' => Tx_Extbase_Persistence_QueryInterface::ORDER_ASCENDING,
	);
	
	
	/**
	 *
	 *
	 * @param string $letter
	 *
	 */	
	public function findByStartOfLastname($letter='a') {
		$query = $this->createQuery();
		$contraints = array();
		$contraints[] = $query->like('lastname',$letter.'%');
		$contraints[] = $query->equals('certificateownership.certificate.name','Typo3 Integrator');
		
		$query->matching(
			//$query->like('lastname', $letter . '%')
			//$query->equals('certificateownership.certificate.name','Typo3'.'%')
			$query->logicalAnd($contraints)
		);
		return $query->execute();
	}
	
	/**
	 *
	 *
	 * @param string $letter
	 *
	 */	
	public function findByCertificate($certificate) {

		$query = $this->createQuery();
		$constraints = array();
		if ($certificate != Null) {
				$constraints[] = $query->equals('certificateownership.certificate.uid',$certificate);
		}

		if (count($constraints) > 0) {
			$query->matching(
				$query->logicalAnd($constraints)
			);
		}
		return $query->execute();
	}	
}
?>