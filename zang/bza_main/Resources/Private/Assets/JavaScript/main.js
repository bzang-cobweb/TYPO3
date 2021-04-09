// Import polyfills for old browsers (cf package.json 'browserslist')
import 'core-js/stable'
import 'regenerator-runtime/runtime'

// Force jQuery to be loaded onto the window scope at least once
import $ from './jquery'

// Import bootstrap package things
import './bootstrap_package'

// Our pretty console decorator
import './console_decorator'

// Import main SCSS theme
import '../Scss/theme.scss'

// Import some modules
// Everything that should be loaded to the whole site should be placed here

// Font awesome (uncomment to use)
import './components/icons'

// Form behaviors
// prevent double submit (activated by default)
// import './plugins/id_preventFrmDblSubmit/id_preventFrmDblSubmit'

// jQuery Zang plugins (SBA), uncomment to use, customize in plugins.js. Documentation available in each plugin
// import './plugins'

// Main entry function (when DOM loaded)
$(function () {
    // Asynchronously load flickity if needed
    if ($('[data-flickity], .flickity, .mobile-slider').length) {
        import('./components/flickity')
    }

    // Asynchronously load lightbox if needed
    if ($('a.lightbox').length) {
        import('./components/lightbox')
    }

    // init prevent double submit
    // $('form').id_preventFrmDblSubmit()
})
