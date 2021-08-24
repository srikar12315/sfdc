global class CustomerProcessingBatch implements Database.Batchable<sobject>, Database.AllowsCallouts, Database.Stateful, schedulable{
    
global String [] email = new String[] {'srini.sfdc16@gmail.com'};    
    
    global Database.QueryLocator start (Database.BatchableContext BC){
        return Database.getQueryLocator('Select id, Name, APEX_Customer_Status__c, APEX_Customer_Decscription__c From APEX_Customer__c WHERE createdDate = today AND APEX_Customer_Active__c = true');
    }
    global void execute(Database.BatchableContext BS, List<sObject> scope){
        List<APEX_Customer__c> updateCustomers = new List<APEX_Customer__c>();
        
        for(Sobject objScope:scope){
            APEX_Customer__c newSobjScope = (APEX_Customer__c)objScope;
            
            newSobjScope.APEX_Customer_Decscription__c='Updated From Batch';
            newSobjScope.APEX_Customer_Status__c='Processed';
            updateCustomers.add(newSobjScope);
        }
        if(updateCustomers !=null && updateCustomers.size()>0){
            Database.update(updateCustomers);
            
        } 
        
    }
    
    global void execute(SchedulableContext sc)
    {
        CustomerProcessingBatch b = new CustomerProcessingBatch();
        database.executebatch(b,10);
    }
    
    global void finish(Database.BatchableContext Bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      
      // Below code will fetch the job Id
      AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors,
      a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById,
      a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
      
      // get the job Id
      System.debug('$$$ Jobid is'+BC.getJobId());
      
      // below code will send an email to User about the status
      mail.setToAddresses(email);
      mail.setReplyTo('test@test.com'); // Add here your email address
      mail.setSenderDisplayName('Apex Batch Processing Module');
      mail.setSubject('Batch Processing '+a.Status);
      mail.setPlainTextBody('The Batch Apex job processed'+ a.TotalJobItems+'batches with '+a.NumberOfErrors+'failures'+'Job Item processed are'+a.JobItemsProcessed);
      Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
        
    }
    
}