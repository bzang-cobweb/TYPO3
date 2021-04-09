// Force jQuery to be loaded onto the window scope at least once
import $ from './jquery'

// plugins (uncomment to use)
// each plugin has a readme.md file in its folder. Read it.

// transform label in floating labels
import './plugins/id_floatinglabel/id_floatinglabel'

// set nicer radio/checkboxes
import './plugins/id_radiocheckbox/id_radiocheckbox'

$(() => {
    if ($('input, textarea').length) {
        $('input, textarea').id_floatinglabel()
    }
    if ($('input[type="checkbox"]').length) {
        $('input[type="checkbox"]').id_radiocheckbox({
            multiple: true,
            floatingLabel: true,
            labelExtraPaddingLeft: 15,
            labelExtraLineHeight: 6,
            checkedStyle: 'checkmark'
        })
    }

    if ($('input[type="radio"]').length) {
        $('input[type="radio"]').id_radiocheckbox({
            multiple: false,
            floatingLabel: true,
            labelExtraPaddingLeft: 15,
            labelExtraLineHeight: 0,
            checkedStyle: 'full'
        })
    }
})
