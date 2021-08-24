public with sharing class ContactController 
{
    @AuraEnabled
    public static List<Contact> findall(){
        
        return[SELECT Id, Name, MobilePhone FROM Contact LIMIT 50];
    }   
     
    @AuraEnabled
    public static List<Contact> findByName(string searchKey){
      String name = '%'+searchKey+'%';
        return[SELECT Id, Name, MobilePhone FROM Contact where name LIKE:name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(string contactId){
        return[SELECT Id, Name,title, MobilePhone, Account.Name FROM Contact where id=:contactId ];
        
    }
    
}