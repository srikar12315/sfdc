public class GetRestfulExample{
    private final String serviceEndpoint= 'http://md5.jsontest.com/';
    public String Response { get; set;}
    public String Headers { get; set; }

  
    public GetRestfulExample() {
     
    }
    public void fetchData() {
        getAndParse(ApexPages.currentPage().getParameters().get('id'));
    }
    public class JsonResult
    {
        public string md5;
        public string original;
        
    }
  public void getAndParse(String objectId) {
    
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(serviceEndpoint+'?text='+objectId);
     
    req.setMethod('GET');
    
    
    if(Test.isRunningTest())
    {
        //Create the mock
        JsonResult r = new JsonResult();
        r.original = objectId;
        r.md5 = string.valueOf(Crypto.generateDigest('MD5',Blob.valueOf(objectId)));
        Response = JSON.serialize(r);
    }
    else
    {
        // Get the XML document from the external server
        HttpResponse res = http.send(req);
        this.Response =res.getBody();
     }
      System.debug(this.Response);
  }

}