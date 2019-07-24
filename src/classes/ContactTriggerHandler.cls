public class ContactTriggerHandler {
    public static void rollupContactCountOnAccount(List<Contact> contactlist){
    Set<Id> accountIds = new Set<Id>();
   for (Contact c : contactlist) {
           if (c.accountid != null) {
               accountIds.add(c.accountid);
           } 
       }
   List<Account> accountActiveContactList=[select id,Total_Primary_Contacts__c,(select id,Primary__c from Contacts where Primary__c=:true) from Account where id in:accountIds];
        for(Account a:accountActiveContactList){
            a.Total_Primary_Contacts__c=a.Contacts.Size();
        }
        if(accountActiveContactList.Size()>0){
            update accountActiveContactList;
        }
    }
}