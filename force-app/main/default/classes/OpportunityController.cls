public with sharing  class  OpportunityController 
{
    @AuraEnabled
    public static List<Opportunity> getOpportunities(){
        
        List<Opportunity> opportunities =[SELECT Id, Name,  Amount FROM Opportunity];
        
        return opportunities;
        
    }
    
    
    
}