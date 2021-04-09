import { library, dom, config } from '@fortawesome/fontawesome-svg-core'

// Manual imports for tree shaking here
import { faCheck } from '@fortawesome/free-solid-svg-icons'
library.add(faCheck)

// If you want to import all icons (thus disabling tree shaking and making a large bundle size), comment the lines
// above and uncomment these:

// import fas from '@fortawesome/free-solid-svg-icons'
// import far from '@fortawesome/free-regular-svg-icons'
// import fab from '@fortawesome/free-brands-svg-icons'
// library.add(fas, far, fab)

config.searchPseudoElements = true
dom.watch()
