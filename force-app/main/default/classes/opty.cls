public class opty {
   // public boolean editopportunity{set; get;}
    public boolean isEdit{get;set;}
    public String pname{set;get;}
    public String pcode{set;get;}    
    private final Opportunity opp;
    private Opportunity theopp;
    public List<Product2> prds{get;set;}
    public List<OpportunityLineItem> allOppLItem{get;set;}
    Public List<oppProductWrapper> ProdWrapperList {get; set;}
    Public List<oppLineItemsWrapper> oppLineItemsWrapperList {get; set;}
    
    public opty(ApexPages.StandardController stdController) {
        theOpp = [select Id, Pricebook2Id from Opportunity where Id = :stdController.getRecord().Id];
        this.opp = (Opportunity)theOpp;
        //this.opp = (Opportunity)stdController.getRecord();
        displayoppLineItems();
    }
    
    // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name, ProductCode, Description FROM Product2 Order By Name limit 100]));
                // sets the number of records in each page set
                con.setPageSize(5);
            }
            return con;
        }
        set;
    }
    
    public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }

    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }

    // returns the first page of records
     public void first() {
         con.first();
     }

     // returns the last page of records
     public void last() {
         con.last();
     }

     // returns the previous page of records
     public void previous() {
         con.previous();
     }

     // returns the next page of records
     public void next() {
         con.next();
     }

     // returns the PageReference of the original page, if known, or the home page.
     public void cancel() {
         con.cancel();
     }

    
    
    /*Searching Products */
    public void SearchPrds() {
        prds = new List<Product2>();    
        System.debug('--insearchprds--');
        try{
            String cond='';
            if( pname != null && pname != ''){
                cond = 'Name like \'%' + pname + '%\' OR ProductCode like \'%' + pname +'%\' OR Description like \'%' + pname +'%\'' ; 
                System.debug('--1--');
            }            
            else if( pname == ''){
                cond = 'Id !=null';
                System.debug('--3--');
            }
            system.debug('--cond--'+cond);
            
            String prdsQuery = getCreatableFieldsSOQL('Product2', cond);
            system.debug('--query--'+prdsQuery);
            prds =  Database.query(prdsQuery);
            system.debug('---prds'+prds);
            ProdWrapperList = new List<oppProductWrapper>();
            
            for(Product2 P: prds) {
                ProdWrapperList.add(new oppProductWrapper(P,false));
            }
            //return null;
         }
         catch(QueryException qe){
             ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, qe.getMessage()));
             //return NULL;
         }
    }
    
    public void removeopplineItems() {
        List<OpportunityLineItem> OliListToBeDeleted = new List<OpportunityLineItem>();
        if (!oppLineItemsWrapperList.isEmpty() && oppLineItemsWrapperList != null) {
            for (oppLineItemsWrapper oliWrapper : oppLineItemsWrapperList) {
                if (oliWrapper.selected == true) {
                    OliListToBeDeleted.add(oliWrapper.oppLineItem);
                }   
            }
        }
        system.debug('---OliListToBeDeleted--'+OliListToBeDeleted);
        if (!OliListToBeDeleted.isEmpty() && OliListToBeDeleted != null) {
            delete OliListToBeDeleted;
            displayoppLineItems();
        }
    }
    public void displayoppLineItems() {
        oppLineItemsWrapperList = new List<oppLineItemsWrapper>();
        for(OpportunityLineItem oli : [Select Id, Product2.Name, Product2.Family ,Product2.ProductCode, ListPrice,
                                           Quantity, UnitPrice, Discount, TotalPrice
                                           from OpportunityLineItem where OpportunityId =: theOpp.Id]){
                oppLineItemsWrapperList.add(new oppLineItemsWrapper(oli,false));
            }
    }
    public void addOppLine(){
        List<OpportunityLineItem> OppLItemToBeInserted = new List<OpportunityLineItem>();        
        allOppLItem = new List<OpportunityLineItem>();
        
        try{
            System.debug('--addOppLine--');
            for(Integer i = 0; i < ProdWrapperList.size(); i++){
                oppProductWrapper opw = ProdWrapperList[i];
                System.debug('--addOppLine--for--');
                
                if (opw.selected == True) {      
                    System.debug('--addOppLine--for--if--');
                    
                    for ( PriceBookEntry PB : [Select Id, UnitPrice,Name,Pricebook2Id,Product2Id from PriceBookEntry where Product2Id=:opw.ProdRec.Id and Pricebook2Id =: opp.Pricebook2Id])
                    {                        
                        OpportunityLineItem OLI = new OpportunityLineItem(
                        OpportunityId = opp.Id, PricebookEntryId = PB.Id,Quantity=1, TotalPrice = 1 * PB.UnitPrice
                        );
                        OppLItemToBeInserted.add(OLI);                        
                    }
                    
                    //OpportunityLineItem OLI = new OpportunityLineItem(
                     //   OpportunityId = opp.Id, Product2 = opw.ProdRec.Id);
                    //OppLItem.add(OLI);
                }
                
            }
            System.debug('--addOppLine--for--if--OppLItem--'+OppLItemToBeInserted.size());
                    
            insert OppLItemToBeInserted;
            System.debug('--addOppLine--for--if--OppLItem--'+OppLItemToBeInserted);
            
            displayoppLineItems();
            
            System.debug('--addOppLine--for--if--OppLItem--'+oppLineItemsWrapperList.size());
            System.debug('--addOppLine--for--if--OppLItem--'+allOppLItem);
        }
        catch (Exception e) {
            
            // Catch All Possible Errors with External Class
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL, 'addOppLinesFromprodwrapper: The following exception has occurred: ' + e.getMessage()));
            
        }
    }
    
    /**
    *Returns a dynamic SOQL statement for the whole object, includes only creatable fields since we will be inserting a cloned result of this query
    */
    public static string getCreatableFieldsSOQL(String objectName, String whereClause){
        String selects = '';
        
        if(whereClause == null || whereClause == ''){
            return null;
        }
        
        //get a map of field names and field tokens
        Map<String, Schema.SObjectField> fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
        List<String> selectFields = new List<String>();
        
        if(fMap!=null){
            for(Schema.SObjectField ft : fMap.values()){ //loop through all field tokens (ft)
                Schema.DescribeFieldResult fd = ft.getDescribe(); //describe each field (fd)
                if (fd.isCreateable()){ //field is creatable
                    selectFields.add(fd.getName());
                }
            }
        }
        
        if(!selectFields.isEmpty()){
            for (string s: selectFields){
                selects += s + ',';
            }
            if(selects.endsWith(',')){
                selects = selects.substring(0,selects.lastIndexOf(','));
            }            
        }
        
        String PriceBookEntry = '(Select Id from PricebookEntries)';
        
        //return 'SELECT ' + selects+ PriceBookEntry + ' FROM ' + objectName + ' WHERE ' + whereClause;
        return 'SELECT ' + selects+ ' FROM ' + objectName + ' WHERE ' + whereClause;
    }
    
    /*This is the wrapper class*/
    public class oppProductWrapper {
        public Product2 ProdRec{get; set;}
        public Boolean selected{get; set;}
        /*This is the constructor for wrapper class*/ 
        public oppProductWrapper (Product2 prod,Boolean s) {
            this.ProdRec = Prod;
            this.selected= s;
        }
        
       

    
    }
    
     public class oppLineItemsWrapper {
        public OpportunityLineItem oppLineItem{get; set;}
         public Boolean selected{get; set;}
        /*This is the constructor for wrapper class*/ 
        public oppLineItemsWrapper(OpportunityLineItem oppLineItem, Boolean s) {
            this.oppLineItem = oppLineItem;
            this.selected= s;
        }
    }
  
    
}