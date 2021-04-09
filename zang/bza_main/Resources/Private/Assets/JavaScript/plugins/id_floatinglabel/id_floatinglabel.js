/**
 * @id_floatinglabel Plugin to avoid form double submit
 * @copyright Zang
 * @author SBA
 * @version 1.3
 */

import $ from '../../jquery'

$.id_floatinglabel = function (el, options) {
    // To avoid scope issues, use 'base' instead of 'this'
    // to reference this class from internal events and functions.
    const base = this
    this.$element = $(el)
    base.$el = $(el)
    base.el = el
    // Add a reverse reference to the DOM object
    base.$el.data('id_floatinglabel', base)
    base.$label = null
    base.callback = null
    base.leftLabelPosition = null
    base.init = function () {
        base.options = $.extend({}, $.id_floatinglabel.defaultOptions, options)
        if (typeof base.options.callback === 'function') {
            base.callback = base.options.callback
        }
        const type = $(el).attr('type')
        // execute only on textareas and not forbidden input types, and only if they have a label preceding
        // also check that element is not select2 injected <input> by checking if parent contains a select...
        // select2 is not known yet and classes are not accessible
        if (
            base.$el.prop('tagName') === 'TEXTAREA' || (
                $.inArray(type, base.options.forbiddenTypes) === -1 &&
                $.inArray(base.$el.attr('name'), base.options.fieldNamesToSkip) === -1 &&
                base.$el.parent().find('select').length === 0 &&
                base.$el.prev('label').length > 0
            )
        ) {
            // fist add class to parent form
            base.$el.parents('form').addClass('has-id-placeholder')
            // empty placeholder
            base.$el.attr('placeholder', '')
            base.$el.parent().addClass('position-relative')
            // get label to work with
            base.$label = base.$el.prev('label')
            base.leftLabelPosition = base.$el.css('padding-left') || 0
            base.$label.addClass('id_floatinglabel')
            if (base.$el.prop('tagName') === 'TEXTAREA') {
                base.$label.addClass('textarea')
            }
            // set same padding to $label as it's input
            base.$label.css({
                left: base.leftLabelPosition
            })
            // if the field it pre-filled, make focus
            if (base.$el.val() !== '') {
                base.$label.addClass('focused')
                base.$el.addClass('filled')
            }
            base.$label.off('click').on('click', (e) => {
                e.preventDefault()
                $(base).addClass('focused')
                base.$el.addClass('filled')
                base.$el.focus()
            })

            base.$el.off('focus').on('focus', (e) => {
                e.preventDefault()
                base.$label.addClass('focused')
                base.$el.addClass('filled')
                if (base.callback) {
                    // eslint-disable-next-line no-useless-call
                    base.callback.call(base)
                }
            })

            base.$el.off('blur').on('blur', (e) => {
                e.preventDefault()
                if (base.$el.val() === '') {
                    base.$label.removeClass('focused')
                    base.$el.removeClass('filled')
                } else {
                    if (base.callback) {
                        // eslint-disable-next-line no-useless-call
                        base.callback.call(base)
                    }
                }
            })
        }
    }

    base.init()
}

window.$.id_floatinglabel.defaultOptions = {
    forbiddenTypes: ['radio', 'checkbox', 'submit', 'hidden'],
    fieldNamesToSkip: ['user', 'username', 'pass', 'password']
}

window.$.fn.id_floatinglabel = function (options) {
    return this.each(function () {
        // eslint-disable-next-line
        (new $.id_floatinglabel(this, options))
    })
}
