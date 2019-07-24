public class MapExample {
    public MapExample(){
        
        list<account> myAccounts = new list<account>();
       
        myAccounts = [Select ID, Name from Account limit 10]; 
       
        map<id,string> myAMap = new map<id,string>();
       
        for ( Account a : myAccounts ){
            myAMap.put(a.ID, a.Name);
            system.debug('******'+myAMap.get(a.ID));
        } 
        
        for ( ID aID : myAMap.keySet() ){
            system.debug(loggingLevel.debug, myAMap.get(aID));
        }    
        
    }
}