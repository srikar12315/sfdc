public with sharing class DiscountComponentController {
    
    @AuraEnabled
    Public static void checkDiscount(String params){
        try{
            Map<String, Object> paramMap = (Map<String, Object>)System.JSON.deserializeUntyped(params);
            Pricing_Event__e event = new Pricing_Event__e();
            event.CustomerId__c =(String)paramMap.get('customerId');
            event.Location__c =(string)paramMap.get('countryCode');
            EventBus.publish(event);
            
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
        
    }
}