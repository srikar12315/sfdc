public class AccountTrgHelper{
public static void checkDuplicates(List<Account> lstAccounts ){
        set<String>  setFirstName  = new set<String>();
        set<String>  setLastName   = new set<String>();
        set<Date>    setDOB        = new set<Date>();
        set<iD>      setAccIds     = new set<Id>();
        set<string>  setNSNnumbers = new set<string>();
        for(Account acc : lstAccounts ){
            if(acc.Name!=null && acc.Name!='')
            setFirstName.add(acc.Name);
            if(acc.PersonBirthdate__c!=null )
            setDOB.add(acc.PersonBirthdate__c);  
            if(acc.NSN_NZQA_Numbers__c!=null )
            setNSNnumbers.add(acc.NSN_NZQA_Numbers__c);
            setAccIds.add(acc.Id);  
        }
        
        Map<Id , Account> mapAccounts =new Map<Id , Account>([Select Dup_Record__c,Name,PersonBirthdate__c,NSN_NZQA_Numbers__c from Account where  ((NSN_NZQA_Numbers__c !=null AND  NSN_NZQA_Numbers__c in: setNSNnumbers) 
                                                            OR (Name in:setFirstName and PersonBirthdate__c  in: setDOB)) AND isDeleted=false AND Id NOT in:setAccIds]);
    
           set<Id> setAccountIds = new set<Id>();
           List<Account> updateAccountIds = new list<Account>();
           for(Account acc : mapAccounts.values()){
             for(Account acct : lstAccounts){
                
                 if((acc.Name== acct.Name &&   acc.PersonBirthdate__c== acct.PersonBirthdate__c) || (acc.NSN_NZQA_Numbers__c == acct.NSN_NZQA_Numbers__c ))
                 {
                     
                      
                     setAccountIds.add(acct.Id);
                     setAccountIds.add(acc.Id);    
                 }
              }
         
           }
         for(Account acct : [Select Dup_Record__c ,Id from Account where id in:setAccountIds]){
             acct.Dup_Record__c = true;
             updateAccountIds.add(acct);
            }
         update updateAccountIds;
    }
   
}