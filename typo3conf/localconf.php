<?php
if (!defined ('TYPO3_MODE')) {
	die ('Access denied.');
}

$TYPO3_CONF_VARS['SYS']['sitename'] = 'New TYPO3 site';

	// Default password is "joh316" :
$TYPO3_CONF_VARS['BE']['installToolPassword'] = 'bacb98acf97e0b6112b1d1b650b84971';

$TYPO3_CONF_VARS['EXT']['extList'] = 'info,perm,func,filelist,about,version,tsconfig_help,context_help,extra_page_cm_options,impexp,sys_note,tstemplate,tstemplate_ceditor,tstemplate_info,tstemplate_objbrowser,tstemplate_analyzer,func_wizards,wizard_crpages,wizard_sortpages,lowlevel,install,belog,beuser,aboutmodules,setup,taskcenter,info_pagetsconfig,viewpage,rtehtmlarea,css_styled_content,t3skin,t3editor,reports,felogin,form';

$typo_db_extTableDef_script = 'extTables.php';

## INSTALL SCRIPT EDIT POINT TOKEN - all lines after this points may be changed by the install script!

$TYPO3_CONF_VARS['EXT']['extList'] = 'extbase,css_styled_content,info,perm,func,filelist,about,version,tsconfig_help,context_help,extra_page_cm_options,impexp,sys_note,tstemplate,tstemplate_ceditor,tstemplate_info,tstemplate_objbrowser,tstemplate_analyzer,func_wizards,wizard_crpages,wizard_sortpages,lowlevel,install,belog,beuser,aboutmodules,setup,taskcenter,info_pagetsconfig,viewpage,rtehtmlarea,t3skin,t3editor,reports,felogin,form,rsaauth,saltedpasswords,fluid,extension_builder,fn_lib,t3dev,mrkeperson,rrzn_multipage';	// Modified or inserted by TYPO3 Extension Manager. Modified or inserted by TYPO3 Core Update Manager.
// Updated by TYPO3 Core Update Manager 04-11-11 14:22:41
$TYPO3_CONF_VARS['SYS']['encryptionKey'] = '15e9ce47d88ac8cd74f5e505f40d99c00c30f089538693adeacd67e0c67b428afadb91fc8c7ea5119a089968000f9898';	//  Modified or inserted by TYPO3 Install Tool.
$TYPO3_CONF_VARS['SYS']['compat_version'] = '4.6';	//  Modified or inserted by TYPO3 Install Tool.
$typo_db_username = 'typo3';	//  Modified or inserted by TYPO3 Install Tool.
$typo_db_password = 'typo3';	//  Modified or inserted by TYPO3 Install Tool.
$typo_db_host = 'localhost';	//  Modified or inserted by TYPO3 Install Tool.
// Updated by TYPO3 Install Tool 04-11-11 14:22:41
$TYPO3_CONF_VARS['EXT']['extConf']['saltedpasswords'] = 'a:2:{s:3:"FE.";a:2:{s:7:"enabled";s:1:"1";s:21:"saltedPWHashingMethod";s:28:"tx_saltedpasswords_salts_md5";}s:3:"BE.";a:2:{s:7:"enabled";s:1:"1";s:21:"saltedPWHashingMethod";s:28:"tx_saltedpasswords_salts_md5";}}';	//  Modified or inserted by TYPO3 Core Update Manager.
$TYPO3_CONF_VARS['BE']['loginSecurityLevel']  = 'rsa';	//  Modified or inserted by TYPO3 Core Update Manager.
$TYPO3_CONF_VARS['FE']['loginSecurityLevel']  = 'rsa';	//  Modified or inserted by TYPO3 Core Update Manager.
// Updated by TYPO3 Core Update Manager 04-11-11 14:22:46
$typo_db = 't3schulung';	//  Modified or inserted by TYPO3 Install Tool.
$TYPO3_CONF_VARS['BE']['installToolPassword'] = 'd73138bef5a01d820e3511ab83562863';	//  Modified or inserted by TYPO3 Install Tool.
// Updated by TYPO3 Install Tool 07-11-11 13:16:38
$TYPO3_CONF_VARS['EXT']['extList_FE'] = 'extbase,css_styled_content,version,install,rtehtmlarea,t3skin,felogin,form,rsaauth,saltedpasswords,fluid,extension_builder,fn_lib,t3dev,mrkeperson,rrzn_multipage';	// Modified or inserted by TYPO3 Extension Manager.
$TYPO3_CONF_VARS['EXT']['extConf']['t3dev'] = 'a:1:{s:18:"linkmenu_adminonly";s:1:"1";}';	//  Modified or inserted by TYPO3 Extension Manager.
// Updated by TYPO3 Extension Manager 07-11-11 16:19:23
$TYPO3_CONF_VARS['BE']['lockIP'] = '0';	//  Modified or inserted by TYPO3 Install Tool.
$TYPO3_CONF_VARS['BE']['versionNumberInFilename'] = '0';	//  Modified or inserted by TYPO3 Install Tool.
$TYPO3_CONF_VARS['FE']['lockIP'] = '0';	//  Modified or inserted by TYPO3 Install Tool.
// Updated by TYPO3 Install Tool 08-11-11 10:07:40
// Updated by TYPO3 Extension Manager 08-11-11 14:24:03
?>
