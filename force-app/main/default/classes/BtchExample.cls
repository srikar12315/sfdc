global class BtchExample implements Database.Batchable<Sobject> {

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id,description from Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account a:scope){
            a.description='BatchExample Description';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        system.debug('====>>>>>> : Operation finished');
    }
    
}