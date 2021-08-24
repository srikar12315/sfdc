trigger AccountDuplicateTrigger on Account (before insert) {
    List<String> newNames = new List<String>();
    Set<String> dupNames=New Set<String>();
    for(Account a:Trigger.New){
        newNames.add(a.name);
    }
    List<Account> result=[select name from Account where name in:newNames];
     for(Account a1:result){
      dupNames.add(a1.name);  
    }
    for(Account a:Trigger.New ){
        if(dupNames.contains(a.Name)){
        a.IsDup__c = True;
       // a1.IsDup__c = True;
            
        }
    }
}