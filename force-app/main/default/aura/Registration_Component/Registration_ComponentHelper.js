({
	onClickCheckBoxhelper : function(cmp) {
        
        // BODY OF helper
        // define your logic in this function;
        console.log("This text is from HElper function");
        var checkBoxValue = cmp.find("checkBox").get("v.checked");
        // Data change occurs whenever we click on the checkbox
        // if checkbox is marked --> CheckBoxValue attribute is TRUE
        // if checkbox is unchecked --> CheckBoxValue attribute is set to FALSE
        cmp.set("v.CheckBoxValue",checkBoxValue);
        cmp.set("v.RegForm.Available_on_Weekends__c",checkBoxValue);
        
		
	}
})