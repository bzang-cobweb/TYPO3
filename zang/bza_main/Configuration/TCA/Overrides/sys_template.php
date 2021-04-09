<?php
defined('TYPO3_MODE') || die();

call_user_func(static function($extensionKey) {
    /**
     * Default TypoScript for BzaMain
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile(
        $extensionKey,
        'Configuration/TypoScript',
        'Zang - Main Site'
    );
}, 'bza_main');
