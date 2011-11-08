<?php

########################################################################
# Extension Manager/Repository config file for ext "rrzn_multipage".
#
# Auto generated 08-11-2011 14:27
#
# Manual updates:
# Only the data in the array - everything else is removed by next
# writing. "version" and "dependencies" must not be touched!
########################################################################

$EM_CONF[$_EXTKEY] = array(
	'title' => 'generate output that spans multiple Pages',
	'description' => 'This Extension provides means to generate output that spans multiple pages. Alpha Version supports HTML-Output.',
	'category' => '',
	'shy' => 0,
	'dependencies' => 'cms',
	'conflicts' => '',
	'priority' => '',
	'loadOrder' => '',
	'module' => '',
	'state' => 'alpha',
	'internal' => 0,
	'uploadfolder' => 0,
	'createDirs' => '',
	'modify_tables' => 'pages',
	'clearCacheOnLoad' => 1,
	'lockType' => '',
	'author' => 'Peter Niederlag',
	'author_email' => 'peter@niederlag.de',
	'author_company' => '',
	'CGLcompliance' => '',
	'CGLcompliance_note' => '',
	'version' => '0.1.3',
	'_md5_values_when_last_written' => 'a:15:{s:12:"ext_icon.gif";s:4:"a418";s:17:"ext_localconf.php";s:4:"b09c";s:14:"ext_tables.php";s:4:"ded9";s:14:"ext_tables.sql";s:4:"a43c";s:28:"ext_typoscript_constants.txt";s:4:"cde7";s:28:"ext_typoscript_editorcfg.txt";s:4:"3cfc";s:24:"ext_typoscript_setup.txt";s:4:"2293";s:29:"icon_tx_rrznmultipage_set.gif";s:4:"1e24";s:16:"locallang_db.php";s:4:"d7a7";s:19:"doc/wizard_form.dat";s:4:"255d";s:20:"doc/wizard_form.html";s:4:"b28f";s:34:"pi1/class.tx_rrznmultipage_pi1.php";s:4:"221f";s:17:"pi1/locallang.php";s:4:"856a";s:22:"pi1/testfunktionen.php";s:4:"08f1";s:16:"static/setup.txt";s:4:"d88b";}',
	'constraints' => array(
		'depends' => array(
			'cms' => '',
			'php' => '3.0.0-0.0.0',
			'typo3' => '3.5.0-0.0.0',
		),
		'conflicts' => array(
		),
		'suggests' => array(
		),
	),
	'suggests' => array(
	),
);

?>