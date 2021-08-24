public with sharing class NotifyController {

     @AuraEnabled(cacheable=true)
    public static List<User> getContactOwners( String recId){
    Contact con =[Select Id, Name, Email,OwnerId, CreatedById,
                 LastModifiedById from Contact where Id=:recId];
      String OwnerId = con.OwnerId;
        User owner = [select id, Name from User where Id=:OwnerId];
        List<User> userList = new List<User>();
        ////
        userList.add(owner);
        return userList;
    }
    
    @AuraEnabled(cacheable=true)
    public static void sendEmailApex(List<String> toAddress, list<String> ccAddress, 
                                     String subject,String body, List<String> files){
         Messaging.reserveSingleEmailCapacity(1);
          try{
              Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
              mail.setToAddresses(toAddress);
              mail.setCcAddresses(ccAddress);
              mail.setReplyTo('Srini.sfdc16@gmail.com');
              mail.setSubject(subject);
              mail.setHtmlBody(body);
              mail.setEntityAttachments(files);
              Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail} );
                                             
                 }catch(Exception e){
                         throw new AuraHandledException(e.getMessage());                    
                                             
                 }
        
        
    }
}