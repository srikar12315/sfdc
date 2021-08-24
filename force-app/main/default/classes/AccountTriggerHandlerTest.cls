@isTest
Private class AccountTriggerHandlerTest {
    @isTest
    private static void CreateAccountsTest(){
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<200; i++){
            Account acct = new Account( Name= 'Test Account'+1, BillingState='CA');
            accts.add(acct);
        }
        Test.startTest();
        insert accts;
        Test.stopTest();
        List<Account> acctState= [select id, shippingState from Account];
        for(Account aa:acctState){
        System.assertEquals('CA', aa.ShippingState, 'ERROR' );
        }
        
    }

}