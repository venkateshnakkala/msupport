trigger CaleculatingTotalPrimaryContacts on Contact (After insert,After Update,After Delete,After UnDelete) {
    if(Trigger.IsAfter){
    if(Trigger.IsInsert||Trigger.IsUnDelete){
       ContactTriggerHandler.rollupContactCountOnAccount(Trigger.New);
       }
    else
       if( Trigger.isDelete ) {    
           ContactTriggerHandler.rollupContactCountOnAccount( Trigger.old );  
           }
    
     else if(Trigger.isUpdate){
        ContactTriggerHandler.rollupContactCountOnAccount(Trigger.old);
        }
    }

}