({
	getCars  : function(component, helper) {
        var action= component.get("c.getAllCars");
        action.setCallback(this, function(response){
          var state = response.getState();
            if(state==="SUCCESS"){
                component.set("v.data", response.getReturnValue());
                this.showToast({
                    "title":"SUCCESS",
                    "type":"success",
                    "message":"User Events Loaded"
                });
            
            }else{
                this.showToast({
                    "title":"ERROR",
                    "type":"error",
                    "message":"Error in retrieving events"
                    
                });
            }
        });
     $A.enqueueAction(action);   
		
	},
    /**
     * This method will generate map component dynamically
     * based on currently selected car locations
     * */
    showMap : function(component, helper, car) {
        //Destroying existing mapComponent if exist
        var mapComponent = component.find('mapComponent');
        if(mapComponent){
            mapComponent.destroy();
        }
        //Get mapContainer Div to dynamically generate map
        //and push it in div body
        var mapContainer = component.find('mapContainer');
        var mapBody = mapContainer.get("v.body");
        
        $A.createComponent(
            "lightning:map",
            {
                //passing attribute values to dynamic map component
                "aura:id" : 'mapComponent',//aura:id of dynamic map component
                "mapMarkers" : car.carAddressList,
                "zoomLevel" : 4,
                "markersTitle" : 'Pick '+car.Name+' From These Locations',
                "showFooter" : 'false'
            },
            function(lightningMap){  
                	//Adding map component body to div element
                    mapBody.push(lightningMap);
                    mapContainer.set("v.body", mapBody); 
            });
    },
    
     showToast : function(params) {
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            if(!params){
                toastEvent.setParams({
                    "title": "TOAST ERROR!",
                    "type": "error",
                    "message": "Toast Param not defined"
                });
                toastEvent.fire();
            } else{
                toastEvent.setParams(params);
                toastEvent.fire();
            }
        }
    },
})