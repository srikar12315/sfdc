global class BtchExample1 implements Database.Batchable<Sobject> {
    global  Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id, name from Account');
    }
    global void Execute(Database.BatchableContext bc, List<Account> scope){
        List<Account> accs = new List<Account>();
        Account a1 = new Account(Name='BATCH-1');
        Account a2 = new Account(Name='BATCH-2');
        Account a3 = new Account();
        accs.add(a1);
        accs.add(a2);
        accs.add(a3);
        //Database.insert (accs,false);
        insert accs;
    }
    global void Finish(Database.BatchableContext bc){        
    }
}
//BtchExample1 be = new BtchExample1();
//ID  jobid= Database.executeBatch(be,15);