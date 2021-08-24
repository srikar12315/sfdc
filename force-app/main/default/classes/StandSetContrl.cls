public class StandSetContrl {
    public List<Account> accs {set; get;}
    Public StandSetContrl(ApexPages.StandardSetController controller){
        String[] fields=new String[]{'Name','Industry','Phone'};
            controller.addfields(fields);
        accs =(List<Account>)controller.getselected();
    }
    
}