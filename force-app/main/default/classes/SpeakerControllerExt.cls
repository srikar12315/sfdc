public class SpeakerControllerExt {
    Public blob picture{get; set;}
    public String errorMessage{get; set;}
    Private final Speaker__c speaker;
    Private ApexPages.StandardController stdController;
    
    
    public SpeakerControllerExt(ApexPages.StandardController stdcontroller) {   
        this.speaker =(Speaker__c)stdcontroller.getRecord();
        this.stdcontroller = stdcontroller;     
    }
    Public PageReference save(){
        errorMessage='';
        try{
            upsert speaker;
            if(picture !=null){
                Attachment attachment = new Attachment();
                attachment.Body =picture;
                attachment.Name='Speaker_'+ speaker.First_Name__c + '.jpg';
                attachment.ParentId = speaker.id;
                attachment.ContentType ='application/jpg';
                insert attachment;
                speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file='+attachment.Id;
                update speaker;
            }
            return new Apexpages.StandardController(speaker).view();
        }catch(system.Exception ex){
            errorMessage = ex.getMessage();
            return null;
        }
        
    }

}