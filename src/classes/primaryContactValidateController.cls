public class primaryContactValidateController {
    public static void insertContactRecords(List<Contact> conList){
        
        set<ID> accountId=new set<ID>();
       List<ID> oldContactId=new List<ID>();
  
        list<contact> updateOldConLst=new list<contact>();
        Map<Id,contact> mappAccCon1= new  Map<Id,contact>();
        Map<String,string> mappAccCon= new  Map<String,string>();
       
        for(Contact c:conList){
            accountId.add(c.accountId);
            system.debug('contact related accountIds'+accountId);
            mappAccCon.put(c.accountID,c.id);
            system.debug('map values basing on account related contacts will diplay'+mappAccCon.get(c.accountID));
        }
        
        conList=[select id,accountId,primary__c from Contact where  accountId  in:accountId];
        
        for(Contact con:conList){
             
             
            if(con.id!=mappAccCon.get(con.AccountId)){
                 
             oldContactId.add(con.id);
    
            }
       
            for(contact c:[select id,accountId,primary__c from contact where id in:oldContactId]){
                    
                    c.Primary__c=false;
                    updateOldConLst.add(c);
          
       
           } 
          
        } 
        mappAccCon1.putall(updateOldConLst);
        system.debug('UpdatedOldConList'+mappAccCon1);
        if(mappAccCon1.size()>0){
        Update mappAccCon1.values();
    } 
        
    }
              
    
}