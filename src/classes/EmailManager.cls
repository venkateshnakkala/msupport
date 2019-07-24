public class EmailManager {
    public void sendmessage(String address, String subject, String body){
        messaging.SingleEmailMessage mail=new  messaging.SingleEmailMessage();
        string[] toaddress=new string[]{address};
        mail.setSubject(subject);
        mail.setToAddresses(toaddress);
        mail.setPlainTextBody(body);
        
        messaging.SendEmailResult[] results=messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        inspectResults(results);
    }
    private	static Boolean inspectResults(messaging.SendEmailResult[] results){
        Boolean sendEmail=true; 
        for(messaging.SendEmailResult re: results){
        
        if(re.isSuccess()){
            system.debug('sent message successfully');
        }else{
            sendEmail= false;
            system.debug('error occured'+ re.getErrors());
        }
    }
    return sendEmail;
    }
}