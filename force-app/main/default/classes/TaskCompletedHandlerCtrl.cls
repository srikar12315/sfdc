public class TaskCompletedHandlerCtrl {
    
    public static void TaskCompletedHandler(List<Lead> LeadIds){
         set<Id> ClosedLeads = new set<Id>();
    for(Lead leadId:LeadIds){
        if(leadId.Status =='Closed - Not Converted' || leadId.Status=='Closed - Converted')
        {
          ClosedLeads.Add(leadId.Id);    
        }
        
        
        List<Lead> myLeads =[Select id, (select id, status from Tasks) from Lead where Id IN:ClosedLeads];
        map<Id, List<Task>> taskMap = new map<Id, List<Task>>();
        
        
        for(Lead ld:myLeads){
            taskMap.put(ld.Id, ld.Tasks);
            System.debug('***** taskMap :'+taskMap);
        }
        
        List<Task> TasktoUpdate = new List<Task>();
        for(Lead mylead : LeadIds){   
            for(Task t : taskMap.get(mylead.Id)){
                system.debug('t#### :' + t);
                t.Status ='Completed';
                TasktoUpdate.Add(t);
            }
            
        }
       update TasktoUpdate;
   
    }
        
    }

}