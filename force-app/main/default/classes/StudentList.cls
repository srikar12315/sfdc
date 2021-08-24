public class StudentList {
    public List<Student> stds {set;get;}
    public List<Student> selected {set;get;}
    public StudentList(){
        stds = new List<Student>();
        addRows();
    }
    public void addRows(){
        for(Integer i=0; i<3; i++){
            Student s = new Student();
            stds.add(s);
            system.debug('===>>>> :'+ stds);
        }
    }
    
    public void submit(){
        
        selected = new list<Student>();
        
        for(Student s:stds){
            if(s.flag==true){
                
                selected.add(s);
            }
        }
    }

}