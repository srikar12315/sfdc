@isTest
Private class AccountHandlerTest {
    @isTest
    static void CreateAccountOpportunityTest(){
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<200; i++){
            Account acct = new Account( Name= 'Test Account'+1);
            accts.add(acct);
        }
        Test.startTest();
        insert accts;
        Test.stopTest();
        //verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [Select id from Account ];
        System.assertEquals(200, verifyAccts.size());
        List<Opportunity> verifyOpp = [Select id from Opportunity];
        System.assertEquals(200, verifyOpp.size());
    }
    

}