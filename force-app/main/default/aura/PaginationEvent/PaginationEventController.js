({
	previousDetail : function(component, event, helper) {
        var evt = component.getEvent("AccountPaginationCmpEvent");
        evt.setParams({"buttonClick" :"Prev"});
        evt.fire();
		
	},
    nextDetail : function(component, event, helper) {
    var evt= component.getEvent("AccountPaginationCmpEvent");
    evt.setParams({"buttonClick" : "Next "});
    evt.fire();
   	}
    
    
})