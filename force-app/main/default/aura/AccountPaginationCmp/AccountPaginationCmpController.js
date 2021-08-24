({
    myAction : function(cmp, event, helper) {        
        cmp.set('v.columns', [
            {label: 'Account ID', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'text'},
            {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'text'}            
        ]);        
        helper.helperMethod(cmp,cmp.get("v.offset"));        
        helper.getAccountType(cmp); 
    },
    
    onAccountTypeChange : function(cmp,event,helper)
    {
        cmp.find("selectedAccountType").set("v.value",cmp.find("AccountType").get("v.value"));
        helper.helperMethod(cmp,cmp.get("v.offset"));        
    },
    
    OnDeleteAccount : function(cmp,event,helper)
    {
        helper.deleteAccountRecord(cmp);
        
    },
    
    OndeleteMultipleAccount : function(cmp,event,helper)
    {
        helper.deleteMultipleAccount(cmp);
    }  ,
    
    NavigateToAccountDetailPage : function(cmp,event,helper)
    { 
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Account",
            "defaultFieldValues": {
                'Name' : 'suptest',
                'Type' : 'Customer - Direct'
            } 
        });   
        createRecordEvent.fire();        
    },
    
    EditAccountDetail : function(cmp,event,helper)
    {         
        var recordID =  cmp.find('dtAcc').getSelectedRows();       
        if(recordID.length ==1)
        {
            var editRecordEvent = $A.get("e.force:editRecord");   
            editRecordEvent.setParams({
                "recordId": recordID[0].Id
            });
            editRecordEvent.fire();
        }
        else
            alert('Please select record');
    },
    
    
    handlepagination: function(cmp,event,helper)
    {
        debugger;
        var hiddenElement = document.createElement('a');
        var val = event.getParam("buttonClick");
        if(val =="Prev")
        { 
            helper.GetPreviousRec(cmp);
        }
        else
        { 
            helper.GetNextRec(cmp);
        }
        
        
    }
})