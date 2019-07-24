@isTest
public class WarehouseSyncScheduleTest {
    @isTest
    public static void testWarehouseSyncScheduleTest(){
        Test.startTest();
        WarehouseSyncSchedule ws=new WarehouseSyncSchedule();
        Date closeDate = Date.today().addDays(-7);
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        String jobID = System.schedule('Test WarehouseSyncScheduleTest', CRON_EXP, ws);
        Test.stopTest();
        
    }
}