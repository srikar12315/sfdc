({
	showListViewData : function(component, event, helper) {
	 var strValue = component.find("inputName").get("v.value");
     var setOptions = component.find("selectvalues");
     component.set("v.objName",strValue);
     var action = component.get("c.fetchListViews");
        action.setParams({
            "strObjName" : strValue
        });
        var optionsValues=[];
        action.setCallback(this, function(response){
         var state= response.getState();
            if(state==="SUCCESS"){
                $A.util.removeClass(component.find('div1'),'slds-hide');
                $A.util.addClass(component.find('div1'),'slds-show');
                var listviewvalue =response.getReturnValue();
                if(listviewvalue !=null && listviewvalue !=undefined){
                    optionsValues.push({
                        class:"optionclass",
                        label:"--None--",
                        value:""
                    });
                }
                for(var i=0; i<listviewvalue.length; i++){
                    optionsValues.push({
                        class:"optionsclass",
                        label:listviewvalue[i],
                        value:listviewvalue[i]
                    });
                }
                setOptions.set("v.options",optionsValues);
            }
            
        });
         $A.enqueueAction(action); 
        
	},
    showRecordsData : function(component, event, helper) {
        var selectedName=component.find("selectvalues").get("v.value");
        var lstApi = selectedName.replace(/ /g,'');
        component.set("v.viewName",lstApi);
        component.set("v.body",[]);
        $A.createComponent(
            "lightning:listView",
            {
                "objectApiName":component.find("inputName").get("v.value"),
                "listName":component.get("v.viewName"),
                "rows":8,
                "showActionBar":false,
                "enableInlineEdit":true,
                "showRowLevelActions":"true"
                
            },
            function(newListView, status, errorMessage){
                if (status === "SUCCESS") {
                    var body = component.get("v.body");
                    body.push(newListView);
                    component.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                }
                    else if (status === "ERROR") {
                        console.log("Error: " + errorMessage);
                    }
            }
        
        );
        
        
        
        
        
		
	},
})