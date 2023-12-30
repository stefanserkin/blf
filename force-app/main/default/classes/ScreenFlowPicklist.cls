global with sharing class ScreenFlowPicklist extends VisualEditor.DynamicPickList {

    private static final String PROCESS_TYPE = 'Flow';
    private List<FlowDefinitionView> fdvs;

    global override VisualEditor.DataRow getDefaultValue() {
        FlowDefinitionView fdv = getFlowDefinitionViews()[0];
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow(fdv.Label, getQualifiedApiName(fdv));
        return defaultValue;
    }

    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows pickVals = new VisualEditor.DynamicPickListRows();
        for (FlowDefinitionView fdv : getFlowDefinitionViews()) {
            VisualEditor.DataRow pickRow = new VisualEditor.DataRow(fdv.Label, getQualifiedApiName(fdv));
            pickVals.addRow(pickRow);
        }
        return pickVals;
    }

    private static String getQualifiedApiName(
        FlowDefinitionView fdv
    ) {
        return String.isBlank(fdv.NamespacePrefix) 
            ? fdv.ApiName 
            : fdv.NamespacePrefix + '__' + fdv.ApiName;
    }

    private List<FlowDefinitionView> getFlowDefinitionViews() {
        if (fdvs == null) {
            fdvs = [
                SELECT ApiName, Label, NamespacePrefix
                  FROM FlowDefinitionView
                 WHERE IsActive = true
                   AND ProcessType = :PROCESS_TYPE
                  WITH USER_MODE
            ];
        }
        return fdvs;
    }

}