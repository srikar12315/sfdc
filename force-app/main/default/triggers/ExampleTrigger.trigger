trigger ExampleTrigger on Contact (after insert, after delete) {
    
    if(trigger.isinsert){
        integer recordCount = Trigger.new.size();
        
        EmailManager.sendMail('srini.sfdc16@gmail.com', 'Trailhead Trigger Tutorial', recordCount + 'Contact were inserted');
        
    }else if(Trigger.isDelete){
        
    }

}