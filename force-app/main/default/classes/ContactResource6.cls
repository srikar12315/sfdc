@RestResource(urlMapping='/PutContact/*')
global with sharing class ContactResource6 {
    
    @HTTPPut
    global static List<Contact> upsertContacts(){
        
        RestRequest contReq = RestContext.request;
        
        String reqBody = contReq.requestBody.toString();
        
        List<Contact> conList = (List<Contact>)JSON.deserialize(reqBody,List<Contact>.class);
       
       upsert conList;
        
        
        
        return conList;
        
        
    }

}