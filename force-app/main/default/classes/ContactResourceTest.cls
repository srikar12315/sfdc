@isTest
global with sharing class ContactResourceTest {
    
    @TestSetup
    static void makeData(){
        contact contactTest = new contact(FirstName='ContactFirstName',LastName='ContactLastName');
        insert contactTest;
    }
    
    @isTest
    static void testGetContactIdAndNames() {
        
        Test.startTest();
        RestRequest contactRequest = new RestRequest();
        ContactRequest.requestURI ='https://ap5.salesforce.com/services/apexrest/ContactAp/1';
        ContactRequest.httpMethod ='GET';   
        RestContext.request=contactRequest; 
        List<Contact> conlist = ContactResource.getContactIdAndName();
        system.assert(conlist !=null);
        system.assert(conlist.size() ==1);
        system.assertEquals('ContactFirstName ContactLastName', conlist[0].Name);

        
        Test.stopTest();
        
    }
    
     
    
    

}