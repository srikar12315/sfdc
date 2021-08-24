@RestResource(urlMapping='/FieldCase/*')
global with sharing  class RESTCasecontroller {
    
    @HttpGet
    global static List<Case> getOpenCase(){
        String companyName=RestContext.request.params.get('companyName');
        Account company =[select Id,name,BillingState from Account where name=:companyName];
        List<Case> cases=[select id,subject,status,ownerId,owner.name from case where AccountId=:company.Id];
       return cases;
      }
    @HttpDelete
    global static string deleteoldcase(){
       String companyName=RestContext.request.params.get('companyName');
       Account company=[select id,name,BillingState from Account where name=:companyName];
       List<Case> Cases=[select id,subject,status,ownerId,owner.name from case where AccountId=:company.Id AND status='closed'];
        delete Cases;
      return 'closed case delete';  
    }
    @HttpPost
    global static string createnewAccount(string acctname, string desic){
        Account a= new Account();
        a.Name=acctname;
        a.Description=desic;
        insert a;
        Return 'Account inserted';  
    }
    @HttpPatch
    global static string updateCase(string caseId, string caseStatus, string caseNote){
        case companyCase=[SELECT Id,subject, status, Description from Case where Id=:caseId];
        companyCase.Status=caseStatus;
        companyCase.Description +=caseNote;
        update companyCase;
        return 'case update';
        
    }
}