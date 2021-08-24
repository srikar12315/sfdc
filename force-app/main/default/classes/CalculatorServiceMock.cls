@isTest
public class CalculatorServiceMock implements WebserviceMock {
    
         public String mode;
         public static String ADD_MODE ='ADD_MODE';
         public static String SUB_MODE ='SUB_MODE';
         public static String MUL_MODE ='MUL_MODE';
         public static String DIV_MODE = 'DIV_MODE';
    
    public CalculatorServiceMock(String mockMode){
        this.mode= mockMode;
    }
    
    public void doInvoke( Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType){
               
               if(mode == ADD_MODE) {
            CalculatorService.AddResponse_element addResponse = new CalculatorService.AddResponse_element();
            addResponse.AddResult = 9;
                response.put('response_x', addResponse);
        }
        else if(mode == SUB_MODE) {
            CalculatorService.SubtractResponse_element subtractResponse = new CalculatorService.SubtractResponse_element();
            subtractResponse.SubtractResult = 3;
                response.put('response_x', subtractResponse);
        }
        else if(mode == MUL_MODE) {
            CalculatorService.MultiplyResponse_element multiplyResponse = new CalculatorService.MultiplyResponse_element();
            multiplyResponse.MultiplyResult = 18;
                response.put('response_x', multiplyResponse);
        }
        else if(mode == DIV_MODE) {
            CalculatorService.DivideResponse_element divideResponse = new CalculatorService.DivideResponse_element();
            divideResponse.DivideResult = 2;
            response.put('response_x', divideResponse);
        }
               
               
        
    }
    
         

}