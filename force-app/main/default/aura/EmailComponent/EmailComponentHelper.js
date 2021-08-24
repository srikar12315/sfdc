({
	sendHelper : function(component,event,helper,getEmail,getSubject,getBody,getrecid) {
        
        var action=component.get("c.sendMailMethod");
        action.setParams({
            'mMail' : getEmail,
            'mSubject' : getSubject,
            'mbody' : getBody,
            'recid' : getrecid
        });
        action.setCallback(this,function(response){
           var state= response.getState();
            if(state==="SUCCESS"){
                var storeResponse = response.getReturnValue();
                var applicationEvent = $A.get("e.c:EventCloseModelPopup");
                applicationEvent.setParams({"message" : 'success'})
                applicationEvent.fire();
                console.log('cmpEvent '+applicationEvent);
                console.log('applicationEvent event fired'); 
                
            }
        });
		 $A.enqueueAction(action);
	}
})