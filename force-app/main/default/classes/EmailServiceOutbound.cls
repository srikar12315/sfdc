public class EmailServiceOutbound {
    
    @AuraEnabled
    public static void sendMailMethod(String mMail ,String mSubject ,String mbody,string recid){
        system.debug('@@@@ recid'+recid);
        System.debug('@@@@ mMail'+mMail);
        system.debug('@@@@ mSubject'+mSubject);
        system.debug('@@@@ mbody'+mbody);
        String subrec ='('+recid+')'; 
        String opcid='';
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        List<String> sendTo = mMail.split(',');
        mail.setToAddresses(sendTo);
        String addUrl ='emailservice@2zwwfxjloljkylqbigqsx2qtrkn1y1yfeozledfz72e9vac0m6.28-1g0gfea0.ap7.apex.salesforce.com';
        mail.setReplyTo(addUrl);
        mail.setSenderDisplayName(UserInfo.getName());
        mail.setSubject(mSubject+subrec);
        mail.setHtmlBody(mbody);
        mails.add(mail);
        try{
            //Add inbound Email Message for Contact
            EmailMessage caseEmailMessage  = new EmailMessage();
            caseEmailMessage .FromAddress=userinfo.getUserEmail();
            caseEmailMessage .ToAddress=mMail;
            caseEmailMessage .FromName=userinfo.getName();
            caseEmailMessage .Subject=msubject;
            caseEmailMessage .HtmlBody=mbody;
            caseEmailMessage .Incoming=False;
            caseEmailMessage .TextBody=mbody;
            caseEmailMessage .Status='3';
            if(recid.startsWith('003')){
                caseEmailMessage .Contact__c=recid;
            }else if(recid.startsWith('00Q')){
                caseEmailMessage .Lead__c=recid;
                
            }else if(recid.startsWith('006')){
                caseEmailMessage .Opportunity__c=recid;
            }
            insert caseEmailMessage ;
            //Add Email Message Relation for id of the sender
            EmailMessageRelation emr = new EmailMessageRelation();
            emr.EmailMessageId = caseEmailMessage.id;
            emr.RelationAddress=userInfo.getUserEmail();
            emr.RelationType='FromAddress';
            
            //Contact Email Message Relation Id
            if(recid.startsWith('003')){
                emr.RelationId=recid;
            }else if(recid.startsWith('006')){
                List<OpportunityContactRole> pasid=[select id,ContactId,IsPrimary,OpportunityId,Role from OpportunityContactRole where OpportunityId=: recid];
                for(OpportunityContactRole opc:pasid){
                    opcid=opc.ContactId;
                }
                emr.RelationId=opcid;
                
            }else if(recid.startsWith('00Q')){
                emr.RelationId=recid;
            }
            insert emr;
            Messaging.sendEmail(mails);
            
        }catch(Exception e){
            system.debug('Queryue: '+e);
            
        }
        
        
        
    }
    
}