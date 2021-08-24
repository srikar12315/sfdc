@RestResource(urlMapping='/DeleteMultipleContacts/*')
global with sharing class ContactResource5 {
    
    global class contactWrapper{
         String message;
         String success;
        
    }
    
    @HTTPDelete
    global static List<contactWrapper> deleteMultipleContacts(){
        
        List<contactWrapper> wrapperList = new List<contactWrapper>();
        
        RestRequest contactReq = RestContext.request;
        system.debug('contactReq :' + contactReq);
        
        String contactURI = contactReq.requestURI;
        system.debug('contactURI :' + contactURI);
        
        String[] contactIds = (contactURI.substring(contactURI.lastIndexOf('/')+1)).split(',');
        system.debug('contactIds :' + contactIds); 
        
        List<Contact> deleteContactList = new List<Contact>();
        
        for (String contactId:contactIds){
            Contact con = new Contact(id=contactId);
            deleteContactList.add(con);
        }
        
        Database.DeleteResult[] deleteResultes = Database.delete(deleteContactList, false);
        
        for(Database.DeleteResult deleteResult:deleteResultes){
          contactWrapper conwrp = new contactWrapper();
            if(deleteResult.isSuccess()){
                conwrp.success = '1';
                conwrp.message = 'Successfully deleted contact with Id: ' + deleteResult.getId();
                
            }else{
                
                  conwrp.success = '0';
                for(Database.Error error : deleteResult.getErrors()) {
                    conwrp.message = 'The following error has occurred for contact with Id: ' + deleteResult.getId() + '. ';
                    conwrp.message += error.getStatusCode() + ': ' + error.getMessage() + '. ';
                    conwrp.message += 'Contact fields that affected this error: ' + error.getFields();
                }
                
            }
            wrapperList.add(conwrp);
            
        }
        
        
        return wrapperList;
    }

}