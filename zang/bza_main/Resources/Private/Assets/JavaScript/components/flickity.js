import $ from '../jquery'
import Flickity from 'flickity'
import 'flickity/css/flickity.css'

$(function () {
    window.mobileSliders = $('.mobile-slider')
        .map(function () {
            return new Flickity(this, { cellAlign: 'left', contain: true, watchCSS: true })
        })
        .get()
})
