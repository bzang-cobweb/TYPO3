import PhotoSwipe from 'photoswipe'
import PhotoSwipeUIDefault from 'photoswipe/src/js/ui/photoswipe-ui-default'
import 'photoswipe/src/css/main.scss'
import 'photoswipe/src/css/default-skin/default-skin.scss'

global.PhotoSwipe = PhotoSwipe
global.PhotoSwipeUI_Default = PhotoSwipeUIDefault

// Not imported statically, because it needs to be loaded after the global PhotoSwipe prototype
import('../../../../../../../public/typo3conf/ext/bootstrap_package/Resources/Public/JavaScript/Src/bootstrap.lightbox')
