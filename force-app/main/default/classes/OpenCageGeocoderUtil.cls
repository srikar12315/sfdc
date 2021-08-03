global with sharing class OpenCageGeocoderUtil {
   
    public static void forwardGeoCoding(Id recordId){
        String endpoint = System.Label.OpenCageBaseUrl;
        String apiKey = System.Label.OpenCageApiKey;
        String errorMessage ='';

        Account accRecord = [SELECT Name, BillingStreet, BillingCity, BillingState, BillingPostalCode,
                            BillingCountry, BillingLatitude, BillingLongitude
                            FROM Account where Id=:recordId];

        String address = accRecord.BillingStreet+','+accRecord.BillingCity+','+accRecord.BillingState+''+accRecord.BillingPostalCode+''+accRecord.BillingCountry;
        String encodingString = EncodingUtil.urlEncode(address, 'UTF-8');
        String v1 = '&pretty=1';
        
        String finalEndpoint =endpoint+'q='+encodingString+'&key='+apiKey+v1;
        Http http = new Http();
        HttpRequest req  = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(finalEndpoint);
        req.setHeader('Content-Type', 'Application/Json');
        //https://api.opencagedata.com/geocode/v1/json?q=Rua+Cafel%C3%A2ndia%2C+Carapicu%C3%ADba%2C+Brasil&key=db4bd3408d5943fd95bb97b3fea0b3d6&pretty=1

        HttpResponse resp = new HttpResponse();

        try {
           resp= http.send(req);
           if(resp.getStatusCode() == 200){
               String body = resp.getBody();
               system.debug(system.loggingLevel.DEBUG, 'body' + body);

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

    public static void reverseGeoCoding(){

        

    }
}
