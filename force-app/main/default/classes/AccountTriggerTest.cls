@isTest
private class AccountTriggerTest {
 
    @isTest
    Static void Acctrigger(){
        Account a = new Account(Name='AAAAAA');
        Integer count =[Select count() from Account];
        try{
            insert a;
        }Catch(Exception e){
            system.debug(e);
        }  
        Integer size = [Select count() from Account];
        System.assertEquals(size,count+1);
        Account acc=[select description from Account where id=:a.id];
        System.assertEquals('Trigger Inser', acc.Description);
    }   
}