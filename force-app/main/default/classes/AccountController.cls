public class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getLimitedAccounts(){
        List<Account> accounts = [SELECT
               Id, Name, Phone
               FROM Account ORDER BY CreatedDate LIMIT 2000];
        system.debug('===========###########'+accounts);
        //http://sfdcfacts.com/lightning/lightning-pagination-with-page-number-navigation-using-client-side-controller/
        return accounts;
    }
}