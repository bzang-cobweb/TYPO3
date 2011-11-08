<?php
class FluidCache_Mrkeperson_Person_action_list_cde32b5dc3b7e78fff1bed355c8526102bb0db56 extends Tx_Fluid_Core_Compiler_AbstractCompiledTemplate {

public function getVariableContainer() {
	// TODO
	return new Tx_Fluid_Core_ViewHelper_TemplateVariableContainer();
}
public function getLayoutName(Tx_Fluid_Core_Rendering_RenderingContextInterface $renderingContext) {

return 'Default';
}
public function hasLayout() {
return TRUE;
}

/**
 * section main
 */
public function section_b28b7af69320201d1cf206ebf28373980add1451(Tx_Fluid_Core_Rendering_RenderingContextInterface $renderingContext) {
$self = $this;
$output0 = '';

$output0 .= '
<h1>Listing for Person</h1>
';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_FormViewHelper
$arguments1 = array();
$arguments1['action'] = 'list';
$arguments1['additionalAttributes'] = NULL;
$arguments1['arguments'] = array (
);
$arguments1['controller'] = NULL;
$arguments1['extensionName'] = NULL;
$arguments1['pluginName'] = NULL;
$arguments1['pageUid'] = NULL;
$arguments1['object'] = NULL;
$arguments1['pageType'] = 0;
$arguments1['noCache'] = false;
$arguments1['noCacheHash'] = false;
$arguments1['section'] = '';
$arguments1['format'] = '';
$arguments1['additionalParams'] = array (
);
$arguments1['absolute'] = false;
$arguments1['addQueryString'] = false;
$arguments1['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments1['fieldNamePrefix'] = NULL;
$arguments1['actionUri'] = NULL;
$arguments1['objectName'] = NULL;
$arguments1['enctype'] = NULL;
$arguments1['method'] = NULL;
$arguments1['name'] = NULL;
$arguments1['onreset'] = NULL;
$arguments1['onsubmit'] = NULL;
$arguments1['class'] = NULL;
$arguments1['dir'] = NULL;
$arguments1['id'] = NULL;
$arguments1['lang'] = NULL;
$arguments1['style'] = NULL;
$arguments1['title'] = NULL;
$arguments1['accesskey'] = NULL;
$arguments1['tabindex'] = NULL;
$arguments1['onclick'] = NULL;
$renderChildrenClosure2 = function() use ($renderingContext, $self) {
$output3 = '';

$output3 .= '
  ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Form_SelectViewHelper
$arguments4 = array();
$arguments4['name'] = 'certificate';
$arguments4['options'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'certificates', $renderingContext);
$arguments4['optionLabelField'] = 'name';
$arguments4['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'currentcertificate', $renderingContext);
$arguments4['additionalAttributes'] = NULL;
$arguments4['property'] = NULL;
$arguments4['class'] = NULL;
$arguments4['dir'] = NULL;
$arguments4['id'] = NULL;
$arguments4['lang'] = NULL;
$arguments4['style'] = NULL;
$arguments4['title'] = NULL;
$arguments4['accesskey'] = NULL;
$arguments4['tabindex'] = NULL;
$arguments4['onclick'] = NULL;
$arguments4['multiple'] = NULL;
$arguments4['size'] = NULL;
$arguments4['disabled'] = NULL;
$arguments4['optionValueField'] = NULL;
$arguments4['sortByOptionLabel'] = false;
$arguments4['selectAllByDefault'] = false;
$arguments4['errorClass'] = 'f3-form-error';
$renderChildrenClosure5 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper6 = $self->getViewHelper('$viewHelper6', $renderingContext, 'Tx_Fluid_ViewHelpers_Form_SelectViewHelper');
$viewHelper6->setArguments($arguments4);
$viewHelper6->setRenderingContext($renderingContext);
$viewHelper6->setRenderChildrenClosure($renderChildrenClosure5);
// End of ViewHelper Tx_Fluid_ViewHelpers_Form_SelectViewHelper

$output3 .= $viewHelper6->initializeArgumentsAndRender();

$output3 .= '
  ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Form_SubmitViewHelper
$arguments7 = array();
$arguments7['value'] = 'Suchen';
$arguments7['additionalAttributes'] = NULL;
$arguments7['name'] = NULL;
$arguments7['property'] = NULL;
$arguments7['disabled'] = NULL;
$arguments7['class'] = NULL;
$arguments7['dir'] = NULL;
$arguments7['id'] = NULL;
$arguments7['lang'] = NULL;
$arguments7['style'] = NULL;
$arguments7['title'] = NULL;
$arguments7['accesskey'] = NULL;
$arguments7['tabindex'] = NULL;
$arguments7['onclick'] = NULL;
$renderChildrenClosure8 = function() use ($renderingContext, $self) {
return '<button>Suchen</button>';
};
$viewHelper9 = $self->getViewHelper('$viewHelper9', $renderingContext, 'Tx_Fluid_ViewHelpers_Form_SubmitViewHelper');
$viewHelper9->setArguments($arguments7);
$viewHelper9->setRenderingContext($renderingContext);
$viewHelper9->setRenderChildrenClosure($renderChildrenClosure8);
// End of ViewHelper Tx_Fluid_ViewHelpers_Form_SubmitViewHelper

$output3 .= $viewHelper9->initializeArgumentsAndRender();

$output3 .= '
';
return $output3;
};
$viewHelper10 = $self->getViewHelper('$viewHelper10', $renderingContext, 'Tx_Fluid_ViewHelpers_FormViewHelper');
$viewHelper10->setArguments($arguments1);
$viewHelper10->setRenderingContext($renderingContext);
$viewHelper10->setRenderChildrenClosure($renderChildrenClosure2);
// End of ViewHelper Tx_Fluid_ViewHelpers_FormViewHelper

$output0 .= $viewHelper10->initializeArgumentsAndRender();

$output0 .= '
<!--
';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_ForViewHelper
$arguments11 = array();
$arguments11['each'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'certificates', $renderingContext);
$arguments11['as'] = 'certOption';
$arguments11['key'] = '';
$arguments11['reverse'] = false;
$arguments11['iteration'] = NULL;
$renderChildrenClosure12 = function() use ($renderingContext, $self) {
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments13 = array();
$arguments13['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'certOption.name', $renderingContext);
$arguments13['keepQuotes'] = false;
$arguments13['encoding'] = NULL;
$arguments13['doubleEncode'] = true;
$renderChildrenClosure14 = function() use ($renderingContext, $self) {
return NULL;
};
$value15 = ($arguments13['value'] !== NULL ? $arguments13['value'] : $renderChildrenClosure14());
return (!is_string($value15) ? $value15 : htmlspecialchars($value15, ($arguments13['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments13['encoding'] !== NULL ? $arguments13['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments13['doubleEncode']));
};

$output0 .= Tx_Fluid_ViewHelpers_ForViewHelper::renderStatic($arguments11, $renderChildrenClosure12, $renderingContext);

$output0 .= '
-->

';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_FlashMessagesViewHelper
$arguments16 = array();
$arguments16['additionalAttributes'] = NULL;
$arguments16['renderMode'] = 'ul';
$arguments16['class'] = NULL;
$arguments16['dir'] = NULL;
$arguments16['id'] = NULL;
$arguments16['lang'] = NULL;
$arguments16['style'] = NULL;
$arguments16['title'] = NULL;
$arguments16['accesskey'] = NULL;
$arguments16['tabindex'] = NULL;
$arguments16['onclick'] = NULL;
$renderChildrenClosure17 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper18 = $self->getViewHelper('$viewHelper18', $renderingContext, 'Tx_Fluid_ViewHelpers_FlashMessagesViewHelper');
$viewHelper18->setArguments($arguments16);
$viewHelper18->setRenderingContext($renderingContext);
$viewHelper18->setRenderChildrenClosure($renderChildrenClosure17);
// End of ViewHelper Tx_Fluid_ViewHelpers_FlashMessagesViewHelper

$output0 .= $viewHelper18->initializeArgumentsAndRender();

$output0 .= '

<table  class="tx_mrkeperson" >
	<tr>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments19 = array();
$arguments19['key'] = 'tx_mrkeperson_domain_model_person.lastname';
$arguments19['default'] = NULL;
$arguments19['htmlEscape'] = true;
$arguments19['arguments'] = NULL;
$renderChildrenClosure20 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper21 = $self->getViewHelper('$viewHelper21', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper21->setArguments($arguments19);
$viewHelper21->setRenderingContext($renderingContext);
$viewHelper21->setRenderChildrenClosure($renderChildrenClosure20);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output0 .= $viewHelper21->initializeArgumentsAndRender();

$output0 .= '</th>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments22 = array();
$arguments22['key'] = 'tx_mrkeperson_domain_model_person.firstname';
$arguments22['default'] = NULL;
$arguments22['htmlEscape'] = true;
$arguments22['arguments'] = NULL;
$renderChildrenClosure23 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper24 = $self->getViewHelper('$viewHelper24', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper24->setArguments($arguments22);
$viewHelper24->setRenderingContext($renderingContext);
$viewHelper24->setRenderChildrenClosure($renderChildrenClosure23);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output0 .= $viewHelper24->initializeArgumentsAndRender();

$output0 .= '</th>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments25 = array();
$arguments25['key'] = 'tx_mrkeperson_domain_model_person.cv';
$arguments25['default'] = NULL;
$arguments25['htmlEscape'] = true;
$arguments25['arguments'] = NULL;
$renderChildrenClosure26 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper27 = $self->getViewHelper('$viewHelper27', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper27->setArguments($arguments25);
$viewHelper27->setRenderingContext($renderingContext);
$viewHelper27->setRenderChildrenClosure($renderChildrenClosure26);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output0 .= $viewHelper27->initializeArgumentsAndRender();

$output0 .= '</th>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments28 = array();
$arguments28['key'] = 'tx_mrkeperson_domain_model_person.image';
$arguments28['default'] = NULL;
$arguments28['htmlEscape'] = true;
$arguments28['arguments'] = NULL;
$renderChildrenClosure29 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper30 = $self->getViewHelper('$viewHelper30', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper30->setArguments($arguments28);
$viewHelper30->setRenderingContext($renderingContext);
$viewHelper30->setRenderChildrenClosure($renderChildrenClosure29);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output0 .= $viewHelper30->initializeArgumentsAndRender();

$output0 .= '</th>
		<th> </th>
		<th> </th>
	</tr>

	';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_ForViewHelper
$arguments31 = array();
$arguments31['each'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'persons', $renderingContext);
$arguments31['as'] = 'person';
$arguments31['key'] = '';
$arguments31['reverse'] = false;
$arguments31['iteration'] = NULL;
$renderChildrenClosure32 = function() use ($renderingContext, $self) {
$output33 = '';

$output33 .= '
		<tr>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments34 = array();
$arguments34['action'] = 'show';
// Rendering Array
$array35 = array();
$array35['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments34['arguments'] = $array35;
$arguments34['additionalAttributes'] = NULL;
$arguments34['controller'] = NULL;
$arguments34['extensionName'] = NULL;
$arguments34['pluginName'] = NULL;
$arguments34['pageUid'] = NULL;
$arguments34['pageType'] = 0;
$arguments34['noCache'] = false;
$arguments34['noCacheHash'] = false;
$arguments34['section'] = '';
$arguments34['format'] = '';
$arguments34['linkAccessRestrictedPages'] = false;
$arguments34['additionalParams'] = array (
);
$arguments34['absolute'] = false;
$arguments34['addQueryString'] = false;
$arguments34['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments34['class'] = NULL;
$arguments34['dir'] = NULL;
$arguments34['id'] = NULL;
$arguments34['lang'] = NULL;
$arguments34['style'] = NULL;
$arguments34['title'] = NULL;
$arguments34['accesskey'] = NULL;
$arguments34['tabindex'] = NULL;
$arguments34['onclick'] = NULL;
$arguments34['name'] = NULL;
$arguments34['rel'] = NULL;
$arguments34['rev'] = NULL;
$arguments34['target'] = NULL;
$renderChildrenClosure36 = function() use ($renderingContext, $self) {
$output37 = '';

$output37 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments38 = array();
$arguments38['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.lastname', $renderingContext);
$arguments38['keepQuotes'] = false;
$arguments38['encoding'] = NULL;
$arguments38['doubleEncode'] = true;
$renderChildrenClosure39 = function() use ($renderingContext, $self) {
return NULL;
};
$value40 = ($arguments38['value'] !== NULL ? $arguments38['value'] : $renderChildrenClosure39());

$output37 .= (!is_string($value40) ? $value40 : htmlspecialchars($value40, ($arguments38['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments38['encoding'] !== NULL ? $arguments38['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments38['doubleEncode']));
return $output37;
};
$viewHelper41 = $self->getViewHelper('$viewHelper41', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper41->setArguments($arguments34);
$viewHelper41->setRenderingContext($renderingContext);
$viewHelper41->setRenderChildrenClosure($renderChildrenClosure36);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output33 .= $viewHelper41->initializeArgumentsAndRender();

$output33 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments42 = array();
$arguments42['action'] = 'show';
// Rendering Array
$array43 = array();
$array43['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments42['arguments'] = $array43;
$arguments42['additionalAttributes'] = NULL;
$arguments42['controller'] = NULL;
$arguments42['extensionName'] = NULL;
$arguments42['pluginName'] = NULL;
$arguments42['pageUid'] = NULL;
$arguments42['pageType'] = 0;
$arguments42['noCache'] = false;
$arguments42['noCacheHash'] = false;
$arguments42['section'] = '';
$arguments42['format'] = '';
$arguments42['linkAccessRestrictedPages'] = false;
$arguments42['additionalParams'] = array (
);
$arguments42['absolute'] = false;
$arguments42['addQueryString'] = false;
$arguments42['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments42['class'] = NULL;
$arguments42['dir'] = NULL;
$arguments42['id'] = NULL;
$arguments42['lang'] = NULL;
$arguments42['style'] = NULL;
$arguments42['title'] = NULL;
$arguments42['accesskey'] = NULL;
$arguments42['tabindex'] = NULL;
$arguments42['onclick'] = NULL;
$arguments42['name'] = NULL;
$arguments42['rel'] = NULL;
$arguments42['rev'] = NULL;
$arguments42['target'] = NULL;
$renderChildrenClosure44 = function() use ($renderingContext, $self) {
$output45 = '';

$output45 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments46 = array();
$arguments46['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.firstname', $renderingContext);
$arguments46['keepQuotes'] = false;
$arguments46['encoding'] = NULL;
$arguments46['doubleEncode'] = true;
$renderChildrenClosure47 = function() use ($renderingContext, $self) {
return NULL;
};
$value48 = ($arguments46['value'] !== NULL ? $arguments46['value'] : $renderChildrenClosure47());

$output45 .= (!is_string($value48) ? $value48 : htmlspecialchars($value48, ($arguments46['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments46['encoding'] !== NULL ? $arguments46['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments46['doubleEncode']));
return $output45;
};
$viewHelper49 = $self->getViewHelper('$viewHelper49', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper49->setArguments($arguments42);
$viewHelper49->setRenderingContext($renderingContext);
$viewHelper49->setRenderChildrenClosure($renderChildrenClosure44);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output33 .= $viewHelper49->initializeArgumentsAndRender();

$output33 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_PageViewHelper
$arguments50 = array();
$output51 = '';

$output51 .= 'uploads/tx_mrkeperson/';

$output51 .= Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.cv', $renderingContext);
$arguments50['pageUid'] = $output51;
$arguments50['additionalAttributes'] = NULL;
$arguments50['additionalParams'] = array (
);
$arguments50['pageType'] = 0;
$arguments50['noCache'] = false;
$arguments50['noCacheHash'] = false;
$arguments50['section'] = '';
$arguments50['linkAccessRestrictedPages'] = false;
$arguments50['absolute'] = false;
$arguments50['addQueryString'] = false;
$arguments50['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments50['class'] = NULL;
$arguments50['dir'] = NULL;
$arguments50['id'] = NULL;
$arguments50['lang'] = NULL;
$arguments50['style'] = NULL;
$arguments50['title'] = NULL;
$arguments50['accesskey'] = NULL;
$arguments50['tabindex'] = NULL;
$arguments50['onclick'] = NULL;
$arguments50['target'] = NULL;
$arguments50['rel'] = NULL;
$renderChildrenClosure52 = function() use ($renderingContext, $self) {
$output53 = '';

$output53 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments54 = array();
$arguments54['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.cv', $renderingContext);
$arguments54['keepQuotes'] = false;
$arguments54['encoding'] = NULL;
$arguments54['doubleEncode'] = true;
$renderChildrenClosure55 = function() use ($renderingContext, $self) {
return NULL;
};
$value56 = ($arguments54['value'] !== NULL ? $arguments54['value'] : $renderChildrenClosure55());

$output53 .= (!is_string($value56) ? $value56 : htmlspecialchars($value56, ($arguments54['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments54['encoding'] !== NULL ? $arguments54['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments54['doubleEncode']));
return $output53;
};
$viewHelper57 = $self->getViewHelper('$viewHelper57', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_PageViewHelper');
$viewHelper57->setArguments($arguments50);
$viewHelper57->setRenderingContext($renderingContext);
$viewHelper57->setRenderChildrenClosure($renderChildrenClosure52);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_PageViewHelper

$output33 .= $viewHelper57->initializeArgumentsAndRender();

$output33 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments58 = array();
$arguments58['action'] = 'show';
// Rendering Array
$array59 = array();
$array59['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments58['arguments'] = $array59;
$arguments58['additionalAttributes'] = NULL;
$arguments58['controller'] = NULL;
$arguments58['extensionName'] = NULL;
$arguments58['pluginName'] = NULL;
$arguments58['pageUid'] = NULL;
$arguments58['pageType'] = 0;
$arguments58['noCache'] = false;
$arguments58['noCacheHash'] = false;
$arguments58['section'] = '';
$arguments58['format'] = '';
$arguments58['linkAccessRestrictedPages'] = false;
$arguments58['additionalParams'] = array (
);
$arguments58['absolute'] = false;
$arguments58['addQueryString'] = false;
$arguments58['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments58['class'] = NULL;
$arguments58['dir'] = NULL;
$arguments58['id'] = NULL;
$arguments58['lang'] = NULL;
$arguments58['style'] = NULL;
$arguments58['title'] = NULL;
$arguments58['accesskey'] = NULL;
$arguments58['tabindex'] = NULL;
$arguments58['onclick'] = NULL;
$arguments58['name'] = NULL;
$arguments58['rel'] = NULL;
$arguments58['rev'] = NULL;
$arguments58['target'] = NULL;
$renderChildrenClosure60 = function() use ($renderingContext, $self) {
$output61 = '';

$output61 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments62 = array();
$arguments62['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.image', $renderingContext);
$arguments62['keepQuotes'] = false;
$arguments62['encoding'] = NULL;
$arguments62['doubleEncode'] = true;
$renderChildrenClosure63 = function() use ($renderingContext, $self) {
return NULL;
};
$value64 = ($arguments62['value'] !== NULL ? $arguments62['value'] : $renderChildrenClosure63());

$output61 .= (!is_string($value64) ? $value64 : htmlspecialchars($value64, ($arguments62['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments62['encoding'] !== NULL ? $arguments62['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments62['doubleEncode']));
return $output61;
};
$viewHelper65 = $self->getViewHelper('$viewHelper65', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper65->setArguments($arguments58);
$viewHelper65->setRenderingContext($renderingContext);
$viewHelper65->setRenderChildrenClosure($renderChildrenClosure60);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output33 .= $viewHelper65->initializeArgumentsAndRender();

$output33 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments66 = array();
$arguments66['action'] = 'edit';
// Rendering Array
$array67 = array();
$array67['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments66['arguments'] = $array67;
$arguments66['additionalAttributes'] = NULL;
$arguments66['controller'] = NULL;
$arguments66['extensionName'] = NULL;
$arguments66['pluginName'] = NULL;
$arguments66['pageUid'] = NULL;
$arguments66['pageType'] = 0;
$arguments66['noCache'] = false;
$arguments66['noCacheHash'] = false;
$arguments66['section'] = '';
$arguments66['format'] = '';
$arguments66['linkAccessRestrictedPages'] = false;
$arguments66['additionalParams'] = array (
);
$arguments66['absolute'] = false;
$arguments66['addQueryString'] = false;
$arguments66['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments66['class'] = NULL;
$arguments66['dir'] = NULL;
$arguments66['id'] = NULL;
$arguments66['lang'] = NULL;
$arguments66['style'] = NULL;
$arguments66['title'] = NULL;
$arguments66['accesskey'] = NULL;
$arguments66['tabindex'] = NULL;
$arguments66['onclick'] = NULL;
$arguments66['name'] = NULL;
$arguments66['rel'] = NULL;
$arguments66['rev'] = NULL;
$arguments66['target'] = NULL;
$renderChildrenClosure68 = function() use ($renderingContext, $self) {
return 'Edit';
};
$viewHelper69 = $self->getViewHelper('$viewHelper69', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper69->setArguments($arguments66);
$viewHelper69->setRenderingContext($renderingContext);
$viewHelper69->setRenderChildrenClosure($renderChildrenClosure68);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output33 .= $viewHelper69->initializeArgumentsAndRender();

$output33 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments70 = array();
$arguments70['action'] = 'delete';
// Rendering Array
$array71 = array();
$array71['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments70['arguments'] = $array71;
$arguments70['additionalAttributes'] = NULL;
$arguments70['controller'] = NULL;
$arguments70['extensionName'] = NULL;
$arguments70['pluginName'] = NULL;
$arguments70['pageUid'] = NULL;
$arguments70['pageType'] = 0;
$arguments70['noCache'] = false;
$arguments70['noCacheHash'] = false;
$arguments70['section'] = '';
$arguments70['format'] = '';
$arguments70['linkAccessRestrictedPages'] = false;
$arguments70['additionalParams'] = array (
);
$arguments70['absolute'] = false;
$arguments70['addQueryString'] = false;
$arguments70['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments70['class'] = NULL;
$arguments70['dir'] = NULL;
$arguments70['id'] = NULL;
$arguments70['lang'] = NULL;
$arguments70['style'] = NULL;
$arguments70['title'] = NULL;
$arguments70['accesskey'] = NULL;
$arguments70['tabindex'] = NULL;
$arguments70['onclick'] = NULL;
$arguments70['name'] = NULL;
$arguments70['rel'] = NULL;
$arguments70['rev'] = NULL;
$arguments70['target'] = NULL;
$renderChildrenClosure72 = function() use ($renderingContext, $self) {
return 'Delete';
};
$viewHelper73 = $self->getViewHelper('$viewHelper73', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper73->setArguments($arguments70);
$viewHelper73->setRenderingContext($renderingContext);
$viewHelper73->setRenderChildrenClosure($renderChildrenClosure72);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output33 .= $viewHelper73->initializeArgumentsAndRender();

$output33 .= '</td>
		</tr>
	';
return $output33;
};

$output0 .= Tx_Fluid_ViewHelpers_ForViewHelper::renderStatic($arguments31, $renderChildrenClosure32, $renderingContext);

$output0 .= '
</table>

';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments74 = array();
$arguments74['action'] = 'new';
$arguments74['additionalAttributes'] = NULL;
$arguments74['arguments'] = array (
);
$arguments74['controller'] = NULL;
$arguments74['extensionName'] = NULL;
$arguments74['pluginName'] = NULL;
$arguments74['pageUid'] = NULL;
$arguments74['pageType'] = 0;
$arguments74['noCache'] = false;
$arguments74['noCacheHash'] = false;
$arguments74['section'] = '';
$arguments74['format'] = '';
$arguments74['linkAccessRestrictedPages'] = false;
$arguments74['additionalParams'] = array (
);
$arguments74['absolute'] = false;
$arguments74['addQueryString'] = false;
$arguments74['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments74['class'] = NULL;
$arguments74['dir'] = NULL;
$arguments74['id'] = NULL;
$arguments74['lang'] = NULL;
$arguments74['style'] = NULL;
$arguments74['title'] = NULL;
$arguments74['accesskey'] = NULL;
$arguments74['tabindex'] = NULL;
$arguments74['onclick'] = NULL;
$arguments74['name'] = NULL;
$arguments74['rel'] = NULL;
$arguments74['rev'] = NULL;
$arguments74['target'] = NULL;
$renderChildrenClosure75 = function() use ($renderingContext, $self) {
return 'New Person';
};
$viewHelper76 = $self->getViewHelper('$viewHelper76', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper76->setArguments($arguments74);
$viewHelper76->setRenderingContext($renderingContext);
$viewHelper76->setRenderChildrenClosure($renderChildrenClosure75);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output0 .= $viewHelper76->initializeArgumentsAndRender();

$output0 .= '
';

return $output0;
}
/**
 * Main Render function
 */
public function render(Tx_Fluid_Core_Rendering_RenderingContextInterface $renderingContext) {
$self = $this;
$output77 = '';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_LayoutViewHelper
$arguments78 = array();
$arguments78['name'] = 'Default';
$renderChildrenClosure79 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper80 = $self->getViewHelper('$viewHelper80', $renderingContext, 'Tx_Fluid_ViewHelpers_LayoutViewHelper');
$viewHelper80->setArguments($arguments78);
$viewHelper80->setRenderingContext($renderingContext);
$viewHelper80->setRenderChildrenClosure($renderChildrenClosure79);
// End of ViewHelper Tx_Fluid_ViewHelpers_LayoutViewHelper

$output77 .= $viewHelper80->initializeArgumentsAndRender();

$output77 .= '

This Template is responsible for creating a table of domain objects.


If you modify this template, do not forget to change the overwrite settings
in /Configuration/ExtensionBuilder/settings.yaml:
  Resources:
    Private:
      Templates:
        List.html: keep

Otherwise your changes will be overwritten the next time you save the extension in the extension builder

';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_SectionViewHelper
$arguments81 = array();
$arguments81['name'] = 'main';
$renderChildrenClosure82 = function() use ($renderingContext, $self) {
$output83 = '';

$output83 .= '
<h1>Listing for Person</h1>
';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_FormViewHelper
$arguments84 = array();
$arguments84['action'] = 'list';
$arguments84['additionalAttributes'] = NULL;
$arguments84['arguments'] = array (
);
$arguments84['controller'] = NULL;
$arguments84['extensionName'] = NULL;
$arguments84['pluginName'] = NULL;
$arguments84['pageUid'] = NULL;
$arguments84['object'] = NULL;
$arguments84['pageType'] = 0;
$arguments84['noCache'] = false;
$arguments84['noCacheHash'] = false;
$arguments84['section'] = '';
$arguments84['format'] = '';
$arguments84['additionalParams'] = array (
);
$arguments84['absolute'] = false;
$arguments84['addQueryString'] = false;
$arguments84['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments84['fieldNamePrefix'] = NULL;
$arguments84['actionUri'] = NULL;
$arguments84['objectName'] = NULL;
$arguments84['enctype'] = NULL;
$arguments84['method'] = NULL;
$arguments84['name'] = NULL;
$arguments84['onreset'] = NULL;
$arguments84['onsubmit'] = NULL;
$arguments84['class'] = NULL;
$arguments84['dir'] = NULL;
$arguments84['id'] = NULL;
$arguments84['lang'] = NULL;
$arguments84['style'] = NULL;
$arguments84['title'] = NULL;
$arguments84['accesskey'] = NULL;
$arguments84['tabindex'] = NULL;
$arguments84['onclick'] = NULL;
$renderChildrenClosure85 = function() use ($renderingContext, $self) {
$output86 = '';

$output86 .= '
  ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Form_SelectViewHelper
$arguments87 = array();
$arguments87['name'] = 'certificate';
$arguments87['options'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'certificates', $renderingContext);
$arguments87['optionLabelField'] = 'name';
$arguments87['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'currentcertificate', $renderingContext);
$arguments87['additionalAttributes'] = NULL;
$arguments87['property'] = NULL;
$arguments87['class'] = NULL;
$arguments87['dir'] = NULL;
$arguments87['id'] = NULL;
$arguments87['lang'] = NULL;
$arguments87['style'] = NULL;
$arguments87['title'] = NULL;
$arguments87['accesskey'] = NULL;
$arguments87['tabindex'] = NULL;
$arguments87['onclick'] = NULL;
$arguments87['multiple'] = NULL;
$arguments87['size'] = NULL;
$arguments87['disabled'] = NULL;
$arguments87['optionValueField'] = NULL;
$arguments87['sortByOptionLabel'] = false;
$arguments87['selectAllByDefault'] = false;
$arguments87['errorClass'] = 'f3-form-error';
$renderChildrenClosure88 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper89 = $self->getViewHelper('$viewHelper89', $renderingContext, 'Tx_Fluid_ViewHelpers_Form_SelectViewHelper');
$viewHelper89->setArguments($arguments87);
$viewHelper89->setRenderingContext($renderingContext);
$viewHelper89->setRenderChildrenClosure($renderChildrenClosure88);
// End of ViewHelper Tx_Fluid_ViewHelpers_Form_SelectViewHelper

$output86 .= $viewHelper89->initializeArgumentsAndRender();

$output86 .= '
  ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Form_SubmitViewHelper
$arguments90 = array();
$arguments90['value'] = 'Suchen';
$arguments90['additionalAttributes'] = NULL;
$arguments90['name'] = NULL;
$arguments90['property'] = NULL;
$arguments90['disabled'] = NULL;
$arguments90['class'] = NULL;
$arguments90['dir'] = NULL;
$arguments90['id'] = NULL;
$arguments90['lang'] = NULL;
$arguments90['style'] = NULL;
$arguments90['title'] = NULL;
$arguments90['accesskey'] = NULL;
$arguments90['tabindex'] = NULL;
$arguments90['onclick'] = NULL;
$renderChildrenClosure91 = function() use ($renderingContext, $self) {
return '<button>Suchen</button>';
};
$viewHelper92 = $self->getViewHelper('$viewHelper92', $renderingContext, 'Tx_Fluid_ViewHelpers_Form_SubmitViewHelper');
$viewHelper92->setArguments($arguments90);
$viewHelper92->setRenderingContext($renderingContext);
$viewHelper92->setRenderChildrenClosure($renderChildrenClosure91);
// End of ViewHelper Tx_Fluid_ViewHelpers_Form_SubmitViewHelper

$output86 .= $viewHelper92->initializeArgumentsAndRender();

$output86 .= '
';
return $output86;
};
$viewHelper93 = $self->getViewHelper('$viewHelper93', $renderingContext, 'Tx_Fluid_ViewHelpers_FormViewHelper');
$viewHelper93->setArguments($arguments84);
$viewHelper93->setRenderingContext($renderingContext);
$viewHelper93->setRenderChildrenClosure($renderChildrenClosure85);
// End of ViewHelper Tx_Fluid_ViewHelpers_FormViewHelper

$output83 .= $viewHelper93->initializeArgumentsAndRender();

$output83 .= '
<!--
';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_ForViewHelper
$arguments94 = array();
$arguments94['each'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'certificates', $renderingContext);
$arguments94['as'] = 'certOption';
$arguments94['key'] = '';
$arguments94['reverse'] = false;
$arguments94['iteration'] = NULL;
$renderChildrenClosure95 = function() use ($renderingContext, $self) {
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments96 = array();
$arguments96['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'certOption.name', $renderingContext);
$arguments96['keepQuotes'] = false;
$arguments96['encoding'] = NULL;
$arguments96['doubleEncode'] = true;
$renderChildrenClosure97 = function() use ($renderingContext, $self) {
return NULL;
};
$value98 = ($arguments96['value'] !== NULL ? $arguments96['value'] : $renderChildrenClosure97());
return (!is_string($value98) ? $value98 : htmlspecialchars($value98, ($arguments96['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments96['encoding'] !== NULL ? $arguments96['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments96['doubleEncode']));
};

$output83 .= Tx_Fluid_ViewHelpers_ForViewHelper::renderStatic($arguments94, $renderChildrenClosure95, $renderingContext);

$output83 .= '
-->

';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_FlashMessagesViewHelper
$arguments99 = array();
$arguments99['additionalAttributes'] = NULL;
$arguments99['renderMode'] = 'ul';
$arguments99['class'] = NULL;
$arguments99['dir'] = NULL;
$arguments99['id'] = NULL;
$arguments99['lang'] = NULL;
$arguments99['style'] = NULL;
$arguments99['title'] = NULL;
$arguments99['accesskey'] = NULL;
$arguments99['tabindex'] = NULL;
$arguments99['onclick'] = NULL;
$renderChildrenClosure100 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper101 = $self->getViewHelper('$viewHelper101', $renderingContext, 'Tx_Fluid_ViewHelpers_FlashMessagesViewHelper');
$viewHelper101->setArguments($arguments99);
$viewHelper101->setRenderingContext($renderingContext);
$viewHelper101->setRenderChildrenClosure($renderChildrenClosure100);
// End of ViewHelper Tx_Fluid_ViewHelpers_FlashMessagesViewHelper

$output83 .= $viewHelper101->initializeArgumentsAndRender();

$output83 .= '

<table  class="tx_mrkeperson" >
	<tr>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments102 = array();
$arguments102['key'] = 'tx_mrkeperson_domain_model_person.lastname';
$arguments102['default'] = NULL;
$arguments102['htmlEscape'] = true;
$arguments102['arguments'] = NULL;
$renderChildrenClosure103 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper104 = $self->getViewHelper('$viewHelper104', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper104->setArguments($arguments102);
$viewHelper104->setRenderingContext($renderingContext);
$viewHelper104->setRenderChildrenClosure($renderChildrenClosure103);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output83 .= $viewHelper104->initializeArgumentsAndRender();

$output83 .= '</th>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments105 = array();
$arguments105['key'] = 'tx_mrkeperson_domain_model_person.firstname';
$arguments105['default'] = NULL;
$arguments105['htmlEscape'] = true;
$arguments105['arguments'] = NULL;
$renderChildrenClosure106 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper107 = $self->getViewHelper('$viewHelper107', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper107->setArguments($arguments105);
$viewHelper107->setRenderingContext($renderingContext);
$viewHelper107->setRenderChildrenClosure($renderChildrenClosure106);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output83 .= $viewHelper107->initializeArgumentsAndRender();

$output83 .= '</th>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments108 = array();
$arguments108['key'] = 'tx_mrkeperson_domain_model_person.cv';
$arguments108['default'] = NULL;
$arguments108['htmlEscape'] = true;
$arguments108['arguments'] = NULL;
$renderChildrenClosure109 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper110 = $self->getViewHelper('$viewHelper110', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper110->setArguments($arguments108);
$viewHelper110->setRenderingContext($renderingContext);
$viewHelper110->setRenderChildrenClosure($renderChildrenClosure109);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output83 .= $viewHelper110->initializeArgumentsAndRender();

$output83 .= '</th>
		<th>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper
$arguments111 = array();
$arguments111['key'] = 'tx_mrkeperson_domain_model_person.image';
$arguments111['default'] = NULL;
$arguments111['htmlEscape'] = true;
$arguments111['arguments'] = NULL;
$renderChildrenClosure112 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper113 = $self->getViewHelper('$viewHelper113', $renderingContext, 'Tx_Fluid_ViewHelpers_TranslateViewHelper');
$viewHelper113->setArguments($arguments111);
$viewHelper113->setRenderingContext($renderingContext);
$viewHelper113->setRenderChildrenClosure($renderChildrenClosure112);
// End of ViewHelper Tx_Fluid_ViewHelpers_TranslateViewHelper

$output83 .= $viewHelper113->initializeArgumentsAndRender();

$output83 .= '</th>
		<th> </th>
		<th> </th>
	</tr>

	';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_ForViewHelper
$arguments114 = array();
$arguments114['each'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'persons', $renderingContext);
$arguments114['as'] = 'person';
$arguments114['key'] = '';
$arguments114['reverse'] = false;
$arguments114['iteration'] = NULL;
$renderChildrenClosure115 = function() use ($renderingContext, $self) {
$output116 = '';

$output116 .= '
		<tr>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments117 = array();
$arguments117['action'] = 'show';
// Rendering Array
$array118 = array();
$array118['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments117['arguments'] = $array118;
$arguments117['additionalAttributes'] = NULL;
$arguments117['controller'] = NULL;
$arguments117['extensionName'] = NULL;
$arguments117['pluginName'] = NULL;
$arguments117['pageUid'] = NULL;
$arguments117['pageType'] = 0;
$arguments117['noCache'] = false;
$arguments117['noCacheHash'] = false;
$arguments117['section'] = '';
$arguments117['format'] = '';
$arguments117['linkAccessRestrictedPages'] = false;
$arguments117['additionalParams'] = array (
);
$arguments117['absolute'] = false;
$arguments117['addQueryString'] = false;
$arguments117['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments117['class'] = NULL;
$arguments117['dir'] = NULL;
$arguments117['id'] = NULL;
$arguments117['lang'] = NULL;
$arguments117['style'] = NULL;
$arguments117['title'] = NULL;
$arguments117['accesskey'] = NULL;
$arguments117['tabindex'] = NULL;
$arguments117['onclick'] = NULL;
$arguments117['name'] = NULL;
$arguments117['rel'] = NULL;
$arguments117['rev'] = NULL;
$arguments117['target'] = NULL;
$renderChildrenClosure119 = function() use ($renderingContext, $self) {
$output120 = '';

$output120 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments121 = array();
$arguments121['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.lastname', $renderingContext);
$arguments121['keepQuotes'] = false;
$arguments121['encoding'] = NULL;
$arguments121['doubleEncode'] = true;
$renderChildrenClosure122 = function() use ($renderingContext, $self) {
return NULL;
};
$value123 = ($arguments121['value'] !== NULL ? $arguments121['value'] : $renderChildrenClosure122());

$output120 .= (!is_string($value123) ? $value123 : htmlspecialchars($value123, ($arguments121['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments121['encoding'] !== NULL ? $arguments121['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments121['doubleEncode']));
return $output120;
};
$viewHelper124 = $self->getViewHelper('$viewHelper124', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper124->setArguments($arguments117);
$viewHelper124->setRenderingContext($renderingContext);
$viewHelper124->setRenderChildrenClosure($renderChildrenClosure119);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output116 .= $viewHelper124->initializeArgumentsAndRender();

$output116 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments125 = array();
$arguments125['action'] = 'show';
// Rendering Array
$array126 = array();
$array126['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments125['arguments'] = $array126;
$arguments125['additionalAttributes'] = NULL;
$arguments125['controller'] = NULL;
$arguments125['extensionName'] = NULL;
$arguments125['pluginName'] = NULL;
$arguments125['pageUid'] = NULL;
$arguments125['pageType'] = 0;
$arguments125['noCache'] = false;
$arguments125['noCacheHash'] = false;
$arguments125['section'] = '';
$arguments125['format'] = '';
$arguments125['linkAccessRestrictedPages'] = false;
$arguments125['additionalParams'] = array (
);
$arguments125['absolute'] = false;
$arguments125['addQueryString'] = false;
$arguments125['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments125['class'] = NULL;
$arguments125['dir'] = NULL;
$arguments125['id'] = NULL;
$arguments125['lang'] = NULL;
$arguments125['style'] = NULL;
$arguments125['title'] = NULL;
$arguments125['accesskey'] = NULL;
$arguments125['tabindex'] = NULL;
$arguments125['onclick'] = NULL;
$arguments125['name'] = NULL;
$arguments125['rel'] = NULL;
$arguments125['rev'] = NULL;
$arguments125['target'] = NULL;
$renderChildrenClosure127 = function() use ($renderingContext, $self) {
$output128 = '';

$output128 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments129 = array();
$arguments129['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.firstname', $renderingContext);
$arguments129['keepQuotes'] = false;
$arguments129['encoding'] = NULL;
$arguments129['doubleEncode'] = true;
$renderChildrenClosure130 = function() use ($renderingContext, $self) {
return NULL;
};
$value131 = ($arguments129['value'] !== NULL ? $arguments129['value'] : $renderChildrenClosure130());

$output128 .= (!is_string($value131) ? $value131 : htmlspecialchars($value131, ($arguments129['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments129['encoding'] !== NULL ? $arguments129['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments129['doubleEncode']));
return $output128;
};
$viewHelper132 = $self->getViewHelper('$viewHelper132', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper132->setArguments($arguments125);
$viewHelper132->setRenderingContext($renderingContext);
$viewHelper132->setRenderChildrenClosure($renderChildrenClosure127);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output116 .= $viewHelper132->initializeArgumentsAndRender();

$output116 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_PageViewHelper
$arguments133 = array();
$output134 = '';

$output134 .= 'uploads/tx_mrkeperson/';

$output134 .= Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.cv', $renderingContext);
$arguments133['pageUid'] = $output134;
$arguments133['additionalAttributes'] = NULL;
$arguments133['additionalParams'] = array (
);
$arguments133['pageType'] = 0;
$arguments133['noCache'] = false;
$arguments133['noCacheHash'] = false;
$arguments133['section'] = '';
$arguments133['linkAccessRestrictedPages'] = false;
$arguments133['absolute'] = false;
$arguments133['addQueryString'] = false;
$arguments133['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments133['class'] = NULL;
$arguments133['dir'] = NULL;
$arguments133['id'] = NULL;
$arguments133['lang'] = NULL;
$arguments133['style'] = NULL;
$arguments133['title'] = NULL;
$arguments133['accesskey'] = NULL;
$arguments133['tabindex'] = NULL;
$arguments133['onclick'] = NULL;
$arguments133['target'] = NULL;
$arguments133['rel'] = NULL;
$renderChildrenClosure135 = function() use ($renderingContext, $self) {
$output136 = '';

$output136 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments137 = array();
$arguments137['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.cv', $renderingContext);
$arguments137['keepQuotes'] = false;
$arguments137['encoding'] = NULL;
$arguments137['doubleEncode'] = true;
$renderChildrenClosure138 = function() use ($renderingContext, $self) {
return NULL;
};
$value139 = ($arguments137['value'] !== NULL ? $arguments137['value'] : $renderChildrenClosure138());

$output136 .= (!is_string($value139) ? $value139 : htmlspecialchars($value139, ($arguments137['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments137['encoding'] !== NULL ? $arguments137['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments137['doubleEncode']));
return $output136;
};
$viewHelper140 = $self->getViewHelper('$viewHelper140', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_PageViewHelper');
$viewHelper140->setArguments($arguments133);
$viewHelper140->setRenderingContext($renderingContext);
$viewHelper140->setRenderChildrenClosure($renderChildrenClosure135);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_PageViewHelper

$output116 .= $viewHelper140->initializeArgumentsAndRender();

$output116 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments141 = array();
$arguments141['action'] = 'show';
// Rendering Array
$array142 = array();
$array142['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments141['arguments'] = $array142;
$arguments141['additionalAttributes'] = NULL;
$arguments141['controller'] = NULL;
$arguments141['extensionName'] = NULL;
$arguments141['pluginName'] = NULL;
$arguments141['pageUid'] = NULL;
$arguments141['pageType'] = 0;
$arguments141['noCache'] = false;
$arguments141['noCacheHash'] = false;
$arguments141['section'] = '';
$arguments141['format'] = '';
$arguments141['linkAccessRestrictedPages'] = false;
$arguments141['additionalParams'] = array (
);
$arguments141['absolute'] = false;
$arguments141['addQueryString'] = false;
$arguments141['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments141['class'] = NULL;
$arguments141['dir'] = NULL;
$arguments141['id'] = NULL;
$arguments141['lang'] = NULL;
$arguments141['style'] = NULL;
$arguments141['title'] = NULL;
$arguments141['accesskey'] = NULL;
$arguments141['tabindex'] = NULL;
$arguments141['onclick'] = NULL;
$arguments141['name'] = NULL;
$arguments141['rel'] = NULL;
$arguments141['rev'] = NULL;
$arguments141['target'] = NULL;
$renderChildrenClosure143 = function() use ($renderingContext, $self) {
$output144 = '';

$output144 .= ' ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments145 = array();
$arguments145['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person.image', $renderingContext);
$arguments145['keepQuotes'] = false;
$arguments145['encoding'] = NULL;
$arguments145['doubleEncode'] = true;
$renderChildrenClosure146 = function() use ($renderingContext, $self) {
return NULL;
};
$value147 = ($arguments145['value'] !== NULL ? $arguments145['value'] : $renderChildrenClosure146());

$output144 .= (!is_string($value147) ? $value147 : htmlspecialchars($value147, ($arguments145['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments145['encoding'] !== NULL ? $arguments145['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments145['doubleEncode']));
return $output144;
};
$viewHelper148 = $self->getViewHelper('$viewHelper148', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper148->setArguments($arguments141);
$viewHelper148->setRenderingContext($renderingContext);
$viewHelper148->setRenderChildrenClosure($renderChildrenClosure143);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output116 .= $viewHelper148->initializeArgumentsAndRender();

$output116 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments149 = array();
$arguments149['action'] = 'edit';
// Rendering Array
$array150 = array();
$array150['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments149['arguments'] = $array150;
$arguments149['additionalAttributes'] = NULL;
$arguments149['controller'] = NULL;
$arguments149['extensionName'] = NULL;
$arguments149['pluginName'] = NULL;
$arguments149['pageUid'] = NULL;
$arguments149['pageType'] = 0;
$arguments149['noCache'] = false;
$arguments149['noCacheHash'] = false;
$arguments149['section'] = '';
$arguments149['format'] = '';
$arguments149['linkAccessRestrictedPages'] = false;
$arguments149['additionalParams'] = array (
);
$arguments149['absolute'] = false;
$arguments149['addQueryString'] = false;
$arguments149['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments149['class'] = NULL;
$arguments149['dir'] = NULL;
$arguments149['id'] = NULL;
$arguments149['lang'] = NULL;
$arguments149['style'] = NULL;
$arguments149['title'] = NULL;
$arguments149['accesskey'] = NULL;
$arguments149['tabindex'] = NULL;
$arguments149['onclick'] = NULL;
$arguments149['name'] = NULL;
$arguments149['rel'] = NULL;
$arguments149['rev'] = NULL;
$arguments149['target'] = NULL;
$renderChildrenClosure151 = function() use ($renderingContext, $self) {
return 'Edit';
};
$viewHelper152 = $self->getViewHelper('$viewHelper152', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper152->setArguments($arguments149);
$viewHelper152->setRenderingContext($renderingContext);
$viewHelper152->setRenderChildrenClosure($renderChildrenClosure151);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output116 .= $viewHelper152->initializeArgumentsAndRender();

$output116 .= '</td>
			<td>';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments153 = array();
$arguments153['action'] = 'delete';
// Rendering Array
$array154 = array();
$array154['person'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'person', $renderingContext);
$arguments153['arguments'] = $array154;
$arguments153['additionalAttributes'] = NULL;
$arguments153['controller'] = NULL;
$arguments153['extensionName'] = NULL;
$arguments153['pluginName'] = NULL;
$arguments153['pageUid'] = NULL;
$arguments153['pageType'] = 0;
$arguments153['noCache'] = false;
$arguments153['noCacheHash'] = false;
$arguments153['section'] = '';
$arguments153['format'] = '';
$arguments153['linkAccessRestrictedPages'] = false;
$arguments153['additionalParams'] = array (
);
$arguments153['absolute'] = false;
$arguments153['addQueryString'] = false;
$arguments153['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments153['class'] = NULL;
$arguments153['dir'] = NULL;
$arguments153['id'] = NULL;
$arguments153['lang'] = NULL;
$arguments153['style'] = NULL;
$arguments153['title'] = NULL;
$arguments153['accesskey'] = NULL;
$arguments153['tabindex'] = NULL;
$arguments153['onclick'] = NULL;
$arguments153['name'] = NULL;
$arguments153['rel'] = NULL;
$arguments153['rev'] = NULL;
$arguments153['target'] = NULL;
$renderChildrenClosure155 = function() use ($renderingContext, $self) {
return 'Delete';
};
$viewHelper156 = $self->getViewHelper('$viewHelper156', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper156->setArguments($arguments153);
$viewHelper156->setRenderingContext($renderingContext);
$viewHelper156->setRenderChildrenClosure($renderChildrenClosure155);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output116 .= $viewHelper156->initializeArgumentsAndRender();

$output116 .= '</td>
		</tr>
	';
return $output116;
};

$output83 .= Tx_Fluid_ViewHelpers_ForViewHelper::renderStatic($arguments114, $renderChildrenClosure115, $renderingContext);

$output83 .= '
</table>

';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper
$arguments157 = array();
$arguments157['action'] = 'new';
$arguments157['additionalAttributes'] = NULL;
$arguments157['arguments'] = array (
);
$arguments157['controller'] = NULL;
$arguments157['extensionName'] = NULL;
$arguments157['pluginName'] = NULL;
$arguments157['pageUid'] = NULL;
$arguments157['pageType'] = 0;
$arguments157['noCache'] = false;
$arguments157['noCacheHash'] = false;
$arguments157['section'] = '';
$arguments157['format'] = '';
$arguments157['linkAccessRestrictedPages'] = false;
$arguments157['additionalParams'] = array (
);
$arguments157['absolute'] = false;
$arguments157['addQueryString'] = false;
$arguments157['argumentsToBeExcludedFromQueryString'] = array (
);
$arguments157['class'] = NULL;
$arguments157['dir'] = NULL;
$arguments157['id'] = NULL;
$arguments157['lang'] = NULL;
$arguments157['style'] = NULL;
$arguments157['title'] = NULL;
$arguments157['accesskey'] = NULL;
$arguments157['tabindex'] = NULL;
$arguments157['onclick'] = NULL;
$arguments157['name'] = NULL;
$arguments157['rel'] = NULL;
$arguments157['rev'] = NULL;
$arguments157['target'] = NULL;
$renderChildrenClosure158 = function() use ($renderingContext, $self) {
return 'New Person';
};
$viewHelper159 = $self->getViewHelper('$viewHelper159', $renderingContext, 'Tx_Fluid_ViewHelpers_Link_ActionViewHelper');
$viewHelper159->setArguments($arguments157);
$viewHelper159->setRenderingContext($renderingContext);
$viewHelper159->setRenderChildrenClosure($renderChildrenClosure158);
// End of ViewHelper Tx_Fluid_ViewHelpers_Link_ActionViewHelper

$output83 .= $viewHelper159->initializeArgumentsAndRender();

$output83 .= '
';
return $output83;
};

$output77 .= '';

return $output77;
}


}
#0             56865     