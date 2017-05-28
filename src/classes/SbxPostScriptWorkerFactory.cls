/**
*   SbxPostScriptWorkerFactory
*
*   @author Rohan Gore
*   
*   @date 18/10/2016
*/
public with sharing class SbxPostScriptWorkerFactory {

    //Publically exposed method to get worker class instances based on their usage
    public static List<SbxPostScriptWorker> getWorkers(List<String> usageList) {
        List<SbxPostScriptTask__mdt > postCopyTasks = [
            SELECT Id, DeveloperName, Active__c, OrderNumber__c
            FROM SbxPostScriptTask__mdt
            WHERE Active__c = true AND Usage__c IN:usageList
            ORDER BY OrderNumber__c ASC
        ];
        return getWorkerListFromCustomMetaDataTypes(postCopyTasks);
    }
    
    //Method to fetch Custom Metadata records meant to store class names for Worker class implementations
    @testVisible
    private static List<SbxPostScriptWorker> getWorkerListFromCustomMetaDataTypes(List<SbxPostScriptTask__mdt > taskList){
        List<SbxPostScriptWorker> workerList = new List<SbxPostScriptWorker>();
        for(SbxPostScriptTask__mdt task : taskList){
            String workerName = task.DeveloperName;
            SbxPostScriptWorker worker = createWorkerObjectFromString(workerName);
            if(worker == null) {
                //If it returns a null obj so we're not going to add it
                continue;
            }
            workerList.add(worker);
        }
        return workerList;
    }
    
    //Method to create a worker class implementation instance based on name string passed
    @testVisible
    private static SbxPostScriptWorker createWorkerObjectFromString(String workerName){
        SbxPostScriptWorker worker = null;
        try {
            Type t = Type.forName(workerName);
            worker = (SbxPostScriptWorker) t.newInstance();
        } catch (Exception e){
            //Log the Exception if any
        }
        return worker;
    }

}