public class ListViewController {
    //https://sfdcfacts.com/lightning/dynamic-listview-based-on-selected-object/
    @AuraEnabled
    public static List<String> fetchListViews(String strObjName){
        List<String> lstListViews = new List<String>();
        if(strObjName !=null && strObjName !='' && strObjName.length() !=0){
            List<ListView> lstViews =[Select id,Name,SObjectType from ListView where SObjectType =:strObjName];
            
            for(ListView iterator:lstViews){
                lstListViews.add(Iterator.Name);
            }
        }
        
        return lstListViews;
    }

}