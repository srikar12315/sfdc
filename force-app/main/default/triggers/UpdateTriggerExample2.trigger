trigger UpdateTriggerExample2 on Account (before insert, before update) {
    List<Account> accs=[select id,name,phone from Account where id in:Trigger.Old];
    List<Account> newaccs=[select id,name,phone from Account where id in:Trigger.New];
    for(Account a:accs){
        System.debug('Trigger Old:' +a.name);
        system.debug('Trigger Old:' +a.phone);
    }
    for(Account b:newaccs){
       System.debug('Trigger New :' +b.name);
       system.debug('Trigger New :' +b.Phone);
    }

}