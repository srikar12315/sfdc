public class SOQLExample1 {

public List<Account> accs {set;get;}
public String industry {set;get;}

public void getData(){
  String query12='select id,name,phone,industry from Account';
  if(industry!=null && industry!=''){
  
  query12 =query12+' where industry =\''+industry+'\'';
  
  
  }
  accs=Database.query(query12);
  
 }


}