<?php


/**
 * Accordion container
 */
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->addContainer(
    'container-accordion',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.accordion',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.accordion.description',
    [
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.main',
                'colPos' => 200,
                'colspan' => 1,
            ]
        ],
    ],
    'EXT:bza_main/Resources/Public/Icons/ContentElements/accordion.svg', // icon file, or existing icon identifier
    'EXT:container/Resources/Private/Templates/Container.html', // Template for Backend View
    'EXT:container/Resources/Private/Templates/Grid.html', // Template for Grid
    true, // saveAndClose for new content element wizard (v10 only)
    true // register in new content element wizard
);


/**
 * Add accordion_open_first field for accordions
 */
call_user_func(function ($table) {
    $additionalTCAColumns = [
        'accordion_open_first' => [
            'label' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.accordion_open_first',
            'config' => [
                'type' => 'check',
                'default' => true,
            ],
        ],
        'accordion_allow_multiple' => [
            'label' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.accordion_allow_multiple',
            'config' => [
                'type' => 'check',
                'default' => true,
            ],
        ],

    ];

    $containerCTypes = 'container-accordion';

    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTCAcolumns($table, $additionalTCAColumns);
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes(
        $table,
        'accordion_open_first,accordion_allow_multiple',
        $containerCTypes,
        'after:header'
    );

    /**
     * Add "head_layout" and "header_position" field to all container CTypes
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes(
        $table,
        'header_layout, header_position',
        $containerCTypes,
        'before:header'
    );

}, 'tt_content');
