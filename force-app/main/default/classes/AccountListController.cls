public class AccountListController {
    
    @AuraEnabled
    public static List<Account> fetchAccts(){
        return[Select Id,Name,Industry  from Account  where Industry!=null LIMIT 100];
    }

}