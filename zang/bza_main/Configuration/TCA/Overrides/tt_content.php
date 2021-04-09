<?php
defined('TYPO3_MODE') || die();





/* Add a condition on background_image and background_image_options */
$tt_content = &$GLOBALS['TCA']['tt_content'];

// Spaces before and afger
$tt_content['columns']['space_before_class']['config']['default'] = 'none';
$tt_content['columns']['space_after_class']['config']['default'] = 'normal';
// Added using tsconfig (in Configuration/TsConfig/Page/TCEFORM/tt_content.tsconfig)
$tt_content['columns']['space_before_class']['config']['items'] = [];
$tt_content['columns']['space_after_class']['config']['items'] = [];
// Disallow fields to be localized
$tt_content['columns']['space_before_class']['l10n_mode'] = 'exclude';
$tt_content['columns']['space_after_class']['l10n_mode'] = 'exclude';

// Start and End time can be translated
// but by default it inherits from default language
$tt_content['columns']['starttime']['config']['behaviour']['allowLanguageSynchronization'] = 1;
unset($tt_content['columns']['starttime']['l10n_display']);
unset($tt_content['columns']['starttime']['l10n_mode']);

$tt_content['columns']['endtime']['config']['behaviour']['allowLanguageSynchronization'] = 1;
unset($tt_content['columns']['endtime']['l10n_display']);
unset($tt_content['columns']['endtime']['l10n_mode']);


// Columns not localizable (inherit from default language)
$tt_content['columns']['layout']['l10n_mode'] = 'exclude';
$tt_content['columns']['sectionIndex']['l10n_mode'] = 'exclude';

$tt_content['columns']['assets']['config']['behaviour']['allowLanguageSynchronization'] = 1;

