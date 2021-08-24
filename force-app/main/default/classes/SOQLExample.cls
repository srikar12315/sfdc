public class SOQLExample {

    public SOQLExample(ApexPages.StandardController controller) {

    }

    Public List<Account> accs{set; get;}
    Public String industry {set; get;}
    Public void getData(){
        string queryaccs ='select name,industry from Account';
        if(industry!=null && industry!=''){
           
            queryaccs=queryaccs+' where industry=\''+industry+'\'';
            
        }
       accs=Database.query(queryaccs);
       // accs =[select name, industry from account where industry=:industry];
        
    }

}