public with sharing class RecordSelectionPaginationController{  
    Map<integer,List<cOpportunity>> mapOpportunityPages = new Map<integer,List<cOpportunity>>();   
    public integer intPageNumber{get;set;}      
    public integer intNumberofPages{get;set;}  
    public string emailSub{get;set;}
    public string emailBody{get;set;}    
    public string gcocomms{get;set;}
    public List<cOpportunity> getLstOppRecords(){  
        List<cOpportunity> lstOpp= new List<cOpportunity>();  
        lstOpp.addAll(mapOpportunityPages.get(intPageNumber));  
        return lstOpp;  
    }  
    // public Attachment attachment {get;set;}
     public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }
    public RecordSelectionPaginationController(ApexPages.StandardController controller) {  
    
    }  
    public List<SelectOption> getGcoCommslst(){
        List<SelectOption> options = new List<SelectOption>();
        Schema.DescribeFieldResult fieldResult = user.GCO_Comms__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        options.add(new SelectOption('--None--' , '--None--')); 
        for( Schema.PicklistEntry f : ple){
            options.add(new SelectOption(f.getLabel(), f.getValue()));
        }       
        return options;
    }   
          
    public Pagereference setPagination() {  
        integer NumberofRecords = 0;  
        integer pagenumber = 1;          
        for (Opportunity objOpp :[SELECT Id,Name,StageName,Account.Name FROM Opportunity LIMIT 10000]) {  
            if (NumberofRecords < 10) {  
                if (mapOpportunityPages.containsKey(pagenumber)){  
                    mapOpportunityPages.get(pagenumber).add(new cOpportunity(objOpp,false));  
                }  
                else {  
                    mapOpportunityPages.put(pagenumber,new List<cOpportunity>{new cOpportunity(objOpp,false)});  
                }  
                NumberofRecords++;  
                if (NumberofRecords == 10) {  
                    NumberofRecords = 0;  
                    pagenumber++;  
                }  
            }  
        }  
        intNumberofPages = mapOpportunityPages.size();  
        intPageNumber =1;  
        getLstOppRecords();  
        return null;  
    }  
    public Boolean hasNext {  
        get {  
            if (intNumberofPages <= intPageNumber) {  
                return false;  
            }  
            else {  
                return true;  
            }  
        }  
        set;  
    }     
    public Boolean hasPrevious {  
        get {  
            if (intPageNumber == 1) {  
                return false;  
            }  
            else {  
                return true;  
            }  
        }  
        set;  
    }  
    public void first() {  
        intPageNumber = 1;  
        getLstOppRecords();  
    }  
    public void last() {  
        intPageNumber=intNumberofPages;   
        getLstOppRecords();  
    }   
    public void previous() {  
        intPageNumber--;  
        getLstOppRecords();  
    }  
    public void next() {  
        intPageNumber++;  
        getLstOppRecords();  
    }  
    // Wrapper to wrap the Checkbox value and Objrecord together  
    public class cOpportunity {  
        public Opportunity objOpp{get;set;}  
        public Boolean Selected{get;set;}   
        public cOpportunity(Opportunity objOpp,Boolean bSel) {  
            this.objOpp = objOpp;  
            this.Selected = bSel;  
        }   
    }  
    public void upload() {  
        system.debug('emailSub :'+emailSub);
        system.debug('emailBody :'+emailBody);
        system.debug('attachment.body :'+attachment.body);
        system.debug('attachment.name :'+attachment.name);
        
        
    }  
}