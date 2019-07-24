public class mapLabel{
public map<string,string> getMapFieldLabel(){
        Map<String,String> mapField_Label = new Map<String,String>();
        //List<string> fieldsLabels = new List<string>();
        List<Custom_Object__c> defaultFields = [Select Name from Custom_Object__c where Default__c=True];
        Map<String, Schema.SObjectField> typeMap = Schema.SObjectType.A_second_Custom_Object__c.fields.getMap();
          
        //Get choosen default fields label    
        for(Custom_Object__c defaultField : defaultFields) {
            
            Schema.SObjectField field = typeMap.get(defaultField.Name);
            string fieldLabel =field.getDescribe().getLabel();
            mapField_Label.put(defaultField.Name, fieldLabel);
            //fieldsLabels.add(fieldLabel);
            
            
        }
        system.debug(mapField_Label);
        return mapField_Label;
}   
    }