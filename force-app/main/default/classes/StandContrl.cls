public class StandContrl {
   public Account accs {set; get;}
    public StandContrl(ApexPages.StandardController controller){
        List<string> fields = new List<string>{'Name','Industry','Phone','AnnualRevenue','BillingAddress'};
            controller.addfields(fields);
        accs =(Account)controller.getrecord();
    }
}