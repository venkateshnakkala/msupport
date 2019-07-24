trigger AccountDeletion on Account (before insert) {
    
    //prevent deletion of accounts related opportunity records 
    for(Account a:[select id from Account where ID IN (select accountId from Opportunity) AND ID IN:Trigger.old]){
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related opportunities.');
    
    }
}