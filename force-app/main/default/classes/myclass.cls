public class myclass
{
    public ApexPages.StandardSetController lee{get;set;}  
    public ApexPages.StandardSetController con{get;set;}

    public List<LeadWrapperCls> records{get;set;}
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}

    public myclass()
    {  
        records = new List<LeadWrapperCls>();
        lee = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, LastName, MobilePhone,Email FROM Lead]));    
        con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, LastName, MobilePhone,Email FROM Contact]));  
      
        lee.setPageNumber(1);     
        lee.setPageSize(1);
        con.setPageSize(2);
        noOfRecords = lee.getResultSize() + con.getResultSize();
        getrecords();
    }
  
    public List<LeadWrapperCls> getrecords()
    {
        records = new List<LeadWrapperCls>();  
        for(Lead category : (List<Lead>)lee.getRecords())
        {
            records.add(new LeadWrapperCls(category));
            system.debug('wrapper lead list' +records );                 
        }                     
 
        for(Contact category : (List<Contact>)con.getRecords())
        {
            records.add(new LeadWrapperCls(category));
            system.debug('wrapper contact list' +records );
        }
        return records ;
    }
    
    public Boolean hasNext 
    {
        get{
        return lee.getHasNext();
        }
        set;
    }
    
    public Boolean hasPrevious 
    {
        get{
        return lee.getHasPrevious();
        }
        set;
    }
 
    public Integer pageNumber 
    {
        get {
            return lee.getPageNumber();
        }
        set;
    }
 
    public void first() 
    {
        lee.first();
    }
 
    public void last() 
    {
        lee.last();
    }
 
    public void previous() 
    {
        lee.previous();
    }
 
    public void next() 
    {
        lee.next();
    }   

    public class LeadWrapperCls
    {
        public Boolean isSelected {get;set;}
        public Id  id{get;set;}
        public string name{get;set;}
        public string opp{get;set;}
        public String email{set;get;}
        public String phone{set;get;}
        public String type{set;get;}   
        
        public LeadWrapperCls(Lead llead)
        {
            this.id = llead.Id;  
            this.name=llead.LastName;
            this.email=llead.Email;
            this.phone=llead.MobilePhone;     
            isSelected=false;
            type = 'Lead';
        }
       
        public LeadWrapperCls(Contact cCon)
        {
            this.id = cCon.Id;  
            this.name=cCon.LastName;
            this.email=cCon.Email;
            this.phone=cCon.MobilePhone;     
            isSelected=false;
            type = 'Contact';
        }
    }
}