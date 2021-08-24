public class AnimalCallouts
{
 //https://gist.github.com/mannharleen/2890d40f5cea62d058d62f7c16e39f73
 public static HttpResponse makeGetCallout(){
 Http http =  new Http();
 HttpRequest request = new HttpRequest();
 request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
 request.setMethod('GET');
 HttpResponse response=http.send(request);
 if(response.getStatusCode()==200){
 map<String, Object> results = (map<String, Object>) JSON.deserializeUntyped(response.getBody());
 system.debug('Received Raw animals List :' + results);
 List<Object> animals = (List<Object>)results.get('animals');
 system.debug('Received list of animals :'+ animals);
 for(Object animal:animals){
  
     system.debug(animal);
    }
  
  }
  
 return response;
 }

public static Httpresponse makePostCallout(){
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('POST');
request.setHEader('Content-Type','application/jason;Charset=UTF-8');
request.setBody('{"name":"Monkey"}');
HttpResponse response = http.send(request);
if(response.getStatusCode()!=201){
system.debug('The status code returned was not expected :'+
response.getStatusCode()+' '+ response.getStatus());

}else{

system.debug(response.getBody());
}



return response;
}




}