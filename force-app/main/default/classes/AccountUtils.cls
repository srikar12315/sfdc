public class AccountUtils{
    
    public static List<Account> accountByState(string state){
        List<Account> accList = [Select ID, Name From Account Where BillingState=:state ];
        //system.debug('accList :' + accList);
        return accList;
        
        
    } 

}