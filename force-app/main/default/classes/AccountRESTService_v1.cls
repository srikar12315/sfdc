@RestResource(UrlMapping='/v1/accounts/*')
global with sharing class  AccountRESTService_v1 {

    @HttpGet
    global static AccountWrapper doGet(){
        RestRequest req = RestContext.request;
        RestResponse resp =  RestContext.response;
        AccountWrapper response = new AccountWrapper();
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result=[Select Id,Name from Account where Id=:accountId];
        if(result !=null && result.size() >0){
            response.acct = result[0];
            response.status= 'Success';
            response.message = 'Account Found';
        }else{
            response.acct = null;
            response.status = 'Error';
            response.message ='No account found';
            //resp.statusCode = 404;
            response.status = '404';
        }
        return response;
    }
    global class AccountWrapper{
        Public Account acct;
        Public String status;
        public String message;
        public AccountWrapper(){
            
        }
    }
}