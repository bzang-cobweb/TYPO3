<?php
/**
 * 1 column container
 */
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->addContainer(
    'container-1column',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.1_column',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.1_column.description',
    [
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.main',
                'colPos' => 200,
                'colspan' => 1,
            ]
        ],
    ],
    'EXT:container/Resources/Public/Icons/container-1col.svg', // icon file, or existing icon identifier
    'EXT:container/Resources/Private/Templates/Container.html', // Template for Backend View
    'EXT:container/Resources/Private/Templates/Grid.html', // Template for Grid
    true, // saveAndClose for new content element wizard (v10 only)
    true // register in new content element wizard
);


/**
 * 2 columns container
 */
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->addContainer(
    'container-2columns',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.2_columns',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.2_columns.description',
    [
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.header',
                'colPos' => 200,
                'colspan' => 2,
            ]
        ],
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.left',
                'colPos' => 201
            ],
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.right',
                'colPos' => 202
            ]
        ]
    ],
    'EXT:container/Resources/Public/Icons/container-2col.svg', // icon file, or existing icon identifier
    'EXT:container/Resources/Private/Templates/Container.html', // Template for Backend View
    'EXT:container/Resources/Private/Templates/Grid.html', // Template for Grid
    true, // saveAndClose for new content element wizard (v10 only)
    true // register in new content element wizard
);

/**
 * 3 columns container
 */
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->addContainer(
    'container-3columns',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.3_columns',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.3_columns.description',
    [
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.header',
                'colPos' => 200,
                'colspan' => 2,
            ]
        ],
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.left',
                'colPos' => 201
            ],
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.main',
                'colPos' => 202
            ],
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.right',
                'colPos' => 203
            ]
        ]
    ],
    'EXT:container/Resources/Public/Icons/container-3col.svg', // icon file, or existing icon identifier
    'EXT:container/Resources/Private/Templates/Container.html', // Template for Backend View
    'EXT:container/Resources/Private/Templates/Grid.html', // Template for Grid
    true, // saveAndClose for new content element wizard (v10 only)
    true // register in new content element wizard
);

/**
 * 4 columns container
 */
\TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\B13\Container\Tca\Registry::class)->addContainer(
    'container-4columns',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.4_columns',
    'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.4_columns.description',
    [
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.header',
                'colPos' => 200,
                'colspan' => 2,
            ]
        ],
        [
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.left',
                'colPos' => 201
            ],
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.main',
                'colPos' => 202
            ],
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.main',
                'colPos' => 203
            ],
            [
                'name' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:containers.right',
                'colPos' => 204
            ]
        ]
    ],
    'EXT:container/Resources/Public/Icons/container-4col.svg', // icon file, or existing icon identifier
    'EXT:container/Resources/Private/Templates/Container.html', // Template for Backend View
    'EXT:container/Resources/Private/Templates/Grid.html', // Template for Grid
    true, // saveAndClose for new content element wizard (v10 only)
    true // register in new content element wizard
);




/**
 * Add columns_size field on multi-column containers
 */
call_user_func(function ($table) {
    $additionalTCAColumns = [
        'columns_size' => [
            'label' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.columns_size',
            'config' => [
                'type' => 'select',
                'renderType' => 'selectSingle',
                'items' => [
                    [
                        'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.columns_size.equal_width',
                        'equal-width'
                    ],
                    [
                        'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.columns_size.left_wide',
                        'left-wide'
                    ],
                    [
                        'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.columns_size.right_wide',
                        'right-wide'
                    ]
                ]
            ],
            'l10n_mode' => 'exclude',
        ],
        'enable_mobile_slider' => [
            'label' => 'LLL:EXT:bza_main/Resources/Private/Language/locallang_be.xlf:tt_content.enable_mobile_slider',
            'config' => [
                'type' => 'check',
                'default' => 0
            ],
            'l10n_mode' => 'exclude',
        ],
    ];

    $containerCTypes = 'container-1column,container-2columns,container-3columns,container-4columns';

    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTCAcolumns($table, $additionalTCAColumns);
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes(
        $table,
        'columns_size',
        $containerCTypes,
        'after:background_color_class'
    );

    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes(
        $table,
        'enable_mobile_slider',
        $containerCTypes,
        'after:columns_size'
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
