({
	fetchAccounts : function(component, event, helper) {
        var action = component.get("c.fetchAccts");
        action.setParams({});
        action.setCallback(this, function(response){
                           var state= response.getState();
            if(state ==="SUCCESS"){
                component.set("v.accList" , response.getReturnValue());
            }
        
                           });
        $A.enqueueAction(action);
		
	},
    editAccount : function(component, event, helper) {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
             "recordId": event.target.Id
       });
       editRecordEvent.fire();
    },
    viewAccount : function(component, event, helper) {
        var viewRecordEvent = $A.get("e.force:navigateToURL");
        viewRecordEvent.setParams({
             "url": "/" + event.target.id
       });
       viewRecordEvent.fire();
    }
})