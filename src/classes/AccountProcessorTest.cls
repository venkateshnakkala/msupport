@isTest
private class AccountProcessorTest{
   @isTest
   public static void testAccountProcessorTest(){
       Account acc=new Account();
       acc.Name='venkat1';
       insert acc;
       
       Contact con=new Contact();
       con.lastName='venky';
       con.FirstName='nakkala';
       con.AccountId=acc.id;
       insert con;
       
      set<id> ids=new set<id>();
       ids.add(acc.id);
       test.startTest();
        AccountProcessor.countContacts(ids);
       test.stopTest();
       
       Account acts = [select id,Number_of_Contacts__c from Account where id = :acc.id LIMIT 1];
       system.assertEquals(integer.valueOf(acts.Number_of_Contacts__c),1);
       
   }
}