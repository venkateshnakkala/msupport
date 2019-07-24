public class TotalAmount {
    
    public List<WrapperClass> wrapperList{get;set;}
    public set<String> mySet  {get;set;}

    public TotalAmount(){
        traineeAndJOb();
    }
    public void traineeAndJOb(){ 
        
        wrapperList=new  List<WrapperClass>();
        List<Trainee__c> listTrainees =[select id,name,job__c,job__r.Name,(select id,Name,Type__c,Amount__c,Trainee__c from payments__r) from Trainee__c];
        
        Map<String,Decimal> mapforAmount=new Map<String,Decimal>();
        
        For(Trainee__C t:listTrainees){
            for(Payment__c p:t.payments__r){  
                system.debug('In Amount payment details'+p);
                if(mapforAmount.containskey(t.job__r.Name+p.Type__c)){
                    mapforAmount.put(t.job__r.Name+p.Type__c, mapforAmount.get(t.job__r.Name+p.Type__c)+p.Amount__c);
                }
                else
                {
                    mapforAmount.put(t.job__r.Name+p.Type__c,p.Amount__c);
                }
                system.debug('amount caleculation'+mapforAmount.get(t.job__r.Name+p.Type__c));
            }
        }
   

    
    map<string,integer> mapForNumOfTrainees=new map<string,integer>(); 
       For(Trainee__C t:listTrainees){
        for(Payment__c p:t.payments__r){ 
            if(mapForNumOfTrainees.containskey(t.job__r.Name+p.Type__c)){
                
                mapForNumOfTrainees.put(t.job__r.Name+p.Type__c,mapForNumOfTrainees.get(t.job__r.Name+p.Type__c)+1);
            }
            else
            {
                mapForNumOfTrainees.put(t.job__r.Name+p.Type__c,1);
            }
            
        }
    } 
    mySet = new Set<string>();
    For(Trainee__C t: listTrainees){
         
        for(Payment__c p:t.payments__r){  
            if(!mySet.contains(p.Type__c+t.Job__r.Name))
            {
                mySet.add(p.Type__c+t.Job__r.Name);
             
            WrapperClass w=new WrapperClass(p.Type__c,t.Job__r.Name,mapForNumOfTrainees.get(t.job__r.Name+p.Type__c),mapforAmount.get(t.job__r.Name+p.Type__c));
            w.Type=p.Type__c;
            w.Name=t.Job__r.Name;
            w.noOfTrainees=mapForNumOfTrainees.get(t.job__r.Name+p.Type__c);
            w.Amount=mapforAmount.get(t.job__r.Name+p.Type__c);
           
            wrapperList.add(w); 
         
        }
        }
    }
    
}

Public class WrapperClass{
    public String Type {get;set;}
    public String Name {get;set;}
    public Decimal Amount{get;set;}
    public Integer noofTrainees{get;set;}
    
    Public WrapperClass(String Type,String Name,integer noOfTrainees,Decimal Amount){
        
        This.Type=Type;
        This.Name=Name;	
        This.noOfTrainees= noOfTrainees;
        This.Amount=Amount;
    }
}
}