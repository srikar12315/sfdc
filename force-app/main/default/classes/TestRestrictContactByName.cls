@isTest
private class TestRestrictContactByName {
@isTest
private static void testinvalidContact(){
Test.startTest();
try{
Contact c = new contact(LastName='INVALIDNAME');
insert c;
}catch (Exception ex){
boolean expectedExceptionThrown = ex.getMessage().contains('INVALIDNAME') ?True :false;
system.assertEquals(expectedExceptionThrown, true);

}
Test.stopTest();
}





/*
 @isTest
    static void invalidName() {
        try {
            Contact c = new Contact(LastName='INVALIDNAME');
            insert c;
        }
        catch (Exception e) {
            System.assert(true); 
        }
    }
*/
/*

    @isTest static void TestInvalidName() {
        Contact con = new Contact(LastName='INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(con);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
        System.debug('Test Result: ' + result.getErrors()[0].getMessage());
    }

    @isTest static void ValidName() {
        Contact con = new Contact(LastName='Jones');
        Test.startTest();
        Database.SaveResult result = Database.insert(con);
        Test.stopTest();
        System.assert(result.isSuccess());      
    }   
    */
}