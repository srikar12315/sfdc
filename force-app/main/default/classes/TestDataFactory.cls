@isTest
public class TestDataFactory
{

public static List<Account> createAccountswithOpp(Integer numAcct,Integer numOppsperAcct){

List<Account> accts = new List<Account>();

for(integer i=0; i<numAcct; i++){
 
   Account a = new Account(Name='TestAccount'+1);
   accts.add(a);
}
 insert accts;

List<Opportunity> opps = new List<Opportunity>();
for(integer j=0; j<numAcct; j++){
Account acct=accts[j];


for(integer k=0; k<numOppsperAcct; k++){
opps.add( new Opportunity (Name=acct.Name+'Opportunity' +k, StageNAme='Prospecting', CloseDate=system.today().addmonths(1), AccountId=acct.Id));

 }
}
insert opps;

return accts ;
}





}