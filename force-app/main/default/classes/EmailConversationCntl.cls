global with sharing class EmailConversationCntl {
    
    @AuraEnabled
    global static List<EmailMessage> getEmailMessages(String RecId){
        String ObjectName='';
        List<String> myFilter = new List<String>();
        
        if(RecId.startsWith('00Q')){
            ObjectName='Lead__c';
            myFilter.add('Lead__c=\''+RecId+'\'');
            
        }else if(RecId.startsWith('006')){
            ObjectName='Opportunity__c';
            myFilter.add('Opportunity__c=\''+RecId+'\'');
        }else if(RecId.startsWith('001')){
            ObjectName='Account__c';
            myFilter.add('Account__c=\''+RecId+'\'');
        }else if(RecId.startsWith('003')){
            ObjectName='Contact__c';
            myFilter.add('Contact__c=\''+ RecId+'\'');
            
        }
        
         String  queryString='SELECT Id, Subject,Status,TextBody,Incoming,HtmlBody,Headers,FromName,FromAddress,ToAddress,Contact__c,Opportunity__c,MessageDate,Lead__c,Account__c FROM EmailMessage';
        
        if(myFilter.size()>0){
            queryString += ' WHERE ' + myFilter[0];
        } else {
            String ss='No Email';
        }
         system.debug('Structured Query>>>'+queryString);
       List<EmailMessage> allEmailMessages= database.query(queryString);
        system.debug('@@@@@@@@@@@'+allEmailMessages);
        return allEmailMessages;
    }
    
    @AuraEnabled
    global static String getpassemaildetails(String RecordId){
        String idm = RecordId;
        String email='';
        
        if(idm.startsWith('003')){
            List<Contact> passvalues = [select Id,Name,Email from Contact where id=:idm Limit 1];
            for(Contact l:passvalues){
                email=l.email;
            }
            return email;
        } else if(idm.startsWith('00Q')){
            List<Lead> passvalues=[select id,Name,Email from Lead where id=:idm Limit 1];
            for(Lead l:passvalues){
                email= l.email;
            }
            return email;
        }else if(idm.startsWith('006')){
            List<OpportunityContactRole> passvalues = [select id,ContactId,IsPrimary,OpportunityId,Role,Contact.Email from OpportunityContactRole where OpportunityId=: idm limit 1];
            for(OpportunityContactRole l:passvalues){
                email=l.contact.Email;   
            }
            return email;
        }else if(idm.startsWith('0Q0')){
            List<Quote> quoid =[select id,Name,ContactId,Email from Quote where id=:idm LIMIT 1];
            for(Quote opc:quoid){
                email=opc.Email;   
            }
            return email;
            
        }else if(idm.startsWith('001')){
            List<Account> accid =[select Id,(Select Contact.Name,Contact.Email from AccountContactRelations) from Account where id=:idm LIMIT 1];
            for(Account acc:accid){
                for(AccountContactRelation actr:acc.AccountContactRelations ) {
                    email = actr.contact.email;
                }
            }
            
            return email;
        } 
        
        return email;
    }
 @AuraEnabled
    global static EmailMessage getemailAddress(String EmsgId){
        String emid=EmsgId;
        List<EmailMessage> passemid =[select id, FromAddress,Lead__c,Contact__c,Account__c,TextBody, ToAddress,Subject,Opportunity__c,HtmlBody,Incoming from EmailMessage];
        String email='';
        return passemid[0];
    }
}