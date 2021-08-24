public with sharing class EmailManager 
{
    public static void sendMail(string address, String subject, String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject); 
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results =  Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        inspectResult(results);
        
    }
    Private static Boolean inspectResult(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        for(Messaging.SendEmailResult res: results){
            if(res.isSuccess()){
                system.debug('Email Sent Successfully');
            }else{
                sendResult= false;
                system.debug('The Following errors occurred: ' + res.getErrors());
            }
            
        }
        
        return sendResult;
    }

}