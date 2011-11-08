<?php
if (!defined ("TYPO3_MODE")) 	die ("Access denied.");

// This is really neat and should be used lateron !!!!
## Extending TypoScript from static template uid=43 to set up userdefined tag:
/*t3lib_extMgm::addTypoScript($_EXTKEY,"editorcfg","
	tt_content.CSS_editor.ch.tx_rrznmultipage_pi1 = < plugin.tx_rrznmultipage_pi1.CSS_editor
",43);
*/

// Extending TypoScript from static template uid=43 to set up this extension:
t3lib_extMgm::addTypoScript($_EXTKEY,"setup",'<INCLUDE_TYPOSCRIPT: source=FILE:EXT:ext_typoscript_setup.txt',43);

// Insert the library as well!
t3lib_extMgm::addPItoST43($_EXTKEY,"pi1/class.tx_rrznmultipage_pi1.php","_pi1"," ",1);

/*t3lib_extMgm::addTypoScript($_EXTKEY,"setup","
	tt_content.shortcut.20.0.conf.tx_rrznmultipage_set = < plugin.".t3lib_extMgm::getCN($_EXTKEY)."_pi1
	tt_content.shortcut.20.0.conf.tx_rrznmultipage_set.CMD = singleView
",43);
*/
?>