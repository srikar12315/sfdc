public class wrapperClassController 
{
    public List<cContact> contactList{set;get;}
   public List<Contact> selectedContacts{set;get;}
    
    public List<cContact> getContacts(){
        if(contactList==null){
            contactList = new List<cContact>();
            for(Contact c:[select Id,Name, Email, Phone from Contact limit 10]){
                contactList.add(new cContact(c));
            }
        }
        return contactList;
    }
    
    public PageReference processSelected(){
         selectedContacts =new List<Contact>();
        for(cContact cCon:getContacts()){
            if(cCon.isSelected==true){
                selectedContacts.add(cCon.con);
            }
        }
        system.debug('these are the selected Contacts...');
        for(Contact con:selectedContacts){
            System.debug(con);
        }
        contactList = null;
        return null;
        
    }
    
    public class cContact
    {
     
        public Contact con{set;get;}
        public Boolean isSelected{set;get;}
        public cContact(contact c){
            con=c;
            isSelected= false;
        }
        
    }
}