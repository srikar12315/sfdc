@RestResource(urlmapping='/v1/AccountRest/*')
global class AccountManagemantRestClass {

    @HttpPatch
    global static updateAccountWrapper updateAccount( String accName, String accountNumber){

        RestRequest request = RestContext.request;
        String requestURI = request.RequestURI;
        String accountId =requestURI.substringAfterLast('/');
        List<Account> accountList = [select Id from Account where Id=:accountId];
        Account accRec;
        updateAccountWrapper wrapper = new updateAccountWrapper();
        if(accountList.size()>0){

            
             accRec = new Account (id=accountId, Name=accName, AccountNumber=accountNumber);  
             Update accRec;
             wrapper.accRecord = accRec;
             wrapper.message='Account Record Updated';
            
        }else{
            wrapper.message='Account not found';
        }
        return wrapper;


        
    }

    @httpDelete
    global static String deleteAccount(){

      RestRequest req = RestContext.request;
      String requestURI = req.RequestURI;
      String accountId = requestURI.subStringafterlast('/');

      List<Account> accountList =[Select Id, Name from Account where Id=:accountId];
      
      if(accountList.size()>0){
          try{
            Delete accountList;
            return 'Account Deleted';
          }catch(system.Exception ex){
            String errorMessage = ex.getMessage();
            return '{"Message":"'+errorMessage+'"}';
          }
        
      }else{
          return 'No Account Found';
      }
    }

    @HttpPost
    global static Account postAccount(String accName, String accountNumber, String industry, String description){

             
        Account newAccount = New Account(Name=accName, AccountNumber = accountNumber, Industry = industry, Description = description);
        insert newAccount;

       return newAccount;

    }

    @HttpGet
    global static AccountWarpper getAccountDetails(){

        RestRequest req = RestContext.request;
        String requestURI = req.RequestURI;
        String accountId = requestURI.subStringafterlast('/');

        List<Account> accountList = [select id,Name,phone,Description from Account where Id=:accountId ];
        List<Contact> contactList = [select Id, FirstName, Email from Contact where accountId=:accountId];
        List<Opportunity> opportunityList = [select id, Name from Opportunity where AccountId=:accountId];
        List<Case> caseList =[select id,casenumber from case where accountId=:accountId];
        

        AccountWarpper wrapper = new AccountWarpper();

           if(accountList !=null && accountList.size()>0)
                {
                
                wrapper.accountRecord =accountList.get(0);
                wrapper.contactList=contactList;
                wrapper.opportunityList=opportunityList;
                wrapper.caseList=caseList;
                wrapper.Restmessage ='Fetching All Accounts, Contacts and cases '+ ' '+accountList;
                }
        return wrapper;

    }

    global class AccountWarpper{
        global Account accountRecord;
        global List<Contact> contactList;
        global List<Opportunity> opportunityList;
        global List<Case> caseList;
        global String Restmessage;
    }
   
    
    global class updateAccountWrapper{
        global Account accRecord;
        global String message;
    }

}
