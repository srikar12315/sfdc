({
    helperMethod : function(cmp,offsetVal) {
        var action =  cmp.get("c.getAccountAll");
        action.setParams({
            type1 : cmp.find("AccountType").get("v.value"),
            i : offsetVal
        });
        
        action.setCallback(this,function(response){
            var status = response.getState();
            if(status== "SUCCESS")
            {
                debugger;
                var value = response.getReturnValue();
                console.log(value);
                cmp.set("v.data",value);
                if(value.length > 0 )
                cmp.set("v.offset",offsetVal);
				else
                    alert("No records found to display");                
            }
            else
            {
                alert("error in data");
            }
        });
        $A.enqueueAction(action);        
    },
    
    getAccountType : function(cmp)
    {        
        var action  = cmp.get('c.getAccountType');
        action.setCallback(this,function(response){
            var status = response.getState();
            if(status== "SUCCESS")
            {             
             var value = response.getReturnValue();
             // set attribute value ----------------------
             cmp.set("v.accTypeList",value);               
             // tp get field value first find and then set ---------------              
            }
            else
            {
                alert("error in data");
            }
        });
        $A.enqueueAction(action);
    },
    
    deleteAccountRecord : function(cmp) {
        debugger;
        var action =  cmp.get("c.deleteRecord");
        var recordID =  cmp.find('dtAcc').getSelectedRows();
        action.setParams({
            recordId : recordID[0].Id
        });
        
        action.setCallback(this,function(response){
            var status = response.getState();
            if(status== "SUCCESS")
            {
                var value = response.getReturnValue();
                console.log(value);   
                
              //  this.helperMethod(cmp);  
                alert('record deleted');
            }
            else
            {
                alert("error in data");
            }
        });
        $A.enqueueAction(action);        
    }
    ,    
    deleteMultipleAccount : function(cmp) {
        debugger;
        var action =  cmp.get("c.deleteMultipleAccount");
        var rowArray =  cmp.find('dtAcc').getSelectedRows();
        var recordIDs = [];
        for (var i in rowArray)
        {
            recordIDs.push(rowArray[i].Id);
        }
        action.setParams({
            recordId : recordIDs
        });
        
        action.setCallback(this,function(response){
            var status = response.getState();
            if(status== "SUCCESS")
            {
                var value = response.getReturnValue();
                console.log(value);   
                alert('records deleted');
              //  this.helperMethod(cmp); 
            }
            else
            {
                alert("error in data");
            }
        });
        $A.enqueueAction(action);        
    },
    GetPreviousRec : function(cmp)
    {
        var offsetVal =  cmp.get("v.offset");
        if(offsetVal < 5)
        {
            alert("No records found to display");
            return;
        }
        offsetVal = offsetVal -5;
        this.helperMethod(cmp,offsetVal);
    },
    
    GetNextRec : function(cmp)
    {
        var offsetVal =  cmp.get("v.offset");        
        offsetVal = offsetVal + 5;
        this.helperMethod(cmp,offsetVal);
    }  ,
})