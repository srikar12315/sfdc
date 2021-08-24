({
	doInit : function(component, event, helper) {
        component.set('v.columns',[
            {label:'Name',fieldName:'Name',type:'text'},
            {label:'Build Year',fieldName:'BuildYear',type:'number'},
            {label:'Rent/Day',fieldName:'PerDayRent',type:'currency',
             typeAttributes:{currencyCode:'USD'}},
             {label: 'Mileage', fieldName: 'Mileage', type: 'number'},
            {label: 'Available', fieldName: 'AvailableForRent', type: 'boolean'},
            {label: 'View', type: 'button', initialWidth: 135, typeAttributes: 
             { label: 'View Details', name: 'view_details', title: 'Click to View Details'}}
            
        ]);
        
		helper.getCars(component,helper);
	},
    /**
     * Handle row click and generate map component dynamically
     * */
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        //get currently selected car
        var car = event.getParam('row');
        switch (action.name) {
            case 'view_details':
                helper.showMap(component, helper, car);
                break;
            default:
                helper.showMap(component, helper, car);
                break;
        }
    },
})