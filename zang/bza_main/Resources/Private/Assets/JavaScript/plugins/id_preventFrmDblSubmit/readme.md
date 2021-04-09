## Zang - Prevent Form Double Submission plugin

###  Description

This plugin is used to prevent double submission of forms.  
It will add the "disabled" attribute to any element of type "submit" found in form (input, button) after the form's ```submit``` event has occured.  
It will also add a reverse ref to the instance in a ```data('id_form')``` property of the form for external use.

###  Installation
import the plugin in your main JS file
```import './plugins/id_preventFrmDblSubmit/id_preventFrmDblSubmit'```

###  Dependencies
This plugin requires jquery.js file two folders above, as you can see on top of the file
```import $ from '../../jquery'```

###  Instantiation
You can instantiate it globally (default) or specifically to avoid hacking forms requiring front-end validation.
```
$('form').id_preventFrmDblSubmit();
```
```
$('form.class').id_preventFrmDblSubmit();
```
```
$('form:not(.front-end-validated)').id_preventFrmDblSubmit();
```
###  Options
You can use the following options with the plugin:
- ``` secondsToReenable ```   
The time after which the submit  will be reactivated, expressed in seconds. Default is ```null``` (the submit is never reactivated)
- ``` setRefOnly ```   
If your form needs some front end validation, do not hack its submit, but just add a data('id_form') ref to it. Default is ```false```
- ```callback```  
An optional callback function

###  Methods
Each form will receive a ```data('id_form')``` set to the current jQuery plugin instance.  
So you can use all plugin's methods where and as you like, ex: in your own form validation logic
- ```$('#the-form-you-like').data('id_form').enableSubmit()```
- ```$('#the-form-you-like').data('id_form').disableSubmit()```


###  Example
```
$('form').id_preventFrmDblSubmit({
    secondsToReenable: 3,
    setRefOnly: true,
    callback: function () {
        // do something
        // this.$el = the form
        // this.$el.data('id_form').enableSubmit() (stupid but still possible)
    }
});
```
