public class AccountProcessor
{
  @future
  public static void countContacts(Set<id> setId)
  {
      List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :setId ];
      for( Account acc : lstAccount )
      {
          List<Contact> lstCont = acc.contacts ;
         
          system.debug('========= :lstCont  '+ lstCont );
          acc.Number_of_Contacts__c = lstCont.size();
      }
       system.debug('========= :lstAccount'+ lstAccount);
      update lstAccount;
  }
}