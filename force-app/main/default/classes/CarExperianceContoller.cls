public with sharing class CarExperianceContoller {
  
    @AuraEnabled
    public static List<Car_Experience__c> getCarExperiences(String carId){
        
            return [SELECT id, Name, 
                    Experience__c,
                    LastModifiedDate,
                    CreatedDate,
                    CreatedBy.Name,
                    CreatedBy.SmallPhotoUrl,
                    CreatedBy.CompanyName
                    From Car_Experience__c
                    where Car__c = :carId
                    ORDER BY CreatedDate DESC];

       

    }
}