public class UseWrapperCtr 
{
    public List<Wrappercls> lstAccWrapper{get;set;}
    public UseWrapperCtr(){
        lstAccWrapper = new List<Wrappercls>();
        List<Account> accounts=[select id,Name,Rating,createddate from Account where rating!=null];
        for(Account a:accounts){
            Wrappercls w = new Wrappercls();
            w.accName =a.Name;
            w.ratingName=a.Rating;
            w.dayName=returnDayName(a.CreatedDate);
            lstAccWrapper.add(w);
        }
        
    } 
    // creating wrapper class
    public class Wrappercls{
        public String accName{get;set;}
        public String ratingName{get;set;}
        public String dayName{get;set;}
    }
    public String returnDayName(Datetime accCreateDate){
        String dayName=accCreateDate.format('EEEE');
        return dayName;
    }
}