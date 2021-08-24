({
    searchResult: function(component, event, helper) {
        var action = component.get("c.getSearchRelated");
        action.setParams({
            "searchName": component.get("v.searchName")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            //alert(state);
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                  alert(res);
                component.set("v.wrapperList", res);
            }
        });
        $A.enqueueAction(action);
    }
})