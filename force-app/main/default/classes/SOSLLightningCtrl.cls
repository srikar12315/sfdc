public class SOSLLightningCtrl {
    
    @AuraEnabled
    public static WraperForStorage getSearchRelated(String searchName){
        WraperForStorage  SOSLWrp = new WraperForStorage ();
        if(searchName != null && searchName !=' '){
         String searchQuery = 'FIND \'' + searchName + '\' RETURNING Account(Id,Name,Type), Contact(Id,Name,Account.Name where Account.Name =:searchName),Opportunity(Id,Name,Account.Name where Account.Name =:searchName)';  
              system.debug('searchResult111 :' + searchQuery);
            List<List<SObject>> searchResult = Search.query(searchQuery);
            system.debug('searchResult :' + searchResult);
            Account[] accs = (Account[])searchResult[0];
            system.debug('searchResult1 :' + accs);
            Contact[] cons = (Contact[])searchResult[1];
            system.debug('searchResult2 :' + cons);
            Opportunity[] oop =(Opportunity[])searchResult[2];
            system.debug('searchResult3 :' + oop);
            
            SOSLWrp.lstAccs=accs;
            SOSLWrp.lstConts=cons;
            SOSLWrp.lstOpptys=oop;
            
        }
        
        return SOSLWrp;
        
    }
    
    public class WraperForStorage {
        @AuraEnabled 
        public List<Account> lstAccs {get; set;}
        @AuraEnabled 
        public List<Contact> lstConts {get; set;}
        @AuraEnabled
        public List<Opportunity> lstOpptys {get; set;}
        
        public WraperForStorage (){
            
        }
        
    }
}