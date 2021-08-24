public class AccountTriggerHelper {

    public static void beforeUpdate(List<Account> accs){
        for(Account a:accs){
            if(a.industry=='Banking'){
                a.phone='123456';
                a.addError('Banking Record cannot be modified');
            }
        }
    }
    Public static void afterUpdate(List<Account> accs){
        List<Contact> cons = New List<Contact>();
        for(Account a:accs){
            Contact c = new Contact();
            c.AccountId = a.Id;
            c.LastName = a.Name;
            c.Phone = a.phone;
            cons.add(c);
        }
        insert cons;
    }
}