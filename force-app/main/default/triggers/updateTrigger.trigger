trigger updateTrigger on Account (before update) {

    Map<Id, Account> newMap=Trigger.newMap;
    List<Account> accs=[select id,(select phone,accountid from Contacts) from Account where id in:Trigger.old];
    List<Contact> cons = new List<Contact>();
    for(Account a:accs){
        
        for(contact c:a.contacts){
            c.phone=newMap.get(c.accountid).phone;
            cons.add(c);
        }
    }
    update  cons;
    
    
    
}