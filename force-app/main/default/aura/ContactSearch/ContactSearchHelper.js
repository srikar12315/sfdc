({
	FilterRecords : function(component) {
        var data=component.get("v.data");
        var allData=component.get("v.unfilteredData");
        var searchKey = component.get("v.filter");
        
        if(data!=undefined || data.length>0){
            var filteredData = allData.filter(word => (!searchKey) || word.Name.toLowerCase().indexOf(searchKey.toLowerCase())>-1);
            
        }
        component.set("v.data",filteredData);
        
        if(searchKey==''){
            component.set("v.data",component.get("v.unfilteredData"));
        }
        
		
	}
})