trigger AccountTriggerHlp on Account (before update, after update, before delete) {

    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('Trigger.old Values:' + Trigger.Old);
        AccountTriggerHelper.beforeUpdate(Trigger.Old);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('Trigger.old Values:' + Trigger.New);
      AccountTriggerHelper.afterUpdate(Trigger.New);  
    }
       
   /** if(Trigger.isBefore && Trigger.isDelete){
        for(Account a:Trigger.old){
            System.debug('Trigger.Old::'+a.Name);
            system.debug('Trigger.old::'+a.Industry);
        }
        system.debug('Trigger.oldMap::'+Trigger.oldMap);
    }
    **/
    
}