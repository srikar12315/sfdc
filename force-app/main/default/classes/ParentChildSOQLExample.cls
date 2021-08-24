public class ParentChildSOQLExample {
    public List<ParentObject__c>  po {set;get;}
    public parentChildSOQLExample(){
        //po=[select id,Parent1__c,(select id,Child__c,Child1__c from ChildObject__r) from ParentObject__c];
    }

}