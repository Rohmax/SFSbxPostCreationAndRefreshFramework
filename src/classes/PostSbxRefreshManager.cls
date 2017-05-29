/**
*
*   @author Rohan Gore
*   
*   @date 18/10/2016
*/
public with sharing class PostSbxRefreshManager implements SandboxPostCopy{
    
    @testVisible
	private List<SbxPostScriptWorker> workerList;

    public void runApexClass(SandboxContext context){
        List<String> usageList = new List<String>{'PostRefreshScript', 'PostScript'};
        if(workerList == null) {
        	workerList = SbxPostScriptWorkerFactory.getWorkers(usageList);
        }
        for(SbxPostScriptWorker worker : workerList){
            worker.process(context);
        }
    }

}