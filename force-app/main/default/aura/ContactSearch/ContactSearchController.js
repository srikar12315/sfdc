({
	doInit : function(component, event, helper) {
        var action= component.get("c.loadData");
        action.setCallback(this,function(response){
          var state = response.getState();
            if(state=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.unfilteredData",result);
                console.log(result);
                component.set("v.data",result);
            }else{
                console.log('comething bad happened !');
            }
        });
		$A.enqueueAction(action);
	},
    doFilter : function(component, event, helper){
        helper.FilterRecords(component);
    
    }
})