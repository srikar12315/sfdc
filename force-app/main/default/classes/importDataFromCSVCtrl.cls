public class importDataFromCSVCtrl
{
public Blob csvFileBody {set;get;}
public String csvFileName {get;set;}
public String[] csvFileLines{get;set;}
public List<Account> accList {get; set;}

public importDataFromCSVCtrl(){
csvFileLines = new String[]{};
accList = new List<Account>();


} 

public void importCSVFile(){

try{

   csvFileName = csvFileBody.ToString();
   system.debug('csvFileName '+csvFileName );
   csvFileLines = csvFileName.split('\n');
    system.debug('csvFileLines '+csvFileLines );
    
   for(Integer i=1; i<csvFileLines.size(); i++){
    
      Account singleAcc = new Account();
      String[] csvRecordData = csvFileLines[i].split(',');
      singleAcc.Name=csvRecordData[0];
      singleAcc.AccountNumber =csvRecordData[1];
      singleAcc.Type = csvRecordData[2];
      singleAcc.AccountSource=csvRecordData[3];
      singleAcc.Industry =csvRecordData[4];
      accList.add(singleAcc);
      system.debug('accList'+accList);
   }
   
   insert accList;

}catch(Exception e){
ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importing data Please make sure input csv file is correct');
ApexPages.addMessage(errorMessage);

}



}







}