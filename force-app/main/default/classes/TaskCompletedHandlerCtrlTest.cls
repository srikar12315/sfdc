@isTest(seealldata = false)
Private class TaskCompletedHandlerCtrlTest {
    
    
    static Lead createLead() {
        Lead ld = new Lead();
        ld.LastName = 'Tulsani';
        ld.Company ='ABC Corp';
       ld.Status='Open - Contacted';
        return ld;
    }
    
    static Task createTask(Id ldId) {
        Task tk = new Task();
       tk.OwnerId= '00528000002ctx9' ; //user ID specific to your ORG
        tk.Subject ='Call for test class';
        tk.WhoId = ldid;
        tk.Priority = 'Normal';
        return tk;
    }
    
    static testMethod void TestInsertTask() {
        Test.startTest();
        Lead createlead = createLead();
        insert createlead;
        Lead Getlead = [SELECT Status FROM Lead where ID = : createlead.id];
        Task tk = createTask(Getlead.id);
        Lead Getleadupdated = [SELECT Status FROM Lead where ID = : createlead.id];
       insert tk;

        
        Test.stopTest();
        System.assertEquals('Closed - Converted', Getleadupdated.Status); 
        
    }
    

}