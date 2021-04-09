/**
* @id_floatinglabel Plugin to avoid form double submit
* @copyright Zang
* @author SBA
* @version 1.2
*/
import $ from '../../jquery'
$.id_clamptext = function (el, options) {
    this.$element = $(el)
    this.$fakeElement = $('<p style="opacity: 0; pointer-events: none; display: inline-block;"></p>')
    this.availableWidth = 0
    this.originalText = ''

    /**
     *
     */
    this.init = function () {
        this.options = $.extend({}, $.id_clamptext.defaultOptions, options)
        // mode max chars
        if (this.options.modeMaxChars) {
            this.$element.text(this.truncateToNumberOfChars(this.$element.text()))
        } else {
            // mode max lines
            // save original text
            this.originalText = this.$element.text()
            this.availableWidth = this.$element.innerWidth()
            this.$element.text(this.truncateToNumberOfLines(this.$element.text()))
        }
    }
    /**
     *
     * @param str
     * @returns {boolean}
     */
    this.validateNumberOfLines = function (str) {
        this.$fakeElement.text(str)
        // calculate full length of text (on 1 line)
        const fakeWidth = this.$fakeElement.width()
        // now get number of lines
        const numberOfLines = Math.ceil(fakeWidth / (this.availableWidth - 40))
        if (numberOfLines <= this.options.maxLinesLength) {
            return true
        }
        return false
    }
    /**
     *
     * @param str
     * @returns {jQuery|*}
     */
    this.reduceToLineNumber = function (str) {
        this.options.maxCharsLength = str.slice(0, -1).length

        const newStr = this.truncateToNumberOfChars(str.slice(0, -1))
        if (this.validateNumberOfLines(newStr)) {
            this.$fakeElement.remove()
            this.$element.removeAttr('style')
            return newStr
        }
        return this.reduceToLineNumber(newStr)
    }
    /**
     *
     * @param str
     * @returns {jQuery|jQuery|*}
     */
    this.truncateToNumberOfLines = function (str) {
        this.$fakeElement.appendTo($('body'))
        this.$element.css('display', 'inline-block')
        if (this.validateNumberOfLines(str)) {
            this.$fakeElement.remove()
            this.$element.removeAttr('style')
            return str
        }
        return this.reduceToLineNumber(str)
    }

    /**
     * function to truncate to max number of chars or below
     * does preserve words integrity
     *
     * @param str
     * @returns {string|*}
     */
    this.truncateToNumberOfChars = function (str) {
        str = str.trim()
        let tempString = ''
        // if text is smaller than maxlen, return original string
        if (str.length < this.options.maxCharsLength) {
            return str
        }
        const append = this.options.append || ''
        // if 1st word + options.append > maxLen, return original string
        if (str.indexOf(' ') + append.length > this.options.maxCharsLength) {
            return str
        }
        // set new length, removing options.append length
        const newLength = this.options.maxCharsLength - append.length
        // cut str at new length
        tempString = str.substring(0, newLength)
        // delete from last 'space' char position
        tempString = tempString.replace(/\s+\S*$/, '')
        if (append !== '') {
            tempString = tempString + append
        }
        // return
        return tempString
    }
    this.init()
}

$.id_clamptext.defaultOptions = {
    modeMaxChars: true,
    maxLinesLength: 0,
    maxCharsLength: 90,
    append: '...'
}

$.fn.id_clamptext = function (options) {
    return this.each(function () {
        // eslint-disable-next-line
        (new $.id_clamptext(this, options))
    })
}
