global with sharing class OpenCageGeocoderUtil {
   
    public static void forwardGeoCoding(){
        String endpoint = System.Label.OpenCageBaseUrl;
        String apiKey = System.Label.OpenCageApiKey;
        String errorMessage ='';
        Http http = new Http();
        HttpRequest req  = new HttpRequest();
        HttpResponse resp = new HttpResponse();

        try {
            
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
