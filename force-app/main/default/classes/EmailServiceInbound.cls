global class EmailServiceInbound implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope  envelop){
        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        String myPlainText='';
        myplainText = email.plainTextBody;
        String oppcid='';
        String sss=email.subject;
        String[] a=sss.split('\\(');
        String[] bb=a[1].split('\\)');
        String subrecid= bb[0];
        
        if(subrecid.startsWith('003')){
            EmailMessage conEmailMessage = new EmailMessage();
            conEmailMessage.ToAddress=String.join(email.toAddresses, ',');
            conEmailMessage.FromAddress=email.fromAddress;
            conEmailMessage.FromName=email.fromName;
            conEmailMessage.Subject=email.subject;
            conEmailMessage.Status='2';
            conEmailMessage.HtmlBody=email.htmlBody;
            conEmailMessage.Incoming=true;
            conEmailMessage.TextBody=email.plainTextBody;
            conEmailMessage.Contact__c=subrecid;
            insert conEmailMessage;
            EmailMessageRelation emr = new EmailMessageRelation();
            emr.EmailMessageId=conEmailMessage.id;
            emr.RelationId=subrecid;
            emr.RelationAddress=email.fromAddress;
            emr.RelationType='FromAddress';
            insert emr;
        }else if(subrecid.startsWith('00Q')){
            EmailMessage leadEmailMessage = new EmailMessage();
            leadEmailMessage.ToAddress=string.join(email.toAddresses, ',');
            leadEmailMessage.FromAddress=email.fromAddress;
            leadEmailMessage.FromName=email.fromName;
            leadEmailMessage.Subject=email.subject;
            leadEmailMessage.Status='2';
            leadEmailMessage.HtmlBody=email.htmlBody;
            leadEmailMessage.Incoming=True;
            leadEmailMessage.TextBody=email.plainTextBody;
            leadEmailMessage.Lead__c=subrecid;
            insert leadEmailMessage;
            EmailMessageRelation emr= new EmailMessageRelation();
            emr.EmailMessageId=leadEmailMessage.Id;
            emr.RelationId=subrecid;
            emr.RelationAddress=email.fromAddress;
            emr.RelationType='FromAddress';
            insert emr;
        }else if(subrecid.startsWith('001')){
            EmailMessage accEmailMessage = new EmailMessage();
            accEmailMessage.ToAddress=String.join(email.toAddresses, ',');
            accEmailMessage.FromAddress=email.fromAddress;
            accEmailMessage.FromName=email.fromName;
            accEmailMessage.Subject=email.subject;
            accEmailMessage.Status='2';
            accEmailMessage.HtmlBody=email.htmlBody;
            accEmailMessage.Incoming=true;
            accEmailMessage.TextBody=email.plainTextBody;
            accEmailMessage.Account__c=subrecid;
            insert accEmailMessage;
            
            EmailMessageRelation emr = new EmailMessageRelation();
            emr.EmailMessageId=accEmailMessage.Id;
            emr.RelationAddress=email.fromAddress;
            emr.RelationType='FromAddress';
            List<Account> accid= [select id,(select contact.Id,contact.Name,contact.Email from AccountContactRelations) from Account where id=:subrecid LIMIT 1];
            for(Account acc:accid){
                for(AccountContactRelation actr:acc.AccountContactRelations){
                    oppcid=actr.Contact.Id;
                }
            }
            emr.RelationId=oppcid;
            insert emr;
        }else if(subrecid.startsWith('006')){
            EmailMessage oppEmailMessage = new EmailMessage();
            oppEmailMessage.ToAddress=string.join(email.toAddresses, ',');
            oppEmailMessage.FromAddress=email.fromAddress;
            oppEmailMessage.FromName=email.fromName;
            oppEmailMessage.Subject=email.subject;
            oppEmailMessage.Status='2';
            oppEmailMessage.HtmlBody=email.htmlBody;
            oppEmailMessage.Incoming=true;
            oppEmailMessage.TextBody=email.plainTextBody;
            oppEmailMessage.Opportunity__c=subrecid;
            insert oppEmailMessage;
            
              
            
        }
        
        
        
        return null;
    }
    

}