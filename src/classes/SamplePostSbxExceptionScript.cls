public with sharing class SamplePostSbxExceptionScript extends SbxPostScriptWorker{
	public override void run(SandboxContext context) {
     
        throw new CustomException();
        
    }

    public class CustomException extends Exception{}
    
}