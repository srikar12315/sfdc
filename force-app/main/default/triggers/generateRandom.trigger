trigger generateRandom on Contact (before insert) {
    for(Contact con: Trigger.new)
    {
        if(trigger.isBefore && trigger.isInsert){
            String str = string.valueof(Math.abs(Crypto.getRandomLong()));
            String randomNumber = str.substring(0, 17);
            con.Random_ID__c= randomNumber;
        }
    }
}