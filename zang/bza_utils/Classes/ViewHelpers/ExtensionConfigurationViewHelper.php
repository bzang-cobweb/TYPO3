<?php
declare(strict_types=1);
namespace Zang\BzaUtils\ViewHelpers;

use TYPO3Fluid\Fluid\Core\Rendering\RenderingContextInterface;
use TYPO3Fluid\Fluid\Core\ViewHelper\AbstractViewHelper;
use TYPO3Fluid\Fluid\Core\ViewHelper\Traits\CompileWithRenderStatic;

/**
 * Class ExtensionConfigurationViewHelper
 * @package Zang\BzaUtils\ViewHelpers
 * @author Bertrand Zang <etienne.bertrand.zang@gmail.com>
 */

class ExtensionConfigurationViewHelper extends AbstractViewHelper
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
		$this->registerArgument('extensionName', 'string', 'Extension key name', true);
		$this->registerArgument('property', 'string', 'Property to get in configuration', false);
		$this->registerArgument('as', 'string', 'Return variable name', false, 'configuration');
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
		$extensionName = $arguments['extensionName'];
		if(isset($arguments['property'])) {
			$configuration = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Configuration\ExtensionConfiguration::class)
				->get($extensionName, $arguments['property']);
		} else {
			$configuration = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Configuration\ExtensionConfiguration::class)
				->get($extensionName);
		}

		$renderingContext->getVariableProvider()->add($arguments['as'], $configuration);
	}
}
