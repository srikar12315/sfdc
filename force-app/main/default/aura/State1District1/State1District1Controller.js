({
	handlingLowPComplaints : function(component, event, helper) {
		console.log("LP Message Received");
        alert("hello");
       var MessageReceived = event.getParam("complaintMessage");
        console.log("MessageReceived");
	},
    handlingMediumPComplaints : function(component, event, helper) {
		console.log("MP Message Received");
        alert("hello");
       var MessageReceived = event.getParam("complaintMessage");
        console.log("MessageReceived");
	}
})