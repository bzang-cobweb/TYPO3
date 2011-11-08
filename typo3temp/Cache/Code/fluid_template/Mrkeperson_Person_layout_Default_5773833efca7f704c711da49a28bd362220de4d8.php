<?php
class FluidCache_Mrkeperson_Person_layout_Default_5773833efca7f704c711da49a28bd362220de4d8 extends Tx_Fluid_Core_Compiler_AbstractCompiledTemplate {

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
$output0 = '';

$output0 .= '<div class="tx-mrkeperson">
	';
// Rendering ViewHelper Tx_Fluid_ViewHelpers_RenderViewHelper
$arguments1 = array();
$arguments1['section'] = 'main';
$arguments1['partial'] = NULL;
$arguments1['arguments'] = array (
);
$arguments1['optional'] = false;
$renderChildrenClosure2 = function() use ($renderingContext, $self) {
return NULL;
};
$viewHelper3 = $self->getViewHelper('$viewHelper3', $renderingContext, 'Tx_Fluid_ViewHelpers_RenderViewHelper');
$viewHelper3->setArguments($arguments1);
$viewHelper3->setRenderingContext($renderingContext);
$viewHelper3->setRenderChildrenClosure($renderChildrenClosure2);
// End of ViewHelper Tx_Fluid_ViewHelpers_RenderViewHelper

$output0 .= $viewHelper3->initializeArgumentsAndRender();

$output0 .= '
</div>';

return $output0;
}


}
#0             1386      