trigger AccountTriggers on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
     Account acc= Trigger.new.get(0);
    
    if(Trigger.isAfter && Trigger.isInsert){
       
        AccountHandler.CreateNewOpportunity(Trigger.New);
        OpenCageGeocoderUtil.forwardGeoCoding(acc.Id);
        OpenCageGeocoderUtil.reverseGeoCoding(acc.id);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
         Account acc1= Trigger.Old.get(0);
      if(System.IsBatch() == false && System.isFuture() == false){ 
        OpenCageGeocoderUtil.forwardGeoCoding(acc1.Id);
           OpenCageGeocoderUtil.reverseGeoCoding(acc.id);
        }
    }
    
}