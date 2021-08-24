@RestResource(urlMapping='/ContactAp/*')
global with sharing class ContactResource {
    ///services/apexrest/ContactAp/5
    @HTTPGet
    global static List<Contact> getContactIdAndName(){
        RestRequest contactRequest = RestContext.request;
        String contactRequestURI = ContactRequest.requestURI;
        
        Integer contactLimit = Integer.valueOf(contactRequestURI.substring(contactRequestURI.lastIndexOf('/')+1));
        
        List<Contact> connList = [SELECT id, Name from contact LIMIT:contactLimit];
        
        
        return connList;
        
    }
    
    

}