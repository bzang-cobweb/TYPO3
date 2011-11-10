<?php
class FluidCache_Mrkeperson_Page_action_list_978c04579fbfddfd0245a155285d38cbcf6e2ab5 extends Tx_Fluid_Core_Compiler_AbstractCompiledTemplate {

public function getVariableContainer() {
	// TODO
	return new Tx_Fluid_Core_ViewHelper_TemplateVariableContainer();
}
public function getLayoutName(Tx_Fluid_Core_Rendering_RenderingContextInterface $renderingContext) {

return NULL;
}
public function hasLayout() {
return FALSE;
}

/**
 * Main Render function
 */
public function render(Tx_Fluid_Core_Rendering_RenderingContextInterface $renderingContext) {
$self = $this;
// Rendering ViewHelper Tx_Fluid_ViewHelpers_ForViewHelper
$arguments0 = array();
$arguments0['each'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'pages', $renderingContext);
$arguments0['as'] = 'page';
$arguments0['key'] = '';
$arguments0['reverse'] = false;
$arguments0['iteration'] = NULL;
$renderChildrenClosure1 = function() use ($renderingContext, $self) {
$output2 = '';

$output2 .= '
  ';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_Format_HtmlspecialcharsViewHelper
$arguments3 = array();
$arguments3['value'] = Tx_Fluid_Core_Parser_SyntaxTree_ObjectAccessorNode::getPropertyPath($renderingContext->getTemplateVariableContainer(), 'page.title', $renderingContext);
$arguments3['keepQuotes'] = false;
$arguments3['encoding'] = NULL;
$arguments3['doubleEncode'] = true;
$renderChildrenClosure4 = function() use ($renderingContext, $self) {
return NULL;
};
$value5 = ($arguments3['value'] !== NULL ? $arguments3['value'] : $renderChildrenClosure4());

$output2 .= (!is_string($value5) ? $value5 : htmlspecialchars($value5, ($arguments3['keepQuotes'] ? ENT_NOQUOTES : ENT_COMPAT), ($arguments3['encoding'] !== NULL ? $arguments3['encoding'] : Tx_Fluid_Core_Compiler_AbstractCompiledTemplate::resolveDefaultEncoding()), $arguments3['doubleEncode']));

$output2 .= '
';
return $output2;
};

return Tx_Fluid_ViewHelpers_ForViewHelper::renderStatic($arguments0, $renderChildrenClosure1, $renderingContext);
}


}
#0             2070      