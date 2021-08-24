public class Schema1 {
    public Map<String, Schema.SObjectType>  objmap{set; get;}
    public Map<string, Schema.SObjectField> fldmap{set; get;}
    public List<SelectOption> fields{set; get;}
    public string selected {set; get;}
    public List<SelectOption> objects{set; get;}
    public Schema1(){
        objmap=Schema.getGlobalDescribe();
        objects= new List<SelectOption>();
        fields=new List<SelectOption>();
        
        SelectOption n = new SelectOption('--None--','--None--');
        objects.add(n);
        fields.add(n);
        for(String s:objmap.keySet()){
            // to get only custom objects 
            Schema.SObjectType obj = objmap.get(s);
            Schema.DescribeSObjectResult result =obj.getDescribe();
            if(result.isCustom()){
            SelectOption sp = new SelectOption(s,s);
            objects.add(sp);
             }           
         }   
    }
    
    public void show(){
            fields.clear();
            Schema.SObjectType obj = objmap.get(selected);
            Schema.DescribeSObjectResult result=obj.getDescribe();
            fldmap=result.fields.getMap();
            for(string s:fldmap.keySet()){
                SelectOption op=new SelectOption(s,s);
                fields.add(op);
            } 
      }
    
    
}