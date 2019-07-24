public class TraineeConttroller {
    public List<TraineeConttrollerWrapper> wrpList{get;set;}
    public TraineeConttroller(){
        
    }
    public void traineMethod(){
        wrpList=new List<TraineeConttrollerWrapper>();
        
        List<Job__c> jobList=[select id,Name,(select id from Trainees__r) from Job__c];
        List<Payment__c> paymentList=[select id,Type__c from Payment__c];
        Map<String,string> MapList=new Map<String,string>();
        
        for(Job__c j:jobList){
            system.debug('&&&'+j);
            for(Trainee__c t:j.Trainees__r){
                system.debug('***'+t);
                for(Payment__c p:paymentList){
                    system.debug('@@@'+p);
                    
                    MapList.put(p.Type__c,j.Name);
                     
                }   
            }
        }   
    
    }
     
    public class TraineeConttrollerWrapper{
        public Job__c       jc    {get;set;}
        public Payment__c   pc    {get;set;}
        public Trainee__c   tc{get;set;}
    }
}