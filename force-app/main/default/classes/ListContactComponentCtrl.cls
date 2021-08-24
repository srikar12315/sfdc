public class ListContactComponentCtrl {
    @AuraEnabled
    public static List<Contact> loadData(){
        List<Contact> conList =[select id,Name,Email from Contact order by name asc];
        return conList;
    }

}