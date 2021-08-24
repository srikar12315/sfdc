trigger AddRelatedRecord1 on Account (after insert, after update) {
    
    List<Opportunity> oppList = New List<Opportunity>();
    map<id,Account> acctsWithOpps = new map<id, Account>(
    [select id,(select id from Opportunities) from account where Id IN: Trigger.new ]);
    
    for(Account a:Trigger.New){
        system.debug('AcctsWithopps.get(a.Id).Opportunities.size()='+ acctsWithOpps.get(a.Id).Opportunities.size());
   
        if(acctsWithOpps.get(a.Id).opportunities.size()==0){
            oppList.add(new Opportunity(name=a.Name + 'Opportunity',
                                       stageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=a.Id));
        }
    }
    if(oppList.size()>0){
        insert oppList;
        System.debug('=====>>>' + oppList);
    }
    
    
    

}