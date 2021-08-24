@isTest
Private class TestRejectDoubleBooking
{

// good scenario 

Private static testmethod void singleBooking(){
DateTime now = System.now();

speaker__c speaker1 = new speaker__c(First_Name__c='Test1',Last_Name__c='Test1');
insert speaker1;

Session__c session1 = new Session__c(Name='Developing', Session_Date__c=now);
insert session1;

Session_Speaker__c assingn = new Session_Speaker__c(Session__c=session1.Id, Speaker__c=speaker1.Id);


Test.StartTest();
Database.SaveResult result = Database.insert(assingn, false);
Test.StopTest();

System.assert(result.isSuccess());
}

private static testmethod void doublebooking(){
Datetime now = System.now();

speaker__c speaker2 = new speaker__c(First_Name__c='Test12',Last_Name__c='Test12');
insert speaker2;

Session__c session2 = new Session__c(Name='Developing', Session_Date__c=now);
insert session2;

Session__c session3 = new Session__c(Name='Admin', Session_Date__c=now);
insert session3;

Session_Speaker__c assingn1 = new Session_Speaker__c(Session__c=session2.Id, Speaker__c=speaker2.Id);
insert assingn1;

Session_Speaker__c assingn2 = new Session_Speaker__c(Session__c=session3.Id, Speaker__c=speaker2.Id);
Test.startTest();
Database.SaveResult result1 =Database.insert(assingn2, false);
Test.StopTest();
System.assert(!result1.isSuccess());

}





}