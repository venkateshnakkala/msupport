public class AccountProcessor{
   @future 
   public static void countContacts(set<id> ids){
       //venkateshnakkala
      list<Account> acc=[select id,name,Number_of_Contacts__c,(select id from Contacts) from Account where id in:ids ] ;
       for(Account accounts:acc){
           list<contact> cons=accounts.contacts;
           accounts.Number_of_Contacts__c=cons.size();
       }
       update acc;
   }   
   }