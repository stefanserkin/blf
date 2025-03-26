/*********************************************************
 * @author SerkinSolutions
 * @date 2023
 ********************************************************/
@IsTest
private class ScreenFlowPicklist_Test {

    @IsTest
    static void testGetDefaultValue() {
        VisualEditor.DynamicPickListRows testPickVals = new VisualEditor.DynamicPickListRows();
        testPickVals.addRow(new VisualEditor.DataRow('Test Label 1', 'TestValue1'));
        testPickVals.addRow(new VisualEditor.DataRow('Test Label 2', 'TestValue2'));

        // Create an instance of ScreenFlowPicklist and directly set pickVals
        ScreenFlowPicklist picklist = new ScreenFlowPicklist();
        picklist.pickVals = testPickVals;

        VisualEditor.DataRow defaultValue = picklist.getDefaultValue();

        Assert.areEqual('Test Label 1', defaultValue.getLabel(), 'The default value label should match the first test row label.');
        Assert.areEqual('TestValue1', defaultValue.getValue(), 'The default value should match the first test row value.');
    }

    @IsTest
    static void testGetValues() {
        VisualEditor.DynamicPickListRows testPickVals = new VisualEditor.DynamicPickListRows();
        testPickVals.addRow(new VisualEditor.DataRow('Test Label 1', 'TestValue1'));
        testPickVals.addRow(new VisualEditor.DataRow('Test Label 2', 'TestValue2'));

        // Create an instance of ScreenFlowPicklist and directly set pickVals
        ScreenFlowPicklist picklist = new ScreenFlowPicklist();
        picklist.pickVals = testPickVals;

        VisualEditor.DynamicPickListRows pickValues = picklist.getValues();

        Assert.areEqual(2, pickValues.size(), 'Should have received 2 rows');
    }

}