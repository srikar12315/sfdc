public class staticExample {
    public static Integer a= 0;
    public Integer b=0;
    
    public void add(){
        a= a+10;
        b=b+10;
    }
    public void show(){
        system.debug('=====> A value :' + a);
        system.debug('=====> B value :' + b);
    }
    
}