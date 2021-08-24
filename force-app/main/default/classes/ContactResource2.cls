@RestResource(urlMapping='/ContactApi/*')
global with sharing class ContactResource2 {
    ///services/apexrest/ContactApi?Limit=5&leadsource=web
    @HTTPGet
    global static List<Contact> getContacts(){
        
        RestRequest contactRequest = RestContext.request;
        
        system.debug('contactRequest :' + contactRequest);
        
        Map<String, String> contactRequestParams = contactRequest.params;
        
        system.debug('contactRequestParams :' + contactRequestParams);
        
        Integer contactLimit = integer.ValueOf( contactRequestParams.get('Limit'));
        string contactLeadSource = contactRequestParams.get('leadsource');
        
        List<Contact> connList = [Select Id,Name from Contact where LeadSource=:contactLeadSource 
                                 LIMIT:contactLimit];
        
        
        
        return connList;
    }

}