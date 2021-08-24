public class CustomerTriggerHelper {
    
    public static void isAfterUpdateTrigger(List<APEX_Customer__c> customerList, Map<Id,APEX_Customer__c> mapofCustomers,Map<Id,APEX_Customer__c> mapofOldCustomers){
                                  createInvoiceRecord(customerList, mapofOldCustomers);  
                                  updateInvoiceRecord(customerList, mapofCustomers, mapofOldCustomers);              
                                                
                           }
    
    public static void createInvoiceRecord(List<APEX_Customer__c> customerList, Map<Id,APEX_Customer__c> oldCustomerList){
        List<APEX_Invoice__c> InvoiceList = new List<APEX_Invoice__c>();
        
        for(APEX_Customer__c objCustomer:customerList){
            if(objCustomer.APEX_Customer_Status__c =='Active'
               && oldCustomerList.get(objCustomer.Id).APEX_Customer_Status__c=='InActive'){
                   APEX_Invoice__c invoiceOne = new APEX_Invoice__c();
                   
                   invoiceOne.Name='AfterUpdateTrigger';
                   invoiceOne.APEX_Customer__c=objCustomer.id;
                   invoiceOne.APEX_Status__c='Pending';
                   InvoiceList.add(invoiceOne);            
               }
        }
        Insert InvoiceList;
    }
    public static void updateInvoiceRecord(List<APEX_Customer__c> customerList, Map<id, APEX_Customer__c> newCustomerMap, Map<id,APEX_Customer__c> oldCustomerMap){
        List<APEX_Customer__c> customerListWithInvoice = [select id, Name,APEX_Customer_Active__c, (SELECT Id, Name,APEX_Invoice_Description__c From APEX_Invoice__r)
                                                          FROM APEX_Customer__c where id IN:newCustomerMap.keyset()];
        system.debug('customerlistWithInvoices ##' + customerListWithInvoice);
        List<APEX_Invoice__c> invoicesToUpdate = new List<APEX_Invoice__c>();
        List<APEX_Invoice__c> customerInvoices = new List<APEX_Invoice__c>();
        customerInvoices = customerListWithInvoice[0].APEX_Invoice__r;
        system.debug('CustomerInvoices ##' + customerInvoices);
        
        for(APEX_Customer__c objCust:customerListWithInvoice){
            
            if(objCust.APEX_Customer_Active__c == true &&  oldCustomerMap.get(objCust.id).APEX_Customer_Active__c == false){
                for(APEX_Invoice__c objInvoice:customerInvoices){
                    objInvoice.APEX_Invoice_Description__c='Description';
                    invoicesToUpdate.add(objInvoice);
                }
            }
        }
        system.debug('invoicesToUpdate ##' + invoicesToUpdate);
        update invoicesToUpdate;
        
        
        
    }
}