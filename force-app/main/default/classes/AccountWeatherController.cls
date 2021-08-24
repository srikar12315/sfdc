public with sharing class AccountWeatherController {

public string city {get;set;}
public String temp {get;set;}
public String pressure {get;set;}
public String humidity {get;set;}
public String temp_min {get;set;}
public String temp_max {get;set;}


public AccountWeatherController(ApexPages.standardController stdController){
Account account = (Account)stdController.getRecord();
account =[SELECT Id, ShippingCity from Account where Id=:account.Id];

String accountCity = account.ShippingCity;
String apiKey ='d11f29f2da7bc3bd7299f5a335a16faa';

String requestEndpoint = 'http://api.openweathermap.org/data/2.5/weather';
       requestEndpoint += '?q=' + accountCity;
       requestEndpoint += '&units=metric';
       requestEndpoint += '&APPID=' + apiKey;
       
       Http http = new Http();
       HttpRequest req= new HttpRequest();
       req.setEndpoint(requestEndpoint);
       req.setMethod('GET');
       HttpResponse res = http.send(req);
       
       system.debug('Response @@' + res.getBody());
       
       if(res .getStatuscode()==200){
       Map<String,Object> results = (Map<String,Object>)(JSON.deserializeUntyped(res.getBody()));
       city= String.ValueOf(results.get('name'));
       Map<String,Object> mainResult = ( Map<String,Object>)(results.get('main'));
       temp =String.ValueOf(mainResult.get('temp'));
       pressure =String.ValueOf(mainResult.get('pressure'));
       humidity = String.ValueOf(mainResult.get('humidity'));
       temp_min =String.ValueOf(mainResult.get('temp_min'));
       temp_max=String.ValueOf(mainResult.get('temp_max'));
       
       
       
       }else{
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error in retriving data');
       ApexPages.addMessage(myMsg);
       }

}


}