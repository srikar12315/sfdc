trigger RestrictContactByName on Contact (before insert, before update) {
    for(Contact c :Trigger.New){
        if(c.LastName=='INVALIDNAME'){
            c.Adderror('The Last Name"'+c.LastName+'" is not allowed for DML');
        }
    }

}