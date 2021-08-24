trigger Customer_After_Insert on APEX_Customer__c (After Update) {

    
    if(Trigger.isAfter && Trigger.isUpdate){
        customerTriggerHelper.isAfterUpdateTrigger(Trigger.New,Trigger.NewMap, Trigger.OldMap);
    }


}