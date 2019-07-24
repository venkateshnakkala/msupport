global class RechargePlans implements Database.Batchable<sObject>{ 
String query; 
global Database.QueryLocator start(Database.BatchableContext BC){
   query = 'select id,Name,Data_Plan__c,Network_Type__c,Total_Amount__c,(select id,Name,Internet_Plan__c,Amount__c,Recharge_Date__c from Recharges__r) from Internet_Plan__c'; 
    return Database.getQueryLocator(query);

 }
global void execute(Database.BatchableContext BC,list<Internet_Plan__c> ipc){ 
  
    List<Recharge__c> rc1List=new  List<Recharge__c>();
     
    //when internet plan is created recharge card is not activated then automaticallly create recharge card record 
   //    List<Internet_Plan__c> internetPlanList=[select id,Name,Data_Plan__c,Network_Type__c,Total_Amount__c,(select id,Name,Internet_Plan__c,Amount__c,Recharge_Date__c from Recharges__r) from Internet_Plan__c where id not in:internetPlanIds];
    for(Internet_Plan__c ic:ipc){
       system.debug('**** variable values '+ic );
        if(ic.recharges__r.size() == 0){
          Recharge__c r=new Recharge__c();
            r.Internet_Plan__c=ic.Id;
            r.Recharge_Date__c=system.today();
            r.Name=ic.Name;
           rc1List.add(r);
            system.debug('****rc1List no recharge record values '+rc1List);
            
        }
       
        }
    insert rc1List;
    
    List<Recharge__c> rcList=new List<Recharge__c>();
    for(Internet_Plan__c ip:ipc){
        for(Recharge__c rc:ip.Recharges__r){
        if(ip.Data_Plan__c=='Daily'&& rc.Recharge_Date__c>=system.today().addDays(-1)){
            Recharge__c r=new Recharge__c();
            r.Internet_Plan__c=ip.Id;
            r.Recharge_Date__c=system.today();
            r.Name=ip.Name;
           rcList.add(r);
            system.debug('list values'+rcList);
        }  
       else if(ip.Data_Plan__c=='Weekly'&& rc.Recharge_Date__c>=system.today().addDays(-6)){
         Recharge__c r=new Recharge__c();
            r.Internet_Plan__c=ip.Id;
            r.Recharge_Date__c=system.today();
            r.Name=ip.Name;
           rcList.add(r);
    }else if(ip.Data_Plan__c=='Monthly'&& rc.Recharge_Date__c>=system.today().addDays(-30)){
           Recharge__c r=new Recharge__c();
            r.Internet_Plan__c=ip.Id;
            r.Recharge_Date__c=system.today();
            r.Name=ip.Name;
           rcList.add(r);
    }
    else if(ip.Data_Plan__c=='Half-Yearly'&& rc.Recharge_Date__c>=system.today().addDays(-180)){
           Recharge__c r=new Recharge__c();
            r.Internet_Plan__c=ip.Id;
            r.Recharge_Date__c=system.today();
            r.Name=ip.Name;
           rcList.add(r);
    }
    else if(ip.Data_Plan__c=='Yearly '&& rc.Recharge_Date__c>=system.today().addDays(-365)){
       Recharge__c r=new Recharge__c();
            r.Internet_Plan__c=ip.Id;
            r.Recharge_Date__c=system.today();
            r.Name=ip.Name;
           rcList.add(r);
    }
            
   }
 }insert rcList; 
     

}
 global void finish(Database.BatchableContext BC){
 }    
}