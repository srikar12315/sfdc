public class InsertFutureUser {
    @future
    public static void insertUser(String fname, String alias1, string uname, string uemail) {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User futureUser = new User(firstname = fname, lastname = 'User',
            alias = alias1, defaultgroupnotificationfrequency = 'N',
            digestfrequency = 'N', email = uemail,
            emailencodingkey = 'UTF-8', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, 
            timezonesidkey = 'America/Los_Angeles',
            username = uname,
            userpermissionsmarketinguser = false,
            userpermissionsofflineuser = false, userroleid = r.Id);
        insert(futureUser);
        system.debug('New User: '+ futureUser );
    }
}