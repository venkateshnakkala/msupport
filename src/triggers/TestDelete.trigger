trigger TestDelete on Account (before Delete) {
    if(Trigger.isBefore){
        for(Account a:Trigger.old){
            system.debug('********'+a);
        }
    }
}