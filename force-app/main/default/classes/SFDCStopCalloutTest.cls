@isTest
public with sharing class SFDCStopCalloutTest {
    
    public static Integer RESPONSE_CODE =200;
    public static String RESPONSE_HEADER_KEY= 'Content-Type';
    public static String RESPONSE_HEADER_VALUE= 'application/json';
    public static String RESPONSE_BODY = '{"author":"Rahul Malhotra","blogs":[{"id":"1","title":"Salesforce Integration Tutorial Part1 - Introduction and Setting up Workbench","url":"https://www.sfdcstop.com/2019/11/salesforce-integration-tutorial-part-1.html"},{"id":"2","title":"Salesforce Integration Tutorial Part 2 - Exploring GET Method","url":"https://www.sfdcstop.com/2019/11/salesforce-integration-tutorial-part-2.html"}]}';
    
    @isTest
    public static void testGetBlogs(){
        Test.startTest();
        
        HttpResponse response = new HttpResponse();
        
        Test.setMock(HttpCalloutMock.class, new SFDCStopMock());
        
        response = SFDCStopCallout.getBlogs();
        
        system.assertEquals(RESPONSE_CODE, response.getStatusCode());
        System.assertEquals(RESPONSE_HEADER_VALUE, response.getHeader(RESPONSE_HEADER_KEY));
        system.assertEquals(RESPONSE_BODY, response.getBody());
        
        
        
      
        test.stopTest();
    }
    
    

}