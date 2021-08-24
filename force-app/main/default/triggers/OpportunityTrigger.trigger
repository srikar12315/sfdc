trigger OpportunityTrigger on Opportunity (after insert) {
    user u=[select id from user where ProfileId='00e28000001wWZ0'];
    List<OpportunityShare> share=new List<OpportunityShare>();
    for(Opportunity op:Trigger.New){
        if(op.LeadSource=='Web' && op.Amount>1000){
            OpportunityShare os = new OpportunityShare();
            os.OpportunityId = op.Id;
            os.UserOrGroupId=u.Id;
            os.RowCause='Manual';
            os.OpportunityAccessLevel ='Edit';
            share.add(os);
        }
    }
  insert share;
}