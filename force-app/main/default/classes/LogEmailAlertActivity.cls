global class LogEmailAlertActivity implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                                                             Messaging.Inboundenvelope envelope) {           
        
        string strEmailPlainText = email.plainTextBody;
        string strhtmlBody = email.htmlBody ;
        
        system.debug('strhtmlBody>>'+strhtmlBody);
        
        string strGetDataFromBody = strhtmlBody != null ? strhtmlBody : strEmailPlainText;
        
        string strRecordId = strGetDataFromBody.substringBetween('RECORD_SF_ID(',')');
        string strOwnerId = strGetDataFromBody.substringBetween('RECORD_OWNER_ID(',')');  
        string strContactId = strGetDataFromBody.substringBetween('RECORD_PERSONCONTACT_ID(',')');  
                
        system.debug('strRecordId>>'+strRecordId);
        system.debug('strOwnerId>>'+strOwnerId);
        system.debug('strContactId>>'+strContactId);
        
        if(strOwnerId != NULL && strContactId != NULL){
            try{
                strEmailPlainText = strEmailPlainText.remove('('+strRecordId+')').remove('RECORD_SF_ID').remove('('+strOwnerId+')').remove('RECORD_OWNER_ID').remove('('+strContactId +')').remove('RECORD_PERSONCONTACT_ID');
                        
                Task createTask = new Task(whatId = strRecordId,
                                  Subject = 'Email Sent',
                                  OwnerId = strOwnerId,
                                  WhoId = strContactId,
                                  Status = 'Completed',
                                  Priority = 'Normal',
                                  Description = strEmailPlainText);
                
                system.debug('createTask>>'+createTask);
                insert createTask;
            }
            catch(Exception e){
                System.debug('Exception in LogEmailAlertActivity.handleInboundEmail'+e.getMessage());
            }
        }
        return null;
    }
}