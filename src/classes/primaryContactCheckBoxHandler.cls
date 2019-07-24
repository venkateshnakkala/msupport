public class primaryContactCheckBoxHandler {
    public static void insertContactRecords(List<Contact> conList){
      set<ID> AccountId=new set<ID>();
      set<ID> oldConId=new set<ID>();
        for(Contact c:conList){
            AccountId.add(c.AccountId);
      
       }
      conList=[select id,AccountId from Contact where AccountID=:AccountId];
        
    }
}