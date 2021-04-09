const Encore = require('@symfony/webpack-encore')

module.exports = {
    configureDevServer: function (options) {
        const path = require('path')

        options.hot = true
        options.cert = path.resolve(process.env.HOME, '.config', 'localhost.pem')
        options.key = path.resolve(process.env.HOME, '.config', 'localhost-key.pem')
        options.disableHostCheck = true

        return options
    },

    withRte: function (main) {
        Encore.reset()
        const rte = Encore
            .setOutputPath('Resources/Public/RTE')
            .setPublicPath('/typo3conf/ext/bza_main/Resources/Public/RTE')
            .setManifestKeyPrefix('RTE/')
            .disableSingleRuntimeChunk()
            .addStyleEntry('rte', './Resources/Private/Assets/Scss/RTE.scss')
            .cleanupOutputBeforeBuild([])
            .enableSassLoader()
            .getWebpackConfig()

        return [{ ...main, name: 'main' }, { ...rte, name: 'rte' }]
    }
}
