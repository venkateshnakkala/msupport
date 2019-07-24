public class AccountHandler {
    public static void insertAccount(integer n){
	//venkateshnnakkkaa1
         List<Account> addAccounts=new List<Account>();
     integer counter=1;
        while(counter < n){
           Account a=new Account();
            a.Name='Acme Inc n'+counter;
            a.AccountNumber='A000n'+counter;
            counter=counter+1;
          addAccounts.add(a); 
         system.debug('*****'+addAccounts);
        }
   insert addAccounts;
    }
}