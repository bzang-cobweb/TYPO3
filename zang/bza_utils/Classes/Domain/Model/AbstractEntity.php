<?php

namespace Zang\BzaUtils\Domain\Model;


/**
 * Class AbstractEntity
 * @package Zang\BzaUtils\Domain\Model
 * @author Bertrand Zang <etienne.bertrand.zang@gmail.com>
 */
abstract class AbstractEntity extends \TYPO3\CMS\Extbase\DomainObject\AbstractEntity
{
	/**
	 * AbstractEntity constructor.
	 * @param array $properties
	 */
	public function __construct(array $properties = [])
	{
		$this->initProperties($properties);
		if(method_exists($this, 'initStorage')) {
			$this->initStorage();
		}
	}

	/**
	 * @param array $properties
	 */
	public function initProperties(array $properties) {
		foreach ($properties as $property => $value) {
			$method = sprintf('set%s', \TYPO3\CMS\Core\Utility\GeneralUtility::underscoredToUpperCamelCase($property));
			if (method_exists($this, $method)) {
				$this->$method($value);
			} else {
				$this->_setProperty($property, $value);
			}
		}
	}
}