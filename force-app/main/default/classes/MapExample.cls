public class MapExample
{


/*******




Map<Integer, String> m = new Map<Integer, String>(); // Define a new map
m.put(1, 'First entry');                  // Insert a new key-value pair in the map
m.put(2, 'Second entry');                  // Insert a new key-value pair in the map
m.put(3, 'third entry');    
System.assert(m.containsKey(1));  // Assert that the map contains a key
String value = m.get(2);               // Retrieve a value, given a particular key
system.debug('====>>> Value: ' + value);
System.assertEquals('Second entry', value);
Set<Integer> s = m.keySet();       // Return a set that contains all of the keys in the map
system.debug('====>>> S: ' + s);

Map<id,account> Mapvar = new Map<id,account>([Select Id,Name from Account where Name!='']); 
List<account> accList = Mapvar.values() ; 
system.debug('====>>>> : accList'+ accList);
Set<id> accIds = Mapvar.keySet() ;
system.debug('====>>>> : accIds'+ accIds);



Map<Id, Account> accs =new Map<Id, Account>([select id,name,Industry from account]);
List<Account> accaValues=accs.values();
for(Account a:accaValues){
    system.debug(a);
}


******/


public List<SelectOption> cities{set;get;}
public List<SelectOption> places{set;get;}
public Map<String,List<String>> cityMap{set;get;}
public String selected{set;get;}
public MapExample(){

cities = new List<SelectOption>();
places = new List<SelectOption>();
cityMap= new Map<String, List<String>>();
List<String> hplaces = new List<String>{'SRNagar','LBNagar'};
List<String> pplaces = new List<String>{'Hinjanwadi','DhangeChowk'};
List<String> bplaces = new List<String>{'ECity','Marthali'};
cityMap.put('Hyd',hplaces);
cityMap.put('Ban',bplaces);
cityMap.put('Pune',pplaces);
SelectOption n = new SelectOption('None','-None-');
cities.add(n);
places.add(n);

for(String s:cityMap.KeySet()){

SelectOption op =new SelectOption(s,s);
cities.add(op);

}



}


public void getData(){
places.clear();
selectOption n= new selectOption('None','-None-');
places.add(n);
if(selected !='None'){

List<String> selectedPlaces=cityMap.get(selected);
for(String s:selectedPlaces){
SelectOption op = new SelectOption(s,s);
Places.add(op);

}
}

}



























}