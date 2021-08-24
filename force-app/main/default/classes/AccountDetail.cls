public class AccountDetail {
    //https://www.sfdcblogs.com/post/pagination-using-component-events-in-aura-component?fbclid=IwAR0RG1HexcYIk_q3frV1BfSZX7fHmBBr_-EExPe7URFxqhyTeJ8LaPYYZAA
    @AuraEnabled
    public static list<Account> getAccountAll(string type1, integer i)
    {
        List<Account> listAcc;
        if(type1 == 'All')        
          listAcc = [select id,name,AnnualRevenue,Type from account limit 5 offset :i];
        else
            listAcc = [select id,name,AnnualRevenue,Type from account where Type = :type1 limit 5 offset :i];
        
        return listAcc;
    }
    
    @AuraEnabled
    public static List<String> getAccountType()
    {
        List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
		}     
		return pickListValuesList;
    }
     @AuraEnabled
    public static void deleteRecord(String recordId)
    {        
        List<Account> accRecord = [select Id from Account where Id = :recordId ]; 
        system.debug('record id' + recordId);
        try
        {
            delete accRecord;
        }
        catch(DmlException e)
        {
            System.debug(e.getMessage());
        }
    }
      @AuraEnabled
    public static void deleteMultipleAccount(List<String> recordId)
    {        
        List<Account> accRecord = [select Id from Account where Id in :recordId ]; 
        system.debug('record ids ' + recordId);
        system.debug('accRecord ' + accRecord);
        try
        {
            delete accRecord;
        }
        catch(DmlException e)
        {
            System.debug(e.getMessage());
        }
    }
}