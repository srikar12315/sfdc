public  class RESTAPIPlaygroundController {
    public String strSelectedAppId{get;set;}
    public String strURI{get;set;}
    public String strSelectedMethod{get;set;}
    public String strSelectedContentType{get;set;} //JSON or XML
    public String strRequestBody{get;set;}
    public String strResponse{get;set;}
    public String strApexCode{get;set;}
    public String strAccessToken{get;set;}
    public RESTAPIPlaygroundController(){
        strSelectedMethod='GET';
        strSelectedContentType='.xml';
    }
    
    public list<selectoption> getAvailableHTTPmethods(){
        list<selectoption> options=new list<selectoption>();
        options.add(new selectoption('GET','GET'));
        options.add(new selectoption('PATCH','PATCH'));
        options.add(new selectoption('POST','POST'));
        //options.add(new selectoption('PUT','PUT'));
        options.add(new selectoption('DELETE','DELETE'));
        return options;
    }
    public List<selectoption> getContentType(){
        List<selectoption> options=new List<selectoption>();
            options.add(new selectoption('.json','JSON'));
            options.add(new selectoption('.xml','XML'));
        return options;
        
    }
    
    public pageReference sendRequest(){
        String errmsg=validateInputparametrs();
        system.debug('*********errmsg'+errmsg);
        if(errmsg!=null && errmsg!=''){
            ApexPages.addMessage(new apexpages.message(ApexPages.severity.Error,errmsg));
        }else{
            HttpRequest req=createHTTPRequest();
            HTTPResponse res=sendRequest(req);
            strResponse=res+'\n';
            strResponse=res.getBody();
        }
        return null;
    }
    public HttpRequest createHTTPRequest(){
        HttpRequest req = new HttpRequest();
        strApexCode='HttpRequest req = new HttpRequest();\n';
        String endpointURL;
        if(strAccessToken!=null && strAccessToken!=''){
            //setting end point URL
            if(strURI!=null && strURI!=''){
                if(strURI.endswith('/')){
                    strURI=strURI.substring(0,strURI.length()-2);
                }
                endpointURL=strURI;
                system.debug('************endpointURL:'+endpointURL);
                if(strSelectedMethod.equalsignorecase('PATCH')){
                    endpointURL+='?_HttpMethod=PATCH';
                }
                req.setEndpoint(endpointURL);
                strApexCode+='req.setEndpoint('+endpointURL+');\n';
            }
            //setting request headers
            if(strSelectedContentType.equalsignorecase('.xml')){
                req.setHeader('Content-Type', 'application/xml; charset=utf-8');
                strApexCode+='req.setHeader(\'Content-Type\', \'application/xml; charset=utf-8\');\n';
                req.setHeader('Accept', 'application/xml');
                strApexCode+='req.setHeader(\'Accept\', \'application/xml\');\n';
                
            }else{
                req.setHeader('Content-Type', 'application/json; charset=utf-8');
                strApexCode+='req.setHeader(\'Content-Type\', \'application/json; charset=utf-8\');\n';
            }
            req.setHeader('Authorization','Authorization: Bearer '+strAccessToken);
            strApexCode+='req.setHeader(\'Authorization\',\'Authorization: Bearer '+strAccessToken+');\n';
            //setting HTTP method
            if(strSelectedMethod!=null && strSelectedMethod!=''){
                if(strSelectedMethod.equalsignorecase('GET')){
                    req.setMethod('GET');
                    strApexCode+='req.setMethod(\'GET\');\n';
                }else if(strSelectedMethod.equalsignorecase('POST') || strSelectedMethod.equalsignorecase('DELETE') || strSelectedMethod.equalsignorecase('PUT')){
                    req.setMethod(strSelectedMethod);
                    strApexCode+='req.setMethod('+strSelectedMethod+');\n';
                    string body=strRequestBody;
                    req.setBody(body);
                    strApexCode+='req.setBody('+body+');\n';
                    req.setHeader('Content-Length', '1024');
                    strApexCode+='req.setHeader(\'Content-Length\',\'1024\');\n';
                    req.setTimeout(12000);
                    strApexCode+='req.setTimeout(1200);\n';
                }
                else if(strSelectedMethod.equalsignorecase('PATCH')){
                    req.setMethod('POST');
                    strApexCode+='req.setMethod(\'POST\');\n';
                    string body=strRequestBody;
                    req.setBody(body);
                    strApexCode+='req.setBody('+body+');\n';
                    req.setHeader('Content-Length', '1024');
                    strApexCode+='req.setHeader(\'Content-Length\',\'1024\');\n';
                    req.setTimeout(12000);
                    strApexCode+='req.setTimeout(1200);\n';
                }
            }
            
        }
        system.debug('***************strApexCode:'+strApexCode);
        system.debug('***************HttpRequest req:'+req);
        return req;
    }
    public HTTPResponse sendRequest(HttpRequest Req){
        Http http = new Http();
        strApexCode+='Http http = new Http();\n';
        HTTPResponse res = http.send(req);
        strApexCode+='HTTPResponse res = http.send(req);\n';
        System.debug('****************res.getStatusCode();'+res.getStatusCode());
        return res;
    }
    
    public string validateInputparametrs(){
        String errmsg;
        if(strAccessToken==null || strAccessToken==''){
            errmsg='Please specify Access Token.\n';
        }if(strURI==null || strURI==''){
            errmsg+=' Please specify REST API service URI (Endpoint URL).\n';
        }if(strSelectedMethod==null || strSelectedMethod==''){
            errmsg+=' Please specify Http method.\n';
        }
        system.debug('*********errmsg'+errmsg);
        return errmsg;
    }
}