<?php
if (!defined('TYPO3_MODE')) {
	die ('Access denied.');
}

Tx_Extbase_Utility_Extension::registerPlugin(
	$_EXTKEY,
	'Pi1',
	'persons and competencies'
);

//$pluginSignature = str_replace('_','',$_EXTKEY) . '_' . pi1;
//$TCA['tt_content']['types']['list']['subtypes_addlist'][$pluginSignature] = 'pi_flexform';
//t3lib_extMgm::addPiFlexFormValue($pluginSignature, 'FILE:EXT:' . $_EXTKEY . '/Configuration/FlexForms/flexform_' .pi1. '.xml');





if (TYPO3_MODE === 'BE') {

	/**
	 * Registers a Backend Module
	 */
	Tx_Extbase_Utility_Extension::registerModule(
		$_EXTKEY,
		'web',	 // Make module a submodule of 'web'
		'mod1',	// Submodule key
		'',						// Position
		array(
			'Person' => 'list, show, new, create, edit, update, delete',
+			'Certificate' => 'list, show, new, create, edit, update, delete',
		),
		array(
			'access' => 'user,group',
			'icon'   => 'EXT:' . $_EXTKEY . '/ext_icon.gif',
			'labels' => 'LLL:EXT:' . $_EXTKEY . '/Resources/Private/Language/locallang_mod1.xml',
		)
	);

}


t3lib_extMgm::addStaticFile($_EXTKEY, 'Configuration/TypoScript', 'Manage Persons');


t3lib_extMgm::addLLrefForTCAdescr('tx_mrkeperson_domain_model_person', 'EXT:mrkeperson/Resources/Private/Language/locallang_csh_tx_mrkeperson_domain_model_person.xml');
t3lib_extMgm::allowTableOnStandardPages('tx_mrkeperson_domain_model_person');
$TCA['tx_mrkeperson_domain_model_person'] = array(
	'ctrl' => array(
		'title'	=> 'LLL:EXT:mrkeperson/Resources/Private/Language/locallang_db.xml:tx_mrkeperson_domain_model_person',
		'label' => 'lastname',
		'tstamp' => 'tstamp',
		'crdate' => 'crdate',
		'cruser_id' => 'cruser_id',
		'dividers2tabs' => TRUE,
		'versioningWS' => 2,
		'versioning_followPages' => TRUE,
		'origUid' => 't3_origuid',
		'languageField' => 'sys_language_uid',
		'transOrigPointerField' => 'l10n_parent',
		'transOrigDiffSourceField' => 'l10n_diffsource',
		'delete' => 'deleted',
		'enablecolumns' => array(
			'disabled' => 'hidden',
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'dynamicConfigFile' => t3lib_extMgm::extPath($_EXTKEY) . 'Configuration/TCA/Person.php',
		'iconfile' => t3lib_extMgm::extRelPath($_EXTKEY) . 'Resources/Public/Icons/tx_mrkeperson_domain_model_person.gif'
	),
);

t3lib_extMgm::addLLrefForTCAdescr('tx_mrkeperson_domain_model_competency', 'EXT:mrkeperson/Resources/Private/Language/locallang_csh_tx_mrkeperson_domain_model_competency.xml');
t3lib_extMgm::allowTableOnStandardPages('tx_mrkeperson_domain_model_competency');
$TCA['tx_mrkeperson_domain_model_competency'] = array(
	'ctrl' => array(
		'title'	=> 'LLL:EXT:mrkeperson/Resources/Private/Language/locallang_db.xml:tx_mrkeperson_domain_model_competency',
		'label' => 'name',
		'tstamp' => 'tstamp',
		'crdate' => 'crdate',
		'cruser_id' => 'cruser_id',
		'dividers2tabs' => TRUE,
		'versioningWS' => 2,
		'versioning_followPages' => TRUE,
		'origUid' => 't3_origuid',
		'languageField' => 'sys_language_uid',
		'transOrigPointerField' => 'l10n_parent',
		'transOrigDiffSourceField' => 'l10n_diffsource',
		'delete' => 'deleted',
		'enablecolumns' => array(
			'disabled' => 'hidden',
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'dynamicConfigFile' => t3lib_extMgm::extPath($_EXTKEY) . 'Configuration/TCA/Competency.php',
		'iconfile' => t3lib_extMgm::extRelPath($_EXTKEY) . 'Resources/Public/Icons/tx_mrkeperson_domain_model_competency.gif'
	),
);

t3lib_extMgm::addLLrefForTCAdescr('tx_mrkeperson_domain_model_certificate', 'EXT:mrkeperson/Resources/Private/Language/locallang_csh_tx_mrkeperson_domain_model_certificate.xml');
t3lib_extMgm::allowTableOnStandardPages('tx_mrkeperson_domain_model_certificate');
$TCA['tx_mrkeperson_domain_model_certificate'] = array(
	'ctrl' => array(
		'title'	=> 'LLL:EXT:mrkeperson/Resources/Private/Language/locallang_db.xml:tx_mrkeperson_domain_model_certificate',
		'label' => 'name',
		'tstamp' => 'tstamp',
		'crdate' => 'crdate',
		'cruser_id' => 'cruser_id',
		'dividers2tabs' => TRUE,
		'versioningWS' => 2,
		'versioning_followPages' => TRUE,
		'origUid' => 't3_origuid',
		'languageField' => 'sys_language_uid',
		'transOrigPointerField' => 'l10n_parent',
		'transOrigDiffSourceField' => 'l10n_diffsource',
		'delete' => 'deleted',
		'enablecolumns' => array(
			'disabled' => 'hidden',
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'dynamicConfigFile' => t3lib_extMgm::extPath($_EXTKEY) . 'Configuration/TCA/Certificate.php',
		'iconfile' => t3lib_extMgm::extRelPath($_EXTKEY) . 'Resources/Public/Icons/tx_mrkeperson_domain_model_certificate.gif'
	),
);

t3lib_extMgm::addLLrefForTCAdescr('tx_mrkeperson_domain_model_certificateownerships', 'EXT:mrkeperson/Resources/Private/Language/locallang_csh_tx_mrkeperson_domain_model_certificateownerships.xml');
t3lib_extMgm::allowTableOnStandardPages('tx_mrkeperson_domain_model_certificateownerships');
$TCA['tx_mrkeperson_domain_model_certificateownerships'] = array(
	'ctrl' => array(
		'title'	=> 'LLL:EXT:mrkeperson/Resources/Private/Language/locallang_db.xml:tx_mrkeperson_domain_model_certificateownerships',
		'label' => 'date',
		'tstamp' => 'tstamp',
		'crdate' => 'crdate',
		'cruser_id' => 'cruser_id',
		'dividers2tabs' => TRUE,
		'versioningWS' => 2,
		'versioning_followPages' => TRUE,
		'origUid' => 't3_origuid',
		'languageField' => 'sys_language_uid',
		'transOrigPointerField' => 'l10n_parent',
		'transOrigDiffSourceField' => 'l10n_diffsource',
		'delete' => 'deleted',
		'enablecolumns' => array(
			'disabled' => 'hidden',
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'dynamicConfigFile' => t3lib_extMgm::extPath($_EXTKEY) . 'Configuration/TCA/CertificateOwnerships.php',
		'iconfile' => t3lib_extMgm::extRelPath($_EXTKEY) . 'Resources/Public/Icons/tx_mrkeperson_domain_model_certificateownerships.gif'
	),
);

?>