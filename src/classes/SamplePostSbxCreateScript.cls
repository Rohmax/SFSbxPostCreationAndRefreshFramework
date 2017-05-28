public with sharing class SamplePostSbxCreateScript extends SbxPostScriptWorker {
	public override void run(SandboxContext context) {
        System.debug('Inside SamplePostSbxCreateScript worker class '+context);
    }
}