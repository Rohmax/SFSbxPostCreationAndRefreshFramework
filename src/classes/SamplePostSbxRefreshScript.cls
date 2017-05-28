public with sharing class SamplePostSbxRefreshScript extends SbxPostScriptWorker {
	public override void run(SandboxContext context) {
        System.debug('Inside SamplePostSbxRefreshScript worker class '+context);
    }
}