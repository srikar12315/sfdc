trigger UpdateTriggerExample on Account (before insert, before update)
{
    for(Account a:trigger.old){
        System.debug('====>>>>Trigger.old :' +a.name);
        System.debug('====>>>>Trigger.old :' +a.industry);
    }
    system.debug('==============Trigger.old closed============');
    for(Account a:trigger.New){
        System.debug('====>>>>Trigger.New :' +a.name);
        System.debug('====>>>>Trigger.New :' +a.industry);
    }
    system.debug('==============Trigger.new closed============');
    Map<Id,Account> oldMap=Trigger.oldMap;
    Map<Id,Account> newMap=Trigger.newMap;
    System.debug('======>>>>>Trigger.oldMap :'+ oldMap);
    System.debug('======>>>>>Trigger.newMap :' + newMap);  
}