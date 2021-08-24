trigger AccountTrigger1 on Account (before insert, after insert,before Delete) {

    if(Trigger.isBefore && Trigger.isInsert){
    for(Account a:Trigger.New){
        
        a.Description ='Trigger Inser';
         }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        List<Contact> cons = new List<Contact>();
        for(Account a:Trigger.New){
            Contact c=new Contact();
            c.LastName=a.Name;
            c.Description=a.Description;
            cons.add(c);
        }
        insert cons;
    }
    
    if (Trigger.isDelete){
       map<Id, Account> accMap=Trigger.oldMap;
        List<Account> accs=[select id,(select id from Contacts) from Account where id in:Trigger.old];
        for(Account ac:accs){
            if(ac.contacts.size()>0){
                ac.addError('Delete contacts');
            }
        }
        
    }    
}