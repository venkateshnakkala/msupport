@RestResource(urlMapping='/wrapper/*')
global with sharing class campclass{
    @HttpGet
       global static List<Accountwrapper> doget() {

            RestRequest req = RestContext.request;
            String accphone = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            RestResponse res = RestContext.response;

            List<Account> result = [Select Id, name,phone from account where  phone=:accphone];
            System.debug('Result:::'+result);

            List<Accountwrapper> accWrapList = new List<Accountwrapper>();
            for(Account acc : result){
                    Accountwrapper accWrap = new Accountwrapper();
                    accWrap.accId = acc.Id;
                    accWrap.Name = acc.Name;
                    accWrap.Phone = acc.Phone;
                    accWrapList .add(accWrap);
             } 
            return accWrapList ;
   }
        global class Accountwrapper {
           Public Id accId;
           public String Name;
           public String Phone;

       }
}