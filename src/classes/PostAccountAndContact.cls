@RestResource (urlmapping = '/newaccount/*')
global class PostAccountAndContact {
    @HttpPost
    global static void saveAccountAndContact(string accountName, string contactFirst, string contactLast){
        account acc = new account(name = accountName);
        RestContext.response.addHeader('Content-Type', 'application/json');
        savepoint sp = database.setSavepoint();
        if(accountName != null && accountName != ''){
            insert acc;
            contact con = new contact(lastName = contactLast,firstName = contactFirst, accountid = acc.id);
            if(contactLast != null && contactLast != ''){
                insert con;
                RestContext.response.responseBody = Blob.valueOf('{"AccountId":"'+acc.id+'", "ContactId":"'+con.id+'"}');
            }else{
                database.rollback(sp);
                RestContext.response.responseBody = Blob.valueOf('{"error":"Contact Last Name cannot be null"}');
            }
        }else{
            RestContext.response.responseBody = Blob.valueOf('{"error":"Account Name cannot be null"}');
        }
    }
}