trigger PrimaryConValTrg on Contact (Before insert) {
   
        if(Trigger.isInsert){
             
    primaryContactValidateController.insertContactRecords(Trigger.New);
        
      
    } 
}