global with sharing class OpenCageGeocoderUtil {
    private static String endpoint = System.Label.OpenCageBaseUrl;
    private static String apiKey = System.Label.OpenCageApiKey;

    @future(callout=true)
    public static void forwardGeoCoding(Id recordId){
        //String endpoint = System.Label.OpenCageBaseUrl;
       // String apiKey = System.Label.OpenCageApiKey;
        String errorMessage ='';

        Account accRecord = [SELECT Id,Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, Location__latitude__s, Location__longitude__s,
                            BillingCountry, BillingLatitude, BillingLongitude
                            FROM Account where Id=:recordId ];

        String address = accRecord.BillingStreet+','+accRecord.BillingCity+','+accRecord.BillingState+','+accRecord.BillingPostalCode+','+accRecord.BillingCountry;
        system.debug('$$$ Address :'+address);
        String encodingString = EncodingUtil.urlEncode(address, 'UTF-8');
        system.debug('$$$ encodingString :'+encodingString);
        String v1 = '&pretty=1';
        
        String finalEndpoint =endpoint+'q='+encodingString+'&key='+apiKey+v1+'&limit=1';
        Http http = new Http();
        HttpRequest req  = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(finalEndpoint);
        req.setHeader('Content-Type', 'application/json');
        //https://api.opencagedata.com/geocode/v1/json?q=Rua+Cafel%C3%A2ndia%2C+Carapicu%C3%ADba%2C+Brasil&key=db4bd3408d5943fd95bb97b3fea0b3d6&pretty=1

        HttpResponse resp = new HttpResponse();

        try {
           resp= http.send(req);
           if(resp.getStatusCode() == 200){
               String body = resp.getBody();
              // system.debug(system.loggingLevel.DEBUG, 'body' + body);
             OpenCageGeoCoder openCageData = (OpenCageGeoCoder)System.JSON.deserialize(body, OpenCageGeoCoder.class);
             system.debug(system.loggingLevel.DEBUG, '#### openCageData :' +openCageData);
             List<OpenCageGeoCoder.results> results = openCageData.results;
             system.debug(system.loggingLevel.DEBUG, '#### results :' +results);
             if(results !=null && results.size()>0){
                 OpenCageGeoCoder.results result =results.get(0);
                 system.debug(system.loggingLevel.DEBUG,'#### result :' +result);
                 accRecord.Location__Latitude__s = result.geometry.lat;
                 accRecord.Location__Longitude__s =result.geometry.lng;
               update accRecord;
             }

               

              
              

           }else{
               errorMessage='Unexpected Error while communicating with OpenCage Data API.'+'Status '+resp.getStatusCode();
           }

            
        } catch (system.Exception e) {
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unutheriozed endpoint: an Admin must go add endpoint';
            }else{
                errorMessage = 'Unexpected Error while communicating with OpenCase | Api' + resp.getStatusCode()+resp.getStatus();
            }
            System.debug(System.LoggingLevel.DEBUG, 'Exection Executed' + errorMessage);
        }
    }
    
    @future(callout=true)
    public static void reverseGeoCoding(Id recordId){

        String errorMessage ='';

        Account accRecord = [SELECT Id,Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, Location__latitude__s, Location__longitude__s,
                            BillingCountry, BillingLatitude, BillingLongitude,ShippingStreet, ShippingState,  
                            ShippingPostalCode,  ShippingCountry, ShippingCity
                            FROM Account where Id=:recordId ];

        String geoLocation = accRecord.Location__latitude__s +'+'+ accRecord.Location__longitude__s;
        System.debug('$$$$ geoLocation :'+geoLocation);
        String encodingGeoLocation = EncodingUtil.urlEncode(geoLocation, 'UTF-8');
        String v1 = '&pretty=1';
        
        String finalEndpoint =endpoint+'q='+encodingGeoLocation+'&key='+apiKey+v1+'&limit=1';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/jason');
        req.setEndpoint(finalEndpoint);
        HttpResponse resp = new HttpResponse();

            try{

                resp = http.send(req);

                if(resp.getStatusCode() ==200){
        
                    String body = resp.getBody();
                    System.debug('From Reverse');
                    OpenCageGeoCoder openCage = (OpenCageGeoCoder)System.JSON.deserialize(body, OpenCageGeoCoder.class);
                    system.debug('$$$ openCase :' + openCage);

                    List<OpenCageGeoCoder.results> results = openCage.results;
                    system.debug('$$$ results :' + results);
                    if(results.size()>0){
                        OpenCageGeoCoder.results result =results.get(0);
                        system.debug('$$$ result :' + result);

                        accRecord.ShippingCity =result.components.suburb;
                        accRecord.ShippingCountry=result.components.country;
                        accRecord.ShippingPostalCode = result.components.postcode;
                        accRecord.ShippingState =result.components.state;
                        accRecord.ShippingStreet=result.components.road;
        
                        Update accRecord;
                    }
                }


            }catch (system.Exception e){
                if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                    errorMessage = 'Unutheriozed endpoint: an Admin must go add endpoint';
                }else{
                    errorMessage = 'Unexpected Error while communicating with OpenCase | Api' + resp.getStatusCode()+resp.getStatus();
                }
                System.debug(System.LoggingLevel.DEBUG, 'Exection Executed' + errorMessage);
                
            }


        
       





        

    }
}
