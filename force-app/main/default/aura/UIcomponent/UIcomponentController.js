({
	getinput : function(cmp, event) {
		var fullname = cmp.find("name").get("v.value");
        var outname = cmp.find("nameOutput");
        outname.set("v.value",fullname);
	}
})