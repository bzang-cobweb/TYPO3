## Idéative - Floating label plugin

###  Description

This plugin is used to make the placeholder smaller on top of field or textarea on focus.  
It will also add a reverse ref to the instance in a ```data('id_floatingLabel')``` property of the element for external use.

###  Installation
import the plugin in your main JS file
```import './plugins/id_floatingLabel/id_floatingLabel'```

###  Dependencies
This plugin requires jquery.js file two folders above, as you can see on top of the file
```import $ from '../../jquery'```

### Css styling
You can import the scss for this plugin by importing ```_id_floatinglabel``` into   
```Scss/plugins/_index.scss```  
Then import plugins into your main theme scss    
```@import "plugins"```  
Customise the scss for your form design's needs

### Warning
This plugin is not suited for autofilled fields as no JS event is detectable when these fields are filled.  

Until a better solution is found, the plugin will not initialize on any elements with name in ```fieldNamesToSkip``` array (see options below)  
@todo try to implement this method of detection:  
https://dev.to/nevon/detecting-autofilled-fields-in-javascript-l46

###  Instantiation
```
$('input, textarea').id_floatingLabel()
```

###  Options
You can use the following options with the plugin (options will override default options!):
- ``` forbiddenTypes ```  *default ['radio', 'checkbox', 'submit', 'hidden']*  
Array containing the types of inputs you don't want to add plugin behaviour to
- ``` fieldNamesToSkip ``` *default ['user', 'username', 'pass', 'password']*  
Array containing the names of inputs you don't want to add plugin behaviour to
- ```callback```  
An optional callback function

###  Methods
none


###  Example
```
$('input, textarea').id_floatingLabel({
    forbiddenTypes: ['radio', 'checkbox', 'submit', 'hidden', 'tel']
    callback: function () {
        // scroll the window to top of input so we can see the suggestions in mobile view
        if (this.$el.hasClass('filled')) {
            if (g_.isMobileDisplay) {
                $('body').scrollTo(this.$el.offset().top - 20, 200)
            }
        }
    }
})
```
