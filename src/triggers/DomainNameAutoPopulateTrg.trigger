trigger DomainNameAutoPopulateTrg on Lead (before insert) {
    Set<String> emailDomains = new Set<String>();
    Set<String> Domains = new Set<String>();
    List<Domain__c> LstDomain = new List<Domain__c>();
    Map<String ,String> emailDomainToDomainMap = new  Map<String ,String> ();
    String domain ;
    
    for (Lead l : Trigger.New) {
        if (l.Email != null) {
            domain = l.Email.substring( l.Email.indexOf('@') + 1,l.Email.indexOf('.') - 0); 
            emailDomainToDomainMap.put(l.id,domain);
        } 
        emailDomains.add(domain);
    }
    system.debug('****emailDomains****'+emailDomains); 
    for (Domain__c a : [select Name from Domain__c]) {
        Domains.add(a.Name);
    }   
    
    for (Lead l : Trigger.New) {
        
        if(Domains.contains(emailDomainToDomainMap.get(l.id))){
            l.company = emailDomainToDomainMap.get(l.id);
        }
        else {
            
            l.company = emailDomainToDomainMap.get(l.id);
            Domain__c dm = new Domain__c();
            dm.name=emailDomainToDomainMap.get(l.id);
            LstDomain.add(dm);
        }
    }
    if(LstDomain.size()>0){
        insert LstDomain;
    }
}