@isTest
Private class AccountTriggerHelperTest {

    @isTest
    Static void AccountTest(){
        integer acount =[select count() from Account];
        integer ccount =[select count()from Contact];
        Account a = new Account(Name='aaa', Phone='1234',Industry='Banking');
        try{
            insert a;
        }catch(Exception e){
            system.debug(e);
        }
        integer nacount=[select count()from Account];
        integer nccount=[select count() from Contact];
        System.assertEquals(nacount+1, acount);
        System.assertEquals(nccount+1, ccount);
        Account acc=[select phone from Account where id=:a.Id];
        System.assertEquals(acc.phone, '123456');
        Contact c=[select name,phone from Contact where accountid=:a.id];
        System.assertEquals(c.LastName, a.Name);
        
        
    }
}