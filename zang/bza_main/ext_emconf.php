<?php

/**
 * Extension Manager/Repository config file for ext "bza_main".
 */
$EM_CONF[$_EXTKEY] = [
    'title' => 'ZANG - Main site',
    'description' => '',
    'category' => 'templates',
    'constraints' => [
        'depends' => [
            'typo3' => '10.4.0-10.9.99',
        ],
        'conflicts' => [
        ],
    ],
    'autoload' => [
        'psr-4' => [
            'Zang\\BzaMain\\' => 'Classes'
        ],
    ],
    'state' => 'stable',
    'uploadfolder' => 0,
    'createDirs' => '',
    'clearCacheOnLoad' => 1,
    'author' => 'Zang',
    'author_email' => 'etienne.bertrand.zang@gmail.com',
    'author_company' => '',
    'version' => '10.0.0',
];
