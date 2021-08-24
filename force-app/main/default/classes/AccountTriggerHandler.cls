public with sharing class AccountTriggerHandler {
  
    @AuraEnabled(Cacheable=true)
    public static List<Account> getAccounts(Integer numberOfAccounts){

        return[Select id, Name, Phone From Account LIMIT :numberOfAccounts];

        
    }
}