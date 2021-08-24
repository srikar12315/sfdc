global class newurlPolicyCondition implements TxnSecurity.PolicyCondition {

 public boolean evaluate(TxnSecurity.Event e) {
LoginHistory eObj = [SELECT ApiType FROM LoginHistory WHERE Id = :e.data.get('LoginHistoryId')];
  if(eObj.Platform == 'besupercarefulwiththis') {
   return true;
 }

 return false; 
}
 }