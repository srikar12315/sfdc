///services/apexrest/v1/Account/0010I00002TI9eE
    @RestResource(urlmapping='/v1/Account/*')
    global class AccountManagement{
    
    
       @HttpPatch
       global static AccountResponseWrapper updateAccount( String rating, String accountNumber, String description){
        
            RestRequest request = Restcontext.request;
            String requestURI = request.RequestURI;
            String accountId = requestURI.subStringafterlast('/');
            
            List<Account> accountList =[Select id from Account where id=:accountId];
            Account accRec;
            AccountResponseWrapper wrapper = new AccountResponseWrapper ();
            if(accountList !=null && accountList.size() >0){
            accRec = new Account(Id = accountId, Rating = rating, Description = description );
            update accRec;
            wrapper.accountRecord=accRec;
            wrapper.message ='Account Record Update';
            
            }else{
            wrapper.message = 'Account record Not Found';
            
            }
       
       return wrapper;
       
       }
        
        @HttpPost
        global static Account postAccount(String AccountName, String AccountNumber, String Description, String Industry){
        Account accountRecord= New Account(Name=AccountName, AccountNumber=AccountNumber, Description=Description, Industry=Industry);
        
            Insert accountRecord;
            Return accountRecord;
        
        } 
        
        @HttpDelete
        global static String deleteAccount(){
        
        RestRequest request = Restcontext.request;
        String requestURI = request.RequestURI;
        String accountId = requestURI.subStringafterlast('/');
            
            List<Account> listAccount = [Select Id from Account where Id=:accountId];
                if(ListAccount !=null && ListAccount.size() > 0){
                try{
                     Delete listAccount;
                     return '{"message ":" Account record Delete"}';
                    }catch(system.Exception ex){
                    String errorMessage = ex.getMessage();
                    return'{"message" :"'+errorMessage+'"}';
                    
                    }
                     
                }else{
                     return '{"message ":" Account record Not Found"}';
                }
               
        }
    
        @HttpGet
        global static AccountWrapper  getAccountDetails(){
        RestRequest req = Restcontext.request;
        String requestURI = req.RequestURI;
        String accountId = requestURI.subStringafterlast('/');
        
        List<Account> acclst = [select id,Name from Account where Id=:accountId ];
        List<Contact> conlst = [select Id, FirstName, Email from Contact where accountId=:accountId];
        List<Case> caselst= [select id,casenumber from case where accountId=:accountId];
        
        AccountWrapper wrapper = new AccountWrapper();
        
            if(!acclst.isEmpty()){
            wrapper.accountRecord=acclst.get(0);
            wrapper.Contlst=Conlst;
            wrapper.caseslst=caselst;
            
            }
        return wrapper;
        }
        
         global class AccountWrapper{
             global Account accountRecord;
             global List<Contact> contlst;
             global List<Case> caseslst;
         }
        
        global class AccountResponseWrapper{
          global Account accountRecord;
          global String message;
          
          }
    
    }