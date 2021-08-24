({
	forwardLPComplaint : function(component, event, helper) {
      var LPCEvent = component.getEvent("LowPriorityComplaintFromTownship1");
        // 2. set the attribute value
        LPCEvent.setParams({"complaintMessage":"Township 2 is not behaving properly."});
        //3. fire the event
        LPCEvent.fire(); 
	},
    forwardMPComplaint : function(component, event, helper) {
      var MPCEvent = component.getEvent("MediumPriorityComplaintFromTownship1");
        // 2. set the attribute value
        MPCEvent.setParams({"complaintMessage":"Township 2 is dumping wastein town 1."});
        //3. fire the event
        MPCEvent.fire(); 
	},
    forwardHPComplaint : function(component, event, helper) {
      var HPCEvent = component.getEvent("HighPriorityComplaintFromTownship1");
        // 2. set the attribute value
        HPCEvent.setParams({"complaintMessage":"Township 2 high ."});
        //3. fire the event
        HPCEvent.fire(); 
	}
})