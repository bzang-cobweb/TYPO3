<?php
defined('TYPO3_MODE') || die();

call_user_func(function($extensionKey)
{
    /**
     * Default PageTS for BzaMain
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::registerPageTSConfigFile(
        $extensionKey,
        'Configuration/TsConfig/Page/All.tsconfig',
        'Zang - Main Site'
    );
}, 'bza_main');
