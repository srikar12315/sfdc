//https://srini-lighting-dev-ed.lightning.force.com/services/apexrest/v1/sam1/{}
@RestResource(urlMapping='/v1/sam1/*')
global with sharing class ResrWelcomeClass {
    global Final static String WELCOME_MESSAGE ='Welcome To REST Integartion Hands-on';
    
    @httpGet
    global static String greetingMessage(){
        
        return WELCOME_MESSAGE;
    }
    @httpPost
    global static String doPost(){
        return WELCOME_MESSAGE + '  From Post Method';
        
    }
    

}