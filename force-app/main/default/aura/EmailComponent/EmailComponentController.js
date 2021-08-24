({
	sendMail : function(component, event, helper) {
        var getEmail = component.get("v.email");
        var getSubject = component.get("v.subject");
        var getBody = component.get("v.bodytext");
        var getrecid=component.get("v.recordId");
        
        if($A.util.isEmpty(getEmail) || !getEmail.includes('@')){
            alert('Please Enter valid Email Address');
            
        }else {
            helper.sendHelper(component,event,helper,getEmail, getSubject, getBody, getrecid);
        }
        
        
		
	},
    closeMessage:function(component,event,helper){
        component.set("v.mailStatus",false);
        component.set("v.email",null);
        component.set("v.subject",null);
        component.set("v.bodytext",null);
    }
})