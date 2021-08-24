global class BatchExample implements Database.Batchable<sobject> {

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,name,Phone from Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account a:scope){
            a.Phone='0225005443';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        system.debug('Finished');
    }
   // BatchExample be= new BatchExample();
   // ID jobId=Database.executeBatch(be, 5);
}