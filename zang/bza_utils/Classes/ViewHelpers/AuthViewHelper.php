<?php
declare(strict_types=1);
namespace Zang\BzaUtils\ViewHelpers;


use TYPO3\CMS\Core\Context\Context;
use TYPO3\CMS\Core\Database\ConnectionPool;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3Fluid\Fluid\Core\ViewHelper\AbstractViewHelper;

/**
 * This view helper return logged fe user record from db.
 * Return empty array if current user is not logged.
 * <util:auth>
 *  {auth}
 * </util:auth>
 *
 * Class AuthViewHelper
 * @package Zang\BzaUtils\ViewHelpers
 * @author Bertrand Zang <etienne.bertrand.zang@gmail.com>
 */
class AuthViewHelper extends AbstractViewHelper
{
	/**
	 * @var bool
	 */
	protected $escapeOutput = false;

	/**
	 * @var bool
	 */
	protected $escapeChildren = false;


	/**
	 * Initializes the arguments
	 */
	public function initializeArguments()
	{
		parent::initializeArguments();
		$this->registerArgument('as', 'string', 'The output variable name', false, 'auth');
	}

	/**
	 * @return mixed
	 */
	public function render()
	{
		/** @var array $user */
		$user = [];

		$context = GeneralUtility::makeInstance(Context::class);
		if ($context instanceof Context) {
			try {
				$userIsLoggedIn = $context->getPropertyFromAspect('frontend.user', 'isLoggedIn');
				if ($userIsLoggedIn) {
					$uid = $context->getPropertyFromAspect('frontend.user', 'id');
					if ($uid > 0) {
						$table = 'fe_users';
						$qb = $this->queryBuilder($table)->from($table);
						$user = $qb->select('*')
							->from($table)
							->where(
								$qb->expr()->eq('uid', $qb->createNamedParameter($uid, \PDO::PARAM_INT))
							)
							->execute()
							->fetchAssociative();
					}
				}
			} catch (\TYPO3\CMS\Core\Context\Exception\AspectNotFoundException $exception) {
			} catch (\Exception $exception) {
			}
		}

		/** @var string $as */
		$as = $this->arguments['as'];

		$this->templateVariableContainer->add($as, $user);
		$output = $this->renderChildren();
		$this->templateVariableContainer->remove($as);

		return $output;
	}

	/**
	 * @param string $table
	 * @return \TYPO3\CMS\Core\Database\Query\QueryBuilder
	 */
	private function queryBuilder($table)
	{
		return GeneralUtility::makeInstance(ConnectionPool::class)->getQueryBuilderForTable($table);
	}

}
