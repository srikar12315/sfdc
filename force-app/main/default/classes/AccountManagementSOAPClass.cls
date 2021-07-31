global with sharing class AccountManagementSOAPClass {
    //https://gitlab.com/sfdcamit/salesforce-integration/-/blob/master/Code/udemy-integration/force-app/main/default/classes/AccountPlanner.cls

   /********
                                 <?xml version="1.0" encoding="UTF-8"?>
                <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:srini="http://soap.sforce.com/schemas/class/AccountManagementSOAPClass">
                <soapenv:Header>
                    <srini:SessionHeader>
                        <srini:sessionId>00D28000001G0GF!ASAAQDPyEyQkXxx0fLP0.c8aR6QP5k.SnPzmtvfA3lM_RyzrGB8uBVI59_Qn4o4OadAQtCQUGWUqgAFsfdKSpO0tyFIyISoR</srini:sessionId>
                    </srini:SessionHeader>
                </soapenv:Header>
                <soapenv:Body>
                    <srini:CreateAccount>
                        <srini:accountRecord>
                            <srini:Name>WebServiceAccount-1</srini:Name>
                            <srini:Rating>Hot</srini:Rating>
                            <srini:Industry>Education</srini:Industry>
                            <srini:Phone>9999999</srini:Phone>
                            <srini:AccountNumber>HI34</srini:AccountNumber>
                            <srini:contactRecord>
                            <srini:LastName>WebserviceContact-1 </srini:LastName>
                            </srini:contactRecord>
                        </srini:accountRecord>
                    </srini:CreateAccount>
                </soapenv:Body>
                </soapenv:Envelope>
    */

    /*


    soapSforceComSchemasClassAccountman.AccountManagementSOAPClass createAcc = new 
    soapSforceComSchemasClassAccountman.AccountManagementSOAPClass();

soapSforceComSchemasClassAccountman.SessionHeader_element element = new 
    soapSforceComSchemasClassAccountman.SessionHeader_element();
element.sessionId = '00D28000001G0GF!ASAAQDPyEyQkXxx0fLP0.c8aR6QP5k.SnPzmtvfA3lM_RyzrGB8uBVI59_Qn4o4OadAQtCQUGWUqgAFsfdKSpO0tyFIyISoR';
createAcc.SessionHeader=element;

soapSforceComSchemasClassAccountman.AccountWrapper wrapper = new soapSforceComSchemasClassAccountman.AccountWrapper();
wrapper.Name='from SOAP WSDL';
wrapper.AccountNumber='12345';
wrapper.Rating='Hot';
wrapper.Industry='Education';
wrapper.Phone='123456';
wrapper.ContactName='LastName';
createAcc.CreateAccount(wrapper);
    


    */
    //  webservice static String fullName(String firstName, String lastName){
    //       String greetMessage = 'Welcome ' + firstname + ' '+lastName;

    //       return greetMessage;
    //  }
    
    webservice static AccountWrapper CreateAccount(AccountWrapper accountRecord)
    {   
       Account newaccount = new Account();
       newaccount.Name = accountRecord.Name;
       newaccount.Rating = accountRecord.Rating;
       newaccount.Industry= accountRecord.Industry;
       newaccount.Phone=accountRecord.Phone;
       newaccount.AccountNumber=accountRecord.AccountNumber;
       insert newaccount;
     //  Contact conRecord = accountRecord.contactRecord;
        Contact conRecord = new Contact();
        conRecord.LastName=accountRecord.ContactName;
       conRecord.AccountId=newaccount.Id;
        insert conRecord;
        return accountRecord;
        
    }    
   
      global class AccountWrapper {
         webservice String Name;
         webservice String Rating;
         webservice String Industry;
         webservice String Phone;
         webservice String AccountNumber;
         //webservice Contact contactRecord;
         webservice String ContactName;
     }
}
