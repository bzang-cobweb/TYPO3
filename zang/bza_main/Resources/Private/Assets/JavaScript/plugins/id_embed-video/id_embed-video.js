import $ from '../../jquery'
import g_ from '../../0_adaptative'

$.id_embedVideo = function (el, options) {
    const _this = this
    const $element = $(el)
    let $template = null
    let videoSrc = null
    let videoLegend = null
    let $videoLegend = null
    let $closeBtn = null
    let mousemoveTimer = null
    this.mouseHasMoved = false
    this.init = function () {
        this.options = $.extend({}, $.id_embedVideo.defaultOptions, options)
        if ($element.data('src') === '' || !$element.data('src')) {
            console.log('ERROR: no data-src in link! cannot play video.')
            return
        } else {
            videoSrc = $element.data('src')
        }
        if ($element.data('legend-wrapper')) {
            videoLegend = $element.parent().find('.' + $element.data('legend-wrapper')).html()
            $videoLegend = $('<div class="video-legend">' + videoLegend + '</div>')
        }
        const strAutoPlay = videoSrc.indexOf('rel=0') === -1 ? '?autoplay=1' : ';&autoplay=1'
        $template = $('<div id="id_embedVideo"><div class="player"><a class="player-close"></a><div class="video-wrapper"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="' + videoSrc + strAutoPlay + '" allowfullscreen></iframe></div></div></div></div>')
        $element.off('click').on('click', function (e) {
            e.preventDefault()
            _this.openPlayer()
        })
    }
    /**
     *
     */
    this.openPlayer = function () {
        // prevent body from scroll
        $('body').css('overflow', 'hidden')
        // attache modal to body
        $template
            .prependTo('body')
            .css('top', $(window).scrollTop())
            .off('click').on('click', function (e) {
                _this.closePlayer()
            })
        // add legend if needed
        if ($videoLegend) {
            $videoLegend.appendTo($template.find('.video-wrapper'))
        }
        // small timeout for class animation
        setTimeout(function () {
            $template.addClass('open')
        }, 100)
        // define $closeBtn
        $closeBtn = $template.find('a.player-close')

        // add events
        $closeBtn.off('click').on('click', function (e) {
            _this.closePlayer()
        })
        this.mouseHasMoved = false
        this.startMouseMoveTimeout()
        $template.off('mousemove').on('mousemove', function (e) {
            if (!_this.mouseHasMoved) {
                _this.mouseHasMoved = true
                _this.fadeInterface()
            }
        })
        // close player on ESCAPE
        $(document).off('keyup').on('keyup', function (e) {
            if (e.keyCode === 27) _this.closePlayer()
        })
    }
    /**
     * Fade interface after timeout of inactivity
     */
    this.fadeInterface = function () {
        if (!_this.mouseHasMoved) {
            $closeBtn.addClass('faded')
            $template.addClass('faded')
            if (!g_.isMobileDisplay) {
                $videoLegend.addClass('faded')
            }

            _this.clearMouseMoveTimeout()
        } else {
            $closeBtn.removeClass('faded')
            $template.removeClass('faded')
            $videoLegend.removeClass('faded')
            _this.mouseHasMoved = false
            _this.startMouseMoveTimeout()
        }
    }

    /**
     *
     */
    this.startMouseMoveTimeout = function () {
        if (mousemoveTimer) {
            clearInterval(mousemoveTimer)
        }
        mousemoveTimer = setTimeout(this.fadeInterface, 3000)
    }

    /**
     *
     */
    this.clearMouseMoveTimeout = function () {
        clearTimeout(mousemoveTimer)
        mousemoveTimer = null
    }

    /**
     *
     */
    this.closePlayer = function () {
        // allow body to scroll again
        $('body').css('overflow', 'visible')
        $closeBtn.removeClass('open faded')
        $closeBtn = null
        $template.removeClass('open')
            .delay(400)
            .remove()
        this.clearMouseMoveTimeout()
        $template.off('mousemove')
    }
    this.init()
}

$.id_embedVideo.defaultOptions = {}

$.fn.id_embedVideo = function (options) {
    return this.each(function () {
        // eslint-disable-next-line
        (new $.id_embedVideo(this, options))
    })
}
