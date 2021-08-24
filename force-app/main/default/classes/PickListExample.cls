public class PickListExample {

public List<SelectOption> options {set;get;}
public List<SelectOption> cources {set;get;}

public PickListExample (){

options  = new List<SelectOption>();
SelectOption op1=new SelectOption('Hyd','TG');
SelectOption op2=new SelectOption('Bom','MR');
SelectOption op3 = new SelectOption('Ban','KA');
SelectOption n=new SelectOption('none','-None-');
options.add(n);
options.add(op1);
options.add(op2);
options.add(op3);
cources =new List<SelectOption>();
List<String> names= new List<String>{'Jave','Oracle','sfdc'};
for(String s:names){
SelectOption p = new SelectOption(s,s);
cources.add(p);

 }

 }


}