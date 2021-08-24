@RestResource(urlMapping='/DeleteContact/*')
global with sharing class ContactResource4 {

    
    @HTTPDelete
    global static Map<String,String> deleteContact(){
        
        Map<String,String> responseMap = new Map<String, String>();
        
        RestRequest contactrequest = RestContext.request;
        system.debug('contactrequest :' + contactrequest);
        
        String contactRequestURI = contactrequest.requestURI;
        system.debug('contactRequestURI :' + contactRequestURI);
        
        Id contactId = Id.valueOf(contactRequestURI.substring(contactRequestURI.lastIndexOf('/')+1));    
         system.debug('contactId :' + contactId);
        
        Contact contact = new Contact(Id=contactId);
        system.debug('contact :' + contact);
        try{
            Delete contact;
            responseMap.put('success','1');
            responseMap.put('message','Contact Deleted Successfully');
            
        }catch(DmlException ex){
            responseMap.put('error','0');
            responseMap.put('message',ex.getMessage());
            
        }
        
        
        return responseMap;
    }
    
}