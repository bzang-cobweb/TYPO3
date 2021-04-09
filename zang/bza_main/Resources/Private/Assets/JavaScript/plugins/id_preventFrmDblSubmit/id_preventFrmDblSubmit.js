/**
 * @id_preventFrmDblSubmit Plugin to avoid form double submit
 * @copyright Zang
 * @author SBA
 * @version 1.0
 */
import $ from '../../jquery'
$.id_preventFrmDblSubmit = function (el, options) {
    // To avoid scope issues, use 'base' instead of 'this'
    // to reference this class from internal events and functions.
    const base = this
    base.$el = $(el)
    base.el = el
    // Add a reverse reference to the DOM object
    base.$el.data('id_form', base)
    base.$submitBtn = null
    base.callback = null
    base.init = function () {
        base.options = $.extend({}, $.id_preventFrmDblSubmit.defaultOptions, options)
        if (typeof base.options.callback === 'function') {
            base.callback = base.options.callback
        }
        if (!base.options.setRefOnly) {
            base.$submitBtn = base.$el.find('[type="submit"]').length > 0 ? base.$el.find('[type="submit"]') : null
            if (base.$submitBtn) {
                base.$el.on('submit', (e) => {
                    base.disableSubmit()
                    if (base.callback) {
                        // eslint-disable-next-line no-useless-call
                        base.callback.call(base)
                    }
                })
            } else {
                const id = base.$el.attr('name') ? base.$el.attr('name') : base.$el.attr('id')
                console.log('No submit found in form "' + id + '"')
            }
        }
    }
    base.disableSubmit = function () {
        base.$submitBtn.attr('disabled', 'disabled')
        if (base.options.secondsToReenbale) {
            setTimeout(() => {
                base.enableSubmit()
            }, base.options.secondsToReenbale * 1000)
        }
    }
    base.enableSubmit = function () {
        base.$submitBtn.removeAttr('disabled')
    }
    base.init()
}
window.$.id_preventFrmDblSubmit.defaultOptions = {
    secondsToReenbale: null,
    setRefOnly: false
}

window.$.fn.id_preventFrmDblSubmit = function (options) {
    return this.each(function () {
        // eslint-disable-next-line
        (new $.id_preventFrmDblSubmit(this, options))
    })
}
