global class GenerateApexPolicyCondition implements TxnSecurity.PolicyCondition {

 public boolean evaluate(TxnSecurity.Event e) {
LoginHistory eObj = [SELECT Platform FROM LoginHistory WHERE Id = :e.data.get('LoginHistoryId')];
  if(eObj.Platform == 'Android 6') {
   return true;
 }

 return false; 
}
 }