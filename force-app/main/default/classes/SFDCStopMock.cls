@isTest
global class SFDCStopMock implements HTTPCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody('{"author":"Rahul Malhotra","blogs":[{"id":"1","title":"Salesforce Integration Tutorial Part1 - Introduction and Setting up Workbench","url":"https://www.sfdcstop.com/2019/11/salesforce-integration-tutorial-part-1.html"},{"id":"2","title":"Salesforce Integration Tutorial Part 2 - Exploring GET Method","url":"https://www.sfdcstop.com/2019/11/salesforce-integration-tutorial-part-2.html"}]}');
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(200);
        return response;
    }
    
    

}