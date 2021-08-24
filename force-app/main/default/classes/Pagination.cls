public with sharing class Pagination {
    
    public integer noOfRecords{set; get;}
    public integer size{set; get;}
    public ApexPages.StandardSetController setcon{
        get{
            if(setcon ==null){
              size=10;
              string queryString='Select Name, Type, BIllingCity, BillingCountry,BillingState  from Account order by Name';
              setcon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
              setcon.setPageSize(size);
              noOfRecords=setcon.getResultSize();
            }
            return setcon;
           }set;
        }
          
    public List<Account> getAccounts(){
        List<Account> accList =new List<Account>();
        for(Account a:(List<Account>)setcon.getRecords())
            accList.add(a);
        return accList;
      }
    
    public pageReference refresh(){
        setcon=null;
        getAccounts();
        setcon.setPageNumber(1);
        return null;
    }
  }