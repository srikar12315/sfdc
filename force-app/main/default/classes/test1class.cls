@isTest
private class test1class{

@isTest
 static void testme(){
Account a = new Account (Name='aaa');
Integer count = [select count() from Account];
Integer con = [select count() from Account];
Integer con11 = [select count() from Account];
try{
insert a;
}catch (Exception e){
system.debug(e);
}
Integer size =[select count() from Account];
system.assertEquals(size,count+1);
Account acc=[Select Description from Account where id=:a.id];
system.assertEquals('Before Trigger event',acc.Description);
Integer mycount=[select count() from Contact];
system.AssertEquals(con+1,mycount);
Integer con12 = [select count() from Account];
system.AssertEquals(con11+1,con12);


}

}