<?php
// ##########################################
// DATABASE ACCESS CONFIG
// ##########################################
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['dbname'] = getenv('TYPO3_DB_CONNECTIONS_DEFAULT_DBNAME');
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['user'] = getenv('TYPO3_DB_CONNECTIONS_DEFAULT_USER');
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['password'] = getenv('TYPO3_DB_CONNECTIONS_DEFAULT_PASSWORD');
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['host'] = getenv('TYPO3_DB_CONNECTIONS_DEFAULT_HOST');
$GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['port'] = getenv('TYPO3_DB_CONNECTIONS_DEFAULT_PORT');

// ##########################################
// DEVELOPMENT CONFIG
// Set environment configuration for development
// ##########################################
if (\TYPO3\CMS\Core\Core\Environment::getContext()->isDevelopment()) {
    $disabledCaches = ['l10n', 'cache_core'];
    foreach ($disabledCaches as $disabledCache) {
        $GLOBALS['TYPO3_CONF_VARS']['SYS']['caching']['cacheConfigurations'][$disabledCache]['backend'] =
            \TYPO3\CMS\Core\Cache\Backend\NullBackend::class;
    }
    $GLOBALS['TYPO3_CONF_VARS']['BE']['lockIP'] = 1;
    $GLOBALS['TYPO3_CONF_VARS']['BE']['lockSSL'] = 0;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['devIPmask'] = '*';
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = true;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['sqlDebug'] = true;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['systemLogLevel'] = 0;
    $GLOBALS['TYPO3_CONF_VARS']['BE']['sessionTimeout'] = 31536000;
    $GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = true;
    $GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = true;
}

// ##########################################
// TESTING CONFIG
// Set environment configuration for testing (Bitbucket pipeline).
// Staging is also considered as testing.
// ##########################################
if (\TYPO3\CMS\Core\Core\Environment::getContext()->isTesting()) {
}

// ##########################################
// PRODUCTION CONFIG
// ##########################################
if (\TYPO3\CMS\Core\Core\Environment::getContext()->isProduction()) {
    // Encore already handles cache busting!
    $GLOBALS['TYPO3_CONF_VARS']['FE']['versionNumberInFilename'] = '';
}

// ##########################################
// DDEV CONFIG
// ##########################################
if (\TYPO3\CMS\Core\Core\Environment::getContext() == 'Development/DDEV' ||
    \TYPO3\CMS\Core\Core\Environment::getContext() == 'Testing/DDEV') {
    $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['host'] = 'db';
    $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['port'] = 3306;

    // Check if we are currently running in CLI mode
    if (php_sapi_name() === 'cli') {
        /**
         * Scripts ran from CLI in local should always be executed from outside the container,
         * so we must use the exposed Docker port
         */
        /**
         * Scripts ran from CLI in local should always be executed from outside the container,
         * so we must use the exposed Docker port
         */
        $result = json_decode(shell_exec('ddev describe -j'));
        $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['host'] = '127.0.0.1';
        $GLOBALS['TYPO3_CONF_VARS']['DB']['Connections']['Default']['port'] = $result->raw->dbinfo->published_port;
    }
}


// ##########################################
// SETTING SOME CONFIG FROM ENV VARIABLES
// ##########################################

// SYS Configuration
if (getenv('TYPO3_SYS_SITENAME'))
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['sitename'] = getenv('TYPO3_SYS_SITENAME');
if (getenv('TYPO3_SYS_ENCRYPTION_KEY'))
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['encryptionKey'] = getenv('TYPO3_SYS_ENCRYPTION_KEY');
if (getenv('TYPO3_SYS_TRUSTED_HOSTS_PATTERN'))
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['trustedHostsPattern'] = getenv('TYPO3_SYS_TRUSTED_HOSTS_PATTERN');

// Mail configuration
if (getenv('TYPO3_MAIL_TRANSPORT'))
    $GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport'] = getenv('TYPO3_MAIL_TRANSPORT');
if (getenv('TYPO3_MAIL_TRANSPORT_SMTP_SERVER'))
    $GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport_smtp_server'] = getenv('TYPO3_MAIL_TRANSPORT_SMTP_SERVER');
if (getenv('TYPO3_MAIL_TRANSPORT_SMTP_ENCRYPT'))
    $GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport_smtp_encrypt'] = getenv('TYPO3_MAIL_TRANSPORT_SMTP_ENCRYPT');
if (getenv('TYPO3_MAIL_TRANSPORT_SMTP_USERNAME'))
    $GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport_smtp_username'] = getenv('TYPO3_MAIL_TRANSPORT_SMTP_USERNAME');
if (getenv('TYPO3_MAIL_TRANSPORT_SMTP_PASSWORD'))
    $GLOBALS['TYPO3_CONF_VARS']['MAIL']['transport_smtp_password'] = getenv('TYPO3_MAIL_TRANSPORT_SMTP_PASSWORD');

// Graphics
if (getenv('TYPO3_GFX_PROCESSOR'))
    $GLOBALS['TYPO3_CONF_VARS']['GFX']['processor'] = getenv('TYPO3_GFX_PROCESSOR');
if (getenv('TYPO3_GFX_PROCESSOR_PATH'))
    $GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_path'] = getenv('TYPO3_GFX_PROCESSOR_PATH');
if (getenv('TYPO3_GFX_PROCESSOR_PATH_LZW'))
    $GLOBALS['TYPO3_CONF_VARS']['GFX']['processor_path_lzw'] = getenv('TYPO3_GFX_PROCESSOR_PATH_LZW');

// BE
if (getenv('TYPO3_BE_INSTALL_TOOL_PASSWORD'))
    $GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = getenv('TYPO3_BE_INSTALL_TOOL_PASSWORD');
