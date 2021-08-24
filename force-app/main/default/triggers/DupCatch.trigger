trigger DupCatch on Account (after insert, after update) {

     if(trigger.isInsert && trigger.isAfter ){
        AccountTrgHelper.checkDuplicates(Trigger.new);
    }   
    
}