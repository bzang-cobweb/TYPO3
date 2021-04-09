const Encore = require('@symfony/webpack-encore')
const { withRte, configureDevServer } = require('./webpack.additional.config')

if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev')
}

if (Encore.isDevServer()) {
    Encore.disableCssExtraction().configureDevServerOptions(configureDevServer)
}

const config = Encore
    .setOutputPath('Resources/Public/Assets')
    .setPublicPath('/typo3conf/ext/bza_main/Resources/Public/Assets')
    .setManifestKeyPrefix('Assets/')

    /**
     * Here is where you add some specific page entries, which you need to load in TS:
     *
     * page.includeJsFooter.someExtensionKey = typo3_encore:entryName
     * page.includeCSS.someExtensionKey = typo3_encore:entryName
     *
     * Everything else is loaded through the js entrypoint, like
     * import somePlugin from 'some-plugin'
     *
     * and same for CSS
     * import 'some-plugin/dist/css/main'
     */
    .addEntry('app', './Resources/Private/Assets/JavaScript/main.js')

    .cleanupOutputBeforeBuild()
    .enableSingleRuntimeChunk()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())

    .enableSassLoader()
    .enableEslintLoader(eslintConfig => (eslintConfig.formatter = 'codeframe'))
    .configureBabel(babelConfig => {
        babelConfig.plugins.push('@babel/plugin-proposal-class-properties')
    }, { useBuiltIns: 'entry', corejs: 3 })
    .getWebpackConfig()

module.exports = Encore.isProduction()
    ? withRte(config)
    : config
