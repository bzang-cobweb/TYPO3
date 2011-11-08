<?php
if (!defined ("TYPO3_MODE")) 	die ("Access denied.");
$tempColumns = Array (
	"tx_rrznmultipage_levels" => Array (		
		"exclude" => 1,		
		"label" => "LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_levels",		
		"config" => Array (
			"type" => "select",
			"items" => Array (
				Array("LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_levels.I.0", "0"),
				Array("LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_levels.I.1", "1"),
				Array("LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_levels.I.2", "2"),
				Array("LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_levels.I.3", "3"),
				Array("LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_levels.I.4", "4"),
				),
			"size" => 1,	
			"maxitems" => 1,
			)	
		),
	"tx_rrznmultipage_excludes" => Array (		
		"exclude" => 1,		
		"label" => "LLL:EXT:rrzn_multipage/locallang_db.php:pages.tx_rrznmultipage_excludes",		
		"config" => Array (
			"type" => "group",	
			"internal_type" => "db",
			"allowed" => "pages",	
			"size" => 3,	
			"minitems" => 0,
			"maxitems" => 15,
			)	
		),
	);


t3lib_div::loadTCA("pages");
t3lib_extMgm::addTCAcolumns("pages",$tempColumns,1);
t3lib_extMgm::addToAllTCAtypes("pages","tx_rrznmultipage_levels;;;;1-1-1, tx_rrznmultipage_excludes","2");
// Insert the static template for page.typenum = 211 to available statitc templates
t3lib_extMgm::addStaticFile($_EXTKEY,'static/','Example Output for rrznmultipage');
?>