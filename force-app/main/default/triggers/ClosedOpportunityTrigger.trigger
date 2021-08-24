trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> tskList = new List<Task>();
    
    for(Opportunity op:[SELECT id,StageName from Opportunity
                        where StageName='Closed Won' AND id IN:Trigger.New]){
                            tskList.add(new Task(subject='Follow up Test Task',
                                                WhatId=op.Id));
                        }

    if(tskList.size()>0){
        insert tskList;
    }
    
    
    
}