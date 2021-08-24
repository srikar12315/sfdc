@RestResource(urlMapping='/v3/accounts/*')
global with sharing class AccountRESTService_v3 {

    
@HttpPost
global static PostResponseWrapper doPost(RequestWrapper rqst){
  
    RestRequest req =RestContext.request;
    RestResponse res=RestContext.response;
    PostResponseWrapper response = new PostResponseWrapper();
    try{
       insert rqst.acct;
        response.acct = rqst.acct;
        for(Contact con:rqst.conList){
            con.AccountId=rqst.acct.Id;
        }
        insert rqst.conList;
        response.conList = rqst.conList;
        
        response.status ='Success';
        response.message='Your accounts have been saved successfully ';
        
    }catch(Exception exe){
       
        res.statusCode =500;
        response.acct= null;
        response.conList=null;
        response.status ='Error';
        response.message = 'Your request faild with the following error'+ exe.getMessage(); 
        
    }
    
    return response;
}


    /***************************************
    @HttpPost
    global static AccountWrapper doPost(String name, String phone, String website){
      RestRequest req = RestContext.request;
      RestResponse res = RestContext.response;
      AccountWrapper response = new AccountWrapper();
       Account acct = new Account();
        acct.Name = name;
        acct.Phone = phone;
        acct.Website = website;
        insert acct;
        response.acctList.add(acct);
        response.status='Success';
        response.message='Account as been created successfully';
        
        
        return response;
    }
    
    ********************************************/
    /***********************************
    @HttpPost
    global static AccountWrapper doPost(Account acct){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        AccountWrapper response = new AccountWrapper();
        try{
            insert acct;
            response.acctList.add(acct);
            response.status='Succcess';
            response.message='Account created successfully';
        }catch(Exception exc){
            res.statusCode=500;
            response.acctList=null;
            response.status='Error';
            response.message='Your request faild'+exc.getMessage();
            
        }
        
        return response;
    }
    
    
    **********************************/
    
    @HttpGet
   global static AccountWrapper doGet(){
      RestResponse res = RestContext.response;
      RestRequest req = RestContext.request;
       AccountWrapper response = new AccountWrapper();
       
       String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
       
       if(doSearch(accountId)){
           SearchAccounts(req, res, response);
       }else{
           findAccount(res, response, accountId);
       }
       return response;
        
        
    }
    // If the item to the right of the last forward slash is "accounts", the request went to v3/accounts?Name=United
    // Else the request went to v3/accounts/<something>, which is not a search, but a specific entity
    Private static boolean doSearch(string accountId){
        if(accountId=='accounts') {
            return true;
        } 
        return false;
    }
    //If the request came to /v3/accounts, then we want to execute a search
    Private static void SearchAccounts(RestRequest req, RestResponse res, AccountWrapper response){
        String searchTerm = req.params.get('Name');
        if(searchTerm==null && searchTerm==''){
            response.status ='Error';
            response.message='You must provide a name for ylour search';
            res.statusCode=400;
        }else{
            String searchText='%'+searchTerm+'%';
            List<Account> searchResult =[Select Id,Name,Phone From Account WHERE Name like :searchText];
            if(searchResult !=null && searchResult.size() >0){
                response.acctList = searchResult;
                response.status ='Success';
                response.message= searchResult.size() +'Accounts were found that match your search result';
            }else {
                
                response.status ='Error';
                response.message='No account were found ';
            }
            
        }
        
    }
     //If the request came to v3/accounts/<Id>, then we want to find a specific account
    Private static void findAccount(RestResponse res, AccountWrapper response,String accountId ){
        if(accountId !=null && accountId !=''){
            List<Account> result =[SELECT id, Name from Account where Id=:accountId];
            if(result !=null && result.size()>0){
                response.acctList.add(result[0]);
                response.status ='Success';
            }else{
                response.status = 'Error';
                response.message='this account could not found';
                res.statusCode = 400;
            }
            
        }   else{
                response.status = 'Error';
                response.message='You must specify an Id';
                res.statusCode = 400;
        }
    }
    
    
    global class RequestWrapper{
    
    Account acct;
    List<Contact> conList;
    
    }
    
    
    
    global class PostResponseWrapper{
     Account acct;
     List<Contact> conList;
     public String status;
     public String message;
     public PostResponseWrapper(){
    
       }
    
    }
    
    
    global class AccountWrapper{
        List<Account> acctList;
        public String status;
        public String message;
        public AccountWrapper(){
            acctList = new List<Account>();
        }
        
    }
}