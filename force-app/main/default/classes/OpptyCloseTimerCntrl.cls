public class OpptyCloseTimerCntrl {	 
    @AuraEnabled	    
    public static Date fetchOpptyCloseDate(String recId){	        
        Opportunity opp = [select CloseDate from Opportunity where id =: recId];	        
        system.debug('Close Date: ' +opp.CloseDate);	        	        
        return opp.CloseDate;	    
    }	
}