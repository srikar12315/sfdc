@isTest
public class AccountManagemantRestClassTest {

    public static testMethod void getAccountTest(){
        String recordId = createTestRecord();
        String url = 'services/apexrest/v1/AccountRest'+recordId;
        RestRequest request = new RestRequest();
        request.requestURI =url;
        request.httpMethod='GET';
        RestContext.request = request;
      
        Test.startTest();
        AccountManagemantRestClass.AccountWarpper wrapper = AccountManagemantRestClass.getAccountDetails();
        system.assertNotEquals(null, wrapper);
        Test.stopTest();

    }
    public static testMethod void postAccountTest(){
        String url = 'services/apexrest/v1/AccountRest';
        RestRequest request = new RestRequest();
        request.requestURI =url;
        request.httpMethod='POST';
       

        Account acc= New Account(Name='Test');
        Contact con = new Contact(LastName='Lname', FirstName='Fname',Email='test@email.com');
        AccountManagemantRestClass.postAccountWarpper Infomation = New AccountManagemantRestClass.postAccountWarpper();
        Infomation.accountInfo =acc;
        Infomation.contactInfo=con;

        RestContext.request = request;

        Test.startTest();
        AccountManagemantRestClass.postAccountWarpper insertedRec = AccountManagemantRestClass.postAccount(Infomation);
        Test.stopTest();
    }
    
    public static testMethod void updateAccountTest(){

        String recordId =createTestRecord();
        String url ='/services/apexrest/v1/AccountRest/'+recordId;
        RestRequest request = new RestRequest();
        request.requestURI=url;
        request.httpMethod='PATCH';
        RestContext.request=request;
        test.startTest();
        AccountManagemantRestClass.updateAccount('MyName', '123456');
        test.stopTest();
        
    }

    public static testMethod void deleteAccountTest(){
     String recordId =createTestRecord();
     String url='/services/apexrest/v1/AccountRest/'+recordId;
     RestRequest request = new RestRequest();
     request.requestURI=url;
     request.httpMethod='DELETE';
     RestContext.request=request;
     test.startTest();
     AccountManagemantRestClass.deleteAccount();
     test.stopTest();

    }

    static Id createTestRecord() {
        // Create test record
        Account TestAcc = new Account(
          Name='Test record');
        insert TestAcc;
        
        Contact TestCon= new Contact(
        LastName='Test', 
        AccountId = TestAcc.id);
        
        return TestAcc.Id;
    }      


    
}
