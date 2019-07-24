@isTest
public class TestRestrictContactByName {
    @isTest static void testContactMet(){
        Contact c=new Contact();
        c.LastName='INVALIDNAME';
        insert c;
    }
}