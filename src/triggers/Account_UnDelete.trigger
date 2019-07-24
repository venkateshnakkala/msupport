trigger Account_UnDelete on Account (after undelete) {
Account[] theAccount= [select undeleted__c from Account where id in :trigger.new]; 
 if(Trigger.isAfter){
 for(Account undeletedAccount : theAccount){ 
 
    system.debug('**'+undeletedAccount);
 } 

update theAccount; 
system.debug('@@'+theAccount);
    }
}