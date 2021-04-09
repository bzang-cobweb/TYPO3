/**
 * @id_radiocheckbox Plugin for checkboxes or radios
 * @copyright Zang
 * @author SBA
 * @version 1.3
 */
import $ from '../../jquery'
$.id_radiocheckbox = function (el, options) {
    // To avoid scope issues, use 'base' instead of 'this'
    // to reference this class from internal events and functions.
    const base = this
    this.$el = $(el)
    base.$el = $(el)
    base.el = el
    // Add a reverse reference to the DOM object
    base.$el.data('id_radiocheckbox', base)
    base.$fakeEl = null
    base.$elWrapper = null
    base.$label = null
    base.callback = null
    base.value = null
    base.init = function () {
        base.options = $.extend({}, $.id_radiocheckbox.defaultOptions, options)
        if (typeof base.options.callback === 'function') {
            base.callback = base.options.callback
        }
        // hide the real input
        base.$el.hide()
        let labelClass = ''
        const checkedStyle = base.options.checkedStyle === 'checkmark' ? 'checkmark' : 'full'
        if (!base.options.multiple) {
            base.$fakeEl = $('<div class="id-fake-radio ' + checkedStyle + '"></div>').appendTo(base.$el.parent())
            labelClass = 'radio-label'
        } else {
            base.$fakeEl = $('<div class="id-fake-checkbox ' + checkedStyle + '"></div>').appendTo(base.$el.parent())
            labelClass = 'checkbox-label'
        }
        // set the parent wrapper in position-relative, display flex, align-items center
        base.$elWrapper = base.$el.parent().addClass('position-relative').css('height', base.$fakeEl.outerHeight())
        base.$label = base.$elWrapper.find('label').addClass(labelClass)
        // set label styles according to box dimensions
        if (base.options.floatingLabel) {
            base.$label.css({
                'padding-left': base.$fakeEl.width() + base.options.labelExtraPaddingLeft + 'px',
                'line-height': base.$fakeEl.height() + base.options.labelExtraLineHeight + 'px'
            })
        }
        base.value = base.$el.val()
        // check if radio is disabled before adding event listener to fake radio and label
        if (!base.$el.attr('disabled')) {
            base.$fakeEl.add(base.$label).off('click').on('click', function (e) {
                e.preventDefault()
                base.toggleElement()
            })
        } else {
            base.$fakeEl.addClass('disabled')
        }
        if (base.$el.attr('checked')) {
            base.$fakeEl.toggleClass('active')
            if (base.callback && base.options.callbackOnload) {
                base.callback.call(this)
            }
        }
    }
    base.toggleElement = function () {
        // if it's not multiple, it's a radio, so no action happens on click if already checked
        if (!base.options.multiple) {
            if (!base.$el.attr('checked')) {
                base.$el.attr('checked', '')
                // if this is a radio, reset group's other radios
                base.$elWrapper
                    .siblings()
                    .find('.id-fake-radio')
                    .removeClass('active')
                    .end()
                    .find('input[type=radio]')
                    .removeAttr('checked')

                base.$fakeEl.toggleClass('active')
                if (base.callback) {
                    base.callback.call(this)
                }
            }
        } else {
            // here we have a checkbox, so always toggle on click
            base.$el.attr('checked') === 'checked' ? base.$el.removeAttr('checked') : base.$el.attr('checked', '')
            base.$fakeEl.toggleClass('active')
            if (base.callback) {
                base.callback.call(this)
            }
        }
    }
    base.init()
}
window.$.id_radiocheckbox.defaultOptions = {
    // set to true for a checkbox
    multiple: false,
    floatingLabel: true,
    labelExtraPaddingLeft: 15,
    labelExtraLineHeight: 0,
    checkedStyle: 'checkmark'
}

window.$.fn.id_radiocheckbox = function (options) {
    return this.each(function () {
        // eslint-disable-next-line
        (new $.id_radiocheckbox(this, options))
    })
}
