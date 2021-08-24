@isTest
private class RestFulExampleTest
{
 static testMethod void doMyTest()
 {
     //Setup Data
     Account a = new Account();
     a.Name = 'UnitTesting';
     insert a;
     //Start Testing
     Test.startTest();
     GetRestfulExample myObj = new GetRestfulExample();
     myObj.getAndParse(a.Id);
     Test.stopTest();
     
     //Assert the results
      GetRestfulExample.JsonResult r = new GetRestfulExample.JsonResult();
      r.original = a.Id;
      r.md5 = String.valueOf(Crypto.generateDigest('MD5',Blob.valueOf(a.Id)));
      
      System.AssertEquals(myObj.Response,JSON.serialize(r));
 }
}