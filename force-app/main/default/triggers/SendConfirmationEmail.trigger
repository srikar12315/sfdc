trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
 
    for(Session_Speaker__c newItem:Trigger.New){
         Session_Speaker__c sessionSpeaker =   
          [SELECT  Session__r.Name,
            Session__r.Session_Date__c,
           Speaker__r.First_Name__c,
           Speaker__r.Last_Name__c, Speaker__r.Email__c
           FROM Session_Speaker__c where Id=:newItem.Id];
           if(sessionSpeaker.Speaker__r.Email__c !=NULL){
            String address = sessionSpeaker.Speaker__r.Email__c;
            String subject = '  Speaker Confirmation ';
            String message = 'Dear ' + sessionSpeaker.Speaker__r.First_Name__c +
            ',\n Your session " ' + sessionSpeaker.Session__r.Name +'  " on  ' +
             sessionSpeaker.Session__r.Session_Date__c + ' is confirmed.\n\n '+
                ' Thanks for speaking at conference !!!  ';
            EmailManager.sendmail(address, subject, message);
        }
    }
    
    
}