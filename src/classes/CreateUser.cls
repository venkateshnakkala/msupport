public class CreateUser {
   public   void recordUser(){   
       profile p=[select id from profile where name='System Administrator' limit 1];
        
       user u=new user();
       u.lastName='venkatsurya1';
       u.alias='surya1';
       u.Email='raghumandapakaece@gmail.com';
       u.Username='venkatasurya264@pragati.com';
       u.CommunityNickname='surya';
       u.ProfileId=p.id;
       u.TimeZoneSidKey = 'GMT';
       u.EmailEncodingKey='UTF-8';
       u.LocaleSidKey='en_US';
       u.LanguageLocaleKey='en_US';	
       insert u;
       system.debug('user'+u);
        user ur=[select id from user where alias='surya1' limit 1];
      Account acc=new Account();
       acc.name='delloit';
       acc.OwnerId=ur.id;
       insert acc;       
   }
}