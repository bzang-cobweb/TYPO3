<?php


/***************
 * Register custom EXT:form configuration
 */
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptSetup(trim('
    module.tx_form {
        settings {
            yamlConfigurations {
                500 = EXT:bza_main/Configuration/Yaml/Forms/Setup.yaml
            }
        }
    }
    plugin.tx_form {
        settings {
            yamlConfigurations {
                500 = EXT:bza_main/Configuration/Yaml/Forms/Setup.yaml
            }
        }
    }
'));