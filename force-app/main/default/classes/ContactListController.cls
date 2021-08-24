public class ContactListController {
    
    @AuraEnabled
   public static List<Contact> findAll(){
        List<Contact> lstCon = [Select id, Name, Phone from Contact];
        return lstCon;
    }

}