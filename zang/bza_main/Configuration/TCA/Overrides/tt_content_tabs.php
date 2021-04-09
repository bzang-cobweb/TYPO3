<?php


call_user_func(function ($table) {
    $cType = 'container-tabs';
    /**
     * Accordion container
     */
    \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->addContainer(
        $cType,
        'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.tabs',
        'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.tabs.description',
        [
            [
                [
                    'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.main',
                    'colPos' => 200,
                    'colspan' => 1,
                ]
            ],
        ],
        'EXT:bza_main/Resources/Public/Icons/ContentElements/tabs.svg', // icon file, or existing icon identifier
        'EXT:container/Resources/Private/Templates/Container.html', // Template for Backend View
        'EXT:container/Resources/Private/Templates/Grid.html', // Template for Grid
        true, // saveAndClose for new content element wizard (v10 only)
        true // register in new content element wizard
    );

    /**
     * Add "head_layout" and "header_position" field to all container CTypes
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes(
        $table,
        'header_layout, header_position',
        $cType,
        'before:header'
    );
}, 'tt_content');
