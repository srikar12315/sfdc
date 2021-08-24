@RestResource(urlMapping='/ContactInsert/*')
global with sharing class ContactResource3 {
   /**********
    @HTTPPost
    global static Contact createContacts(){
        
        RestRequest contactRequest = RestContext.request;
         system.debug('contactRequest :' + contactRequest);
        String reqBody = contactRequest.requestBody.toString();
        
        system.debug('reqBody :' + reqBody);
        
        contact con = (Contact)JSON.deserialize(reqBody, Contact.class);
       
        System.debug('con :' + con);
        insert con;
        
        return con;

    }
    ***************/
    
      @HTTPPost
    global static List<Contact> createContacts(){
        
        RestRequest contReq= RestContext.request;
        
        String reqBody = contReq.requestBody.toString();
        
        List<Contact> cons = (List<Contact>)JSON.deserialize(reqBody,List<Contact>.class);
        
         insert cons;
        
        return cons;
    }
    

}