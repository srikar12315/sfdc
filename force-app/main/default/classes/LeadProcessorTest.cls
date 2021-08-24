@isTest
Private Class LeadProcessorTest
{


 static testmethod void testmethod1(){
 
 
 List<Lead> leads = new List<lead>();
 
 for(Integer i=0; i<200; i++){
 Lead led = new Lead();
 led.FirstName='FirstName';
 led.LastName='LastName'+i;
 led.Company='demo'+i;
 leads.add(led);
 
 
 }
 insert leads;
 
 Test.StartTest();
 
 LeadProcessor ld = new LeadProcessor ();
  Id batchId = Database.executeBatch(ld);
 Test.StopTest();
 
 }






}