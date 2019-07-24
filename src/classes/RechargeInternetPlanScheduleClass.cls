global class RechargeInternetPlanScheduleClass implements Schedulable{
 global void execute(SchedulableContext sc) { 
        RechargePlans  uab = new RechargePlans (); 
         database.executebatch(uab);
     } 
}