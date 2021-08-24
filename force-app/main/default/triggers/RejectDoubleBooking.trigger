trigger RejectDoubleBooking on Session_Speaker__c (before insert, before update) 
{
  
     for(Session_Speaker__c sessionSpeaker:Trigger.New){
        
        //Retrive session information including session date and time
        Session__c session =[SELECT id,Session_Date__c FROM Session__c 
                            WHERE Id=:sessionSpeaker.Session__c];
        List<Session_Speaker__c> conflict = 
        [SELECT Id From Session_Speaker__c 
        WHERE Speaker__c=:sessionSpeaker.Speaker__c
        AND Session__r.Session_Date__c =:session.Session_Date__c];
        
        if(!conflict.isEmpty()){
            
            sessionSpeaker.addError('The speaker is already booked at that time');
            
        }
        
    }
    
  
  
   
    

}