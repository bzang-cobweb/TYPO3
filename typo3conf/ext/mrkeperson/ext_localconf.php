<?php
if (!defined('TYPO3_MODE')) {
	die ('Access denied.');
}

Tx_Extbase_Utility_Extension::configurePlugin(
	$_EXTKEY,
	'Pi1',
	array(
		'Person' => 'list, show, new, create, edit, update, delete',
		'Certificate' => 'list, show, new, create, edit, update, delete',
		
	),
	// non-cacheable actions
	array(
		'Person' => 'create, update, delete',
		'Certificate' => 'create, update, delete',
		
	)
);

?>