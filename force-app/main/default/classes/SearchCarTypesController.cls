public with sharing class SearchCarTypesController {
   
    @AuraEnabled(cacheable=true)
    public static List<Car_Type__c>  getCarTypes(){
        return [ SELECT id, Name From Car_Type__c];   
    }
}