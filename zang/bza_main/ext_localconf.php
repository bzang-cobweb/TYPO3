<?php
defined('TYPO3_MODE') || die();


call_user_func(static function ($extName) {
    $extPath = \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::extPath($extName);
    $configurationPath = $extPath . 'Configuration/Localconf/';

    /**
     * Include files configuration needed for the frontend
     */
    if (file_exists($configurationPath . 'Frontend/')) {
        $directory = new RecursiveDirectoryIterator($configurationPath . 'Frontend/');
        $iterator = new RecursiveIteratorIterator($directory);
        $files = new RegexIterator($iterator, '/^.+\.php$/i');

        foreach ($files as $file) {
            require_once $file->getPathname();
        }
    }

    /**
     * Include files configuration needed for the backend
     */
    if (TYPO3_MODE === 'BE' && file_exists($configurationPath . 'Backend/')) {
        $directory = new RecursiveDirectoryIterator($configurationPath . 'Backend/');
        $iterator = new RecursiveIteratorIterator($directory);
        $files = new RegexIterator($iterator, '/^.+\.php$/i');

        foreach ($files as $file) {
            require_once $file->getPathname();
        }
    }

    /**
     * If needed, an Additional Configuration file can also be loaded
     */
    if (file_exists($configurationPath . 'AdditionalConfiguration.php')) {
        require_once $configurationPath . 'AdditionalConfiguration.php';
    }

    $GLOBALS['TYPO3_CONF_VARS']['EXTENSIONS']['backend']['backendLogo'] = sprintf('EXT:%s/Resources/Public/Images/logo.jpg', $extName);
}, 'bza_main');


/**
 * Provide backwards compatibility with TYPO3 v10 to Sluggi v9.
 * This should be removed once Sluggi has a version for TYPO3 10.
 */
$GLOBALS['TYPO3_CONF_VARS']['SYS']['Objects'][Wazum\Sluggi\Backend\Form\InputSlugElement::class] = array(
    'className' => \Zang\BzaMain\XClass\InputSlugElement::class,
);

/**
 * Add custom email layout for transactional e-mails
 */
$GLOBALS['TYPO3_CONF_VARS']['MAIL']['layoutRootPaths'][1597744919] = 'EXT:bza_main/Resources/Private/Layouts/Email/';
$GLOBALS['TYPO3_CONF_VARS']['MAIL']['templateRootPaths'][1597744919] = 'EXT:bza_main/Resources/Private/Email/Finishers/Email/';

/**
 * Override felogin labels
 */
$GLOBALS['TYPO3_CONF_VARS']['SYS']['locallangXMLOverride']['EXT:felogin/Resources/Private/Language/locallang.xlf'][] = 'EXT:bza_main/Resources/Private/Language/Overrides/Felogin/locallang.xlf';
