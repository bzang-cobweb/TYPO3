## Zang - Radio + checkbox transformation plugin

###  Description

This plugin is used to make nicer radio and checkboxes  
It will also add a reverse ref to the instance in a ```data('id_radiocheckbox')``` property of the element for external use.

Radios and checkboxes use the exact same plugin. 
The only difference between a radio and a checkbox is that you cannot select multiple radios in a group.


###  Installation
import the plugin in your main JS file
```import './plugins/id_radiocheckbox/id_radiocheckbox'```

###  Dependencies
This plugin requires jquery.js file two folders above, as you can see on top of the file
```import $ from '../../jquery'```

### Css styling
You can import the scss for this plugin by importing ```_id_radiocheckbox.scss``` into   
```Scss/plugins/_index.scss```  
Then import plugins into your main theme scss    
```@import "plugins"```  
Customise the scss for your form design's needs

###  Instantiation
For a checkbox:
```
$('input[type="checkbox"]').id_radiocheckbox({ multiple: true })
```
For a radio:
```
$('input[type="radio"]').id_radiocheckbox({ multiple: false })
```

###  Options
You can use the following options with the plugin:
- ``` multiple ```  *default: false*  
Chose between a radio (false) or checkbox (true) behavior
- ``` floatingLabel ``` *default: true*  
Define if the label is floating on the right of the input (extra styles calculations are done for height concordance)
- ```labelExtraPaddingLeft``` *default: 15*  
The label will take a padding-left of the width of your fake element (defined in scss) + labelExtraPaddingLeft
- ```labelExtraLineHeight``` *default: 0*  
The label will take a line-height of the height of your fake element (defined in scss) + labelExtraLineHeight
- ```checkedStyle``` *default: checkmark*  
You can chose between a ```checkmark``` or an inside smaller shape of primary background color ```full``` (or design your own one)  
In case of the checkmark, an inline svg background image will be added (requires no image resource)
  
- ```callback```  
An optional callback function  
You might want to use the callback function in case an activated checkbox (or radio) needs to make appear an extra field when selected

###  Methods
Each form will receive a ```data('id_radiocheckbox')``` set to the current jQuery plugin instance.  
So you can use all plugin's methods where and as you like
- ```$([selector]).data('id_radiocheckbox').toggleElement()```

###  Example
```
$('input[type="checkbox"]').id_radiocheckbox({
    multiple: true,
    floatingLabel: true,
    labelExtraPaddingLeft: 15,
    labelExtraLineHeight: 6,
    checkedStyle: 'checkmark',
    callback: function () {
        const $context = $('.radio-contextual[data-value="' + this.$el.attr('name') + '"]')
        if ($context.length && (this.$element.attr('checked'))) {
            $context.show()
        } else {
            $context.hide()
        }
    }
})
```
