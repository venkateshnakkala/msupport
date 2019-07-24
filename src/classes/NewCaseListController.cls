public class NewCaseListController {
    public List<Case> getnewcases(){
        List<case> results = [SELECT CaseNumber FROM Case WHERE status='New'];   
        return results;
    }
}