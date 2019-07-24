public with sharing class MapAccCont {

    Map<Integer, Account> mapToAccount = new Map<Integer, Account>();

    public MapAccCont() {
        Integer i = 20;
        for (Account a : [SELECT Id, Name,Type FROM Account LIMIT 10]) {
            mapToAccount.put(i, a);
            i++;
        }
    }

    public Map<Integer, Account> getMapToAccount() {
        return mapToAccount;
    }
}