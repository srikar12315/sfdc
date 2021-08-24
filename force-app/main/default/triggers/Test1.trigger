trigger Test1 on Account (before insert, after Insert, before Delete,before update) {

    if(Trigger.isBefore && Trigger.isInsert){
        for(Account a:Trigger.New){
            a.Description ='Before Trigger event';
            system.debug('====>>>>> :' + a);
        }
        
    }
    if(Trigger.isAfter && Trigger.isInsert){
    List<Contact> cons = new List<Contact>();
    for(Account a:Trigger.new){
    Contact c= new Contact();
    c.LastName=a.Name;
    c.Description = a.Description;
    c.AccountId=a.Id;
      cons.add(c);
    
    
    }
     insert cons;
    system.debug('====>>>>> :' + cons);
    }
    
    if(Trigger.isBefore && Trigger.isDelete){
    List<Account> accs=[Select id,(select id from Contacts) from Account where id in:Trigger.old];
    for(Account a:accs){
    if(a.Contacts.size()>0){
   
     a.adderror('Delete Contact first');
    
    
    }
    }
    
    }
     if(Trigger.isBefore && Trigger.isUpdate){
     Map<id,Account> newMap = Trigger.NewMap;
     List<Account> accs = new List<Account>([select id,(select phone,AccountId from contacts) from Account where id IN:Trigger.old]); 
     List<Contact> cons= new List<Contact>();
     for(Account a:accs){
     for(Contact c:a.contacts){
     c.phone=newMap.get(c.AccountId).Phone;
     c.Email= newMap.get(c.AccountId).Website;
     cons.add(c);
      
       }
     update cons;
     
     
      }
     
     
     }
}