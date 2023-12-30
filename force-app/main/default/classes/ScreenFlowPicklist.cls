/*********************************************************
 * @description A dynamic picklist of active screen flows. Used as a data source
 *  for the flowName design attribute in the flowLauncherButton lwc
 * 
 * @author SerkinSolutions
 * @date 2023
 ********************************************************/
global with sharing class ScreenFlowPicklist extends VisualEditor.DynamicPickList {

    private static final String PROCESS_TYPE = 'Flow';

    global VisualEditor.DynamicPickListRows pickVals;

    global ScreenFlowPicklist() {
        List<FlowDefinitionView> lstFdvs = [
            SELECT ApiName, Label, NamespacePrefix
              FROM FlowDefinitionView
             WHERE IsActive = true
               AND ProcessType = :PROCESS_TYPE
              WITH USER_MODE
             ORDER BY Label ASC
        ];
        pickVals = new VisualEditor.DynamicPickListRows();
        for (FlowDefinitionView fdv : lstFdvs) {
            VisualEditor.DataRow pickRow = new VisualEditor.DataRow(fdv.Label, getQualifiedApiName(fdv));
            pickVals.addRow(pickRow);
        }
    }

    global override VisualEditor.DataRow getDefaultValue() {
        return pickVals.get(0);
    }

    global override VisualEditor.DynamicPickListRows getValues() {
        return pickVals;
    }

    private static String getQualifiedApiName(
        FlowDefinitionView fdv
    ) {
        return String.isEmpty(fdv.NamespacePrefix) 
            ? fdv.ApiName 
            : fdv.NamespacePrefix + '__' + fdv.ApiName;
    }

}