<?php
declare(strict_types=1);
namespace Zang\BzaUtils\ViewHelpers;

use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3Fluid\Fluid\Core\Rendering\RenderingContextInterface;
use TYPO3Fluid\Fluid\Core\ViewHelper\AbstractViewHelper;
use TYPO3Fluid\Fluid\Core\ViewHelper\Traits\CompileWithRenderStatic;

/**
 * This view helper return configuration of site given by pageUid argument.
 * If pageUid is empty it returns configuration of current site.
 *
 * Class SiteConfigurationViewHelper
 * @package Zang\BzaUtils\ViewHelpers
 * @author Bertrand Zang <etienne.bertrand.zang@gmail.com>
 */

class SiteConfigurationViewHelper extends AbstractViewHelper
{
	use CompileWithRenderStatic;

	/**
	 * Initialize arguments
	 *
	 * @return void
	 * @api
	 */
	public function initializeArguments()
	{
		parent::initializeArguments();
		$this->registerArgument('pageUid', 'int', 'Page uid to use to find site. If not given we use current page uid', false, 0);
		$this->registerArgument('as', 'string', 'Return variable name', false, 'siteConfiguration');
	}

	/**
	 * @param array $arguments
	 * @param \Closure $renderChildrenClosure
	 * @param RenderingContextInterface $renderingContext
	 * @return mixed|string
	 * @throws \Exception
	 */
	public static function renderStatic(array $arguments, \Closure $renderChildrenClosure, RenderingContextInterface $renderingContext)
	{
		$configuration = [];

		/** @var int $pageUid */
		$pageUid = $arguments['pageUid'];
		if ($pageUid == 0) {
			$pageUid = $GLOBALS['TSFE']->id;
		}

		$site = GeneralUtility::makeInstance(\TYPO3\CMS\Core\Site\SiteFinder::class)->getSiteByPageId($pageUid);
		if ($site instanceof \TYPO3\CMS\Core\Site\Entity\Site) {
			$configuration = $site->getConfiguration();
		}

		$renderingContext->getVariableProvider()->add($arguments['as'], $configuration);
	}
}
