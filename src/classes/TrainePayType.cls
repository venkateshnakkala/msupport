public class TrainePayType {
    List<TrainePayTypeWrp> TPWList  {get;set;}
    Map<Id,string>         MapList  {get;set;}
    List<Job__c>          jobList   {get;set;}
    List<Payment__c>    paymentList {get;set;}
    List<SObject>         ObjList    {get;set;}
    Public TrainePayType(){
        TPWList=new  List<TrainePayTypeWrp>();
        list<Trainee__c> traineeList =[SELECT   Name,Job__c,(select Name,Type__c from Payments__r) FROM Trainee__c];
       // list<Job__c> brand = [SELECT Name,(select Name from Trainees__r) FROM Job__c];
       Map<List<SObject>,List<TrainePayTypeWrp>> mapList=new Map<List<SObject>,List<TrainePayTypeWrp>>();
         
        jobList=new List<Job__c>();
        paymentList=new List<Payment__c>();
 
        for(Job__c j:[select id,Name from job__c]){
            jobList.add(j);
        }
         
        for(Payment__c p:[select id,Name,Type__c from Payment__c]){
            paymentList.add(p);
        }
        ObjList =new List<SObject>();
         
         ObjList.addAll((List<SObject>)(paymentList));
         ObjList.addAll((List<SObject>)(jobList));
        
        
        for(Trainee__c tr:traineeList){
            for(Payment__c pt:tr.Payments__r){
                system.debug('related payment object data--------'+pt.Type__c);
             
            }         
                
        } 
                        
    }
    public class TrainePayTypeWrp{
        public List<Job__c>      jc{get;set;}
        public List<Trainee__c>  Tc{get;set;}
        public List<Payment__c>  Pc{get;set;}
    
        public  TrainePayTypeWrp(List<Payment__c>  Pc){
            This.pc=pc;
        }
}
}