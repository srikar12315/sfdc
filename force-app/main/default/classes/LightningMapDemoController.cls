public class LightningMapDemoController {
    //https://sfdcfacts.com/lightning/lightning-map-create-destroy-component-dynamically-winter19/
    @AuraEnabled(cacheable=true)
    public static List<CarWrapper> getAllCars(){
        List<Car__c> cars =[SELECT Id, Name, Available_For_Rent__c, Build_Year__c,
                             Mileage__c, Per_Day_Rent__c,
                             (SELECT Id, Name, City__c,Coordinates__Latitude__s, Coordinates__Longitude__s, 
                              Country__c, Pin_Code__c, State__c, Street__c FROM Address__r)
                             FROM Car__c Limit 100];
        
        List<CarWrapper> result = new List<CarWrapper>();
        for(Car__c car:cars){
            CarWrapper carWrap = new CarWrapper();
            carWrap.Name= car.Name;
            carWrap.AvailableForRent = car.Available_For_Rent__c;
            carWrap.BuildYear =car.Build_Year__c;
            carWrap.Mileage=car.Mileage__c;
            carWrap.PerDayRent =car.Per_Day_Rent__c;
            List<CarAddressWrapper> carAddressList = new List<CarAddressWrapper>();
            for(Address__c add: car.Address__r){
                CarAddressWrapper carAddress = new CarAddressWrapper();
                carAddress.icon = 'custom:custom31';
                carAddress.title=car.Name;
                AddressWrapper addWrap = new AddressWrapper();
                addWrap.Latitude = add.Coordinates__Latitude__s;
                addWrap.Longitude = add.Coordinates__Longitude__s;
                addWrap.Street = add.Street__c;
                addWrap.State =add.State__c;
                addWrap.City = add.City__c;
                addWrap.Country = add.Country__c;
                carAddress.location = addWrap;
                carAddressList.add(carAddress);
                
            }
            carWrap.carAddressList=carAddressList;
            result.add(carWrap);
        }
        system.debug('result :' + result);
        return result;
    }
    
    public class CarWrapper{
        @AuraEnabled
        public Boolean AvailableForRent;
        @AuraEnabled
        public String Name;
        @AuraEnabled
        public Decimal Mileage;
        @AuraEnabled
        public Decimal BuildYear;
        @AuraEnabled
        public Decimal PerDayRent;
        @AuraEnabled
        public List<CarAddressWrapper> carAddressList;
        
    }
     public class CarAddressWrapper{
         @AuraEnabled
         public String title;
         @AuraEnabled
         public String icon;
         @AuraEnabled
         public AddressWrapper location;
        
    }
     public class AddressWrapper{
         @AuraEnabled
         public String Street;
         @AuraEnabled
         public String City;
         @AuraEnabled
         public String State;
         @AuraEnabled 
         public String Country;
         @AuraEnabled
         public String PostalCode;
         @AuraEnabled
         public Decimal Latitude;
         @AuraEnabled
         public Decimal Longitude;
         
        
    }
 
}