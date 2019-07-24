public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(integer num,string sname){
        List<Contact> conList=new List<Contact>();
        for( integer i=0;i<num;i++){
            Contact c=new Contact();
            c.LastName='sname';
            c.FirstName='test'+i;
            conList.add(c);
            system.debug('***'+conList);
      }
        return conList;
    }
}