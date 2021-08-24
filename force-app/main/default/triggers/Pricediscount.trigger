trigger Pricediscount on Book__c (before insert) {

List<Book__c> books=Trigger.New;

myBooks.myBookPrice(books);





}