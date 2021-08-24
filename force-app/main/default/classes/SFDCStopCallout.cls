public with sharing class SFDCStopCallout {
    
    
    public static HTTPResponse  getBlogs(){
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://sfdcstop.herokuapp.com/blogs');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200 ){
               system.debug('response :' + response );
            system.debug('response Body :' + response.getBody() );
           SFDCStopBlogsWrapper responsewrapper = SFDCStopBlogsWrapper.parse(response.getBody());
            system.debug('responsewrapper: ' + responsewrapper);
            system.debug('responsewrapper _author: ' + responsewrapper.author);
            system.debug('responsewrapper size : ' + responsewrapper.blogs.size());
            
            if((responsewrapper.blogs !=null) &&(!responsewrapper.blogs.isEmpty())){
                
                for(Integer i=0; i<responsewrapper.blogs.size(); i++){
                    
                       SFDCStopBlogsWrapper.Blogs blog = responsewrapper.blogs.get(i);
                     System.debug('Blog Id: ' + blog.id);
                     System.debug('Blog Title:' + blog.title);
                     System.debug('Blog URL:' + blog.url);
            
            
                       
                    
                }
             
                
                
                
            }
            
            
        }
        return response;
    }

}