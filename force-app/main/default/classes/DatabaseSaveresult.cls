public class DatabaseSaveresult
{
/***
    List<Account> accs = new List<Account>();
Account a1 = new Account(Name='DML_Test2');
Account a2 = new Account(Industry='Energy');
Account a3 = new Account();
accs.add(a1);
accs.add(a2);
accs.add(a3);
Database.SaveResult[] result=Database.insert(accs,false);
for(Database.SaveResult rs:result){
    if(rs.isSuccess()){
      system.debug('====>>>> Record Id :' + rs.getId());  
    }else{
        for(Database.Error er:rs.getErrors()){
            system.debug('====>> Error Field :' +er.getfields());
            system.debug('====>>> Error Message :' + er.getMessage());
        }
    }
}

****///

/***

List<Account> accs = [select id,name,industry from Account where createdDate=Last_N_Days:15];
for(Account a:accs){
    a.Industry='Education';
    
    a.Website='test12345.com';
}
Database.SaveResult[] drList = Database.update(accs, false);
for(database.SaveResult rs:drList){
    if(rs.issuccess()){
      system.debug('===: Updated Account ID :' + rs.getid());
  
    }
    
}

***///
/**

Account a1 = new Account(name='Parent4_upser');
insert a1;
Account a2 = new Account(name='Parent5_upser');
insert a2;
Account a3 = new Account(name='Parent6_upser');

List<Account> accs= new List<Account>();
accs.add(a1);
accs.add(a2);
accs.add(a3);
Database.UpsertResult[] result = Database.upsert(accs,false);
for(Database.UpsertResult res:result){
    if(res.isSuccess()){
        if(res.isCreated()){
            system.debug('===>>>: Record Id :'+ res.getId());
        }
    }
}











**///
}