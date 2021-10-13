public class FreshDeskUtil {
    public static FINAL STRING TICKET_ENDPOINT ='https://newaccount1628243652804.freshdesk.com/api/v2/tickets';
    public static FINAL STRING CONTACT_ENDPOINT = 'https://newaccount1628243652804.freshdesk.com/api/v2/contacts';



    public static void createContact(String name, String email, String phone, String mobile) {
        String errorMessage ='';
        String endPoint = CONTACT_ENDPOINT;
        String cred= System.Label.FreshDesk; 

        String requestBody  = '{'+
                                '"name": "'+name+'",'+
                                '"email": "'+email+'",'+
                                '"phone" : "'+phone+'",'+
                                '"mobile" : "'+mobile+'"'+
                            '}';

        
           Http http = new Http();
           httpRequest httpReq = new httpRequest();
           
           httpReq.setMethod('POST');
           httpReq.setHeader('Authorization', 'Basic '+EncodingUtil.base64Encode(Blob.valueOf(cred)));
           httpReq.setEndpoint(endPoint);
           
           httpReq.setBody(requestBody);
           
           httpReq.setHeader('Content-Type', 'application/json');
           HttpResponse response = new HttpResponse();
   
         
           System.debug('I am good Until Here');
           System.debug('I am good Until Here1' + cred);
   
        
        try{
            System.debug('I am good Until Here 2');
            response = http.send(httpReq);
            System.debug('I am good Until Here 3');
   
        if(response.getStatusCode() == 201){
            String body = response.getBody();
           System.debug(System.LoggingLevel.DEBUG, 'Responsefrom the Server'+body);
        }else{
            errorMessage =' Unexpected Error while communicating with the API. '
            +' Status '+response.getStatus() +' and status Code ' +response.getStatusCode();
            System.debug(System.LoggingLevel.DEBUG,' Exeception Executed '+errorMessage);

        }
        }Catch(System.Exception e){

            if(String.valueOf(e.getMessage()).startsWith('Unauthorised endpoint')){
                errorMessage = 'Unauthorized endpoint: An admin must add endpoint'+endPoint;
            }else {
                errorMessage ='Unexpected Error while communicating with the API.'
            +'Status '+response.getStatus() +'and status Code ' +response.getStatusCode();
            }
         System.debug(System.LoggingLevel.DEBUG,'Exeception Executed'+errorMessage);

        }
    }

    public static void createTicket(String sub, String email, String description, Integer priorty, Integer status, Integer source){


        String errorMessage ='';
        String endPoint = TICKET_ENDPOINT;
        String cred= System.Label.FreshDesk; 

        String requestBody  =     '{'+
            '"description": "'+description+'",'+
            '"subject": "'+sub+'",'+
            '"email": "'+email+'",'+
            '"priority": '+priorty+','+
            '"status": '+status+','+
            '"source": '+source+
         '}';

        
           Http http = new Http();
           httpRequest httpReq = new httpRequest();
           
           httpReq.setMethod('POST');
           httpReq.setHeader('Authorization', 'Basic '+EncodingUtil.base64Encode(Blob.valueOf(cred)));
           httpReq.setEndpoint(endPoint);
           
           httpReq.setBody(requestBody);
           
           httpReq.setHeader('Content-Type', 'application/json');
           HttpResponse response = new HttpResponse();
   
         
           System.debug('I am good Until Here');
           System.debug('I am good Until Here1' + cred);
   
        
        try{
            System.debug('I am good Until Here 2');
            response = http.send(httpReq);
            System.debug('I am good Until Here 3');
   
        if(response.getStatusCode() == 201){
            String body = response.getBody();
           System.debug(System.LoggingLevel.DEBUG, 'Response from the Server :'+ body);
        }else{
            errorMessage =' Unexpected Error while communicating with the API. '
            +' Status '+response.getStatus() +' and status Code ' +response.getStatusCode();
            System.debug(System.LoggingLevel.DEBUG,' Exeception Executed '+errorMessage);

        }
        }Catch(System.Exception e){

            if(String.valueOf(e.getMessage()).startsWith('Unauthorised endpoint')){
                errorMessage = 'Unauthorized endpoint: An admin must add endpoint'+endPoint;
            }else {
                errorMessage ='Unexpected Error while communicating with the API.'
            +'Status '+response.getStatus() +'and status Code ' +response.getStatusCode();
            }
         System.debug(System.LoggingLevel.DEBUG,'Exeception Executed'+errorMessage);

        }
    }

    public static void listAllContacts(){
        String errorMessage ='';
        String endPoint = CONTACT_ENDPOINT;
        String cred= System.Label.FreshDesk; 
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpoint);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Basic '+EncodingUtil.base64Encode(Blob.valueOf(cred)));
        HttpResponse response = new HttpResponse();

        try{
           response = http.send(request);
           if(response.getStatusCode() == 200){
               String responseBody = response.getBody();
               System.debug(System.LoggingLevel.DEBUG, 'Response From Body : ' + responseBody);
               List<freshDeskAllContact> allcontact = (Lis<freshDeskAllContact>)System.JSON.deserialize(responseBody, List<freshDeskAllContact>.class);
               for(freshDeskAllContact contact: allcontact){
                   
               }
           }else{
               errorMessage = 'Unexpected Error while communicating with API. '
               + 'Status' + response.getStatus() + 'and the status Code :'+ response.getStatusCode();
               System.debug(System.LoggingLevel.DEBUG, 'Exception :' + errorMessage);

           }

        }catch(system.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage= 'Unauthorized endpoint: Admin must go to setup  -> Administer -> Security Control -> '
                +'Remote Site Setting and add'+ '' + endPoint + 'endpoint';
                System.debug(System.LoggingLevel.DEBUG, 'Exception :' + errorMessage);
            }else{

                errorMessage = 'Unexpected Error while communicating with API. '
               + 'Status' + response.getStatus() + 'and the status Code :'+ response.getStatusCode();
               System.debug(System.LoggingLevel.DEBUG, 'Exception :' + errorMessage);
            }


        }


         

    }

    public static void listAllTickets(){

    }

    public static void listAllContactTickets(){

    }



}
