public with sharing class WeatherController 
{
//https://github.com/jrattanpal/JRBlog/blob/master/src/aura/Weather/Weather.cmp
private static String apiURL ='http://api.openweathermap.org/data/2.5/';
private static String apiKey ='d11f29f2da7bc3bd7299f5a335a16faa';
private static String pathCurrentWeather ='weather?appid='+apiKey+'&units=metric&q=';
    
    private static String getCalloutResponseContents(String url){
        String result=null;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200){
            result =res.getBody();
        }
        
        return result;
    }
    
    @AuraEnabled
    public static Object currentWeather(String city){
        String weatherUrl = apiURL + pathCurrentWeather +city;
        System.debug('weatherUrl::'+ weatherUrl);
        String result = getCalloutResponseContents(weatherUrl);
        return(result== null)?null:getCalloutResponseContents(weatherUrl);
        
        
    }
    

}