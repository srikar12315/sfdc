@isTest
private class AnimalsCalloutsTest 
{

@isTest static void testGetCallout(){

StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStaticResource('GetAnimalResource');
    mock.setStatusCode(200);
    mock.setHeader('Content-Type', 'application/Jason;Charset=UTF-8');
    Test.setMock(HttpCalloutMock.class, mock);
    HttpResponse result = AnimalCallouts.makeGetCallout();
    system.assertNotEquals(null, result, 'The callout returned');
    system.assertEquals(200, result.getStatusCode(), 'The status code is not 200');
    system.assertNotEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'the content type value is not expected');
    map<String, Object> results =(map<String,Object>) JSON.deserializeUntyped(result.getBody());
    
    
    List<Object> animals = (List<Object>) results.get('animals');
    system.assertEquals(3, animals.size(), 'the array should only contain 3 animals');
    
    
    

}

@isTest static void testPostCallout() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    HttpResponse response = AnimalCallouts.makePostCallout();
    // Verify that the response received contains fake values
    String contentType = response.getHeader('Content-Type');
    System.assert(contentType == 'application/json');
    String actualValue = response.getBody();
    System.debug(response.getBody());
    String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
    System.assertEquals(actualValue, expectedValue);
    System.assertEquals(200, response.getStatusCode());
}





}