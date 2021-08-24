@isTest
Private class myBooksTest
{

  static testmethod void validatemyBooks(){
  
  Book__c b = new Book__c(Name='TestBook',Price__c=100);
  insert b;
  b=[select Price__c from Book__c where ID=:b.id];
  
  system.assertEquals(90,b.Price__c);
  
  }


}