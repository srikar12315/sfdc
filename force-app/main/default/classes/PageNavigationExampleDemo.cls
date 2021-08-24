public class PageNavigationExampleDemo {

public String name{set;get;} 
public Integer age{set;get;}

public PageReference navigate(){

PageReference p = new PageReference ('/apex/studentoutput'); 
return p;

}
}