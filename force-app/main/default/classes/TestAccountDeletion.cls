@isTest
private class TestAccountDeletion{

@isTest 
private static void TestDeleteAccountWithoneOpportunity(){

Account acct = new Account(Name='Test Account');
insert acct;

Opportunity opp = new Opportunity(Name=acct.Name+'Opportunity', StageName='Prospecting', CloseDate=System.today().addmonths(1), AccountId=acct.Id);
insert opp;

Test.startTest();
Database.DeleteResult result=Database.delete(acct,false);

Test.stopTest();
system.assert(!result.iSsuccess());
system.assert(result.geterrors().size()>0);
system.assertEquals( 'Cannot delete account with related opportunities.', result.getErrors()[0].getmessage());



 }
}