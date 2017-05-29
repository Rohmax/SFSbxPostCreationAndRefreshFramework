@isTest
private class PostSbxRefreshManagertest {
	@isTest
	static void testPostSbxRefershManager() {
		PostSbxRefreshManager manager = new PostSbxRefreshManager();
		manager.workerList = new List<SbxPostScriptWorker>();
        manager.workerList.add(new SamplePostSbxRefreshScript());
		manager.workerList.add(new SamplePostSbxExceptionScript());
		/**
		* The following sandboxpostcopy test takes these params: apex class name, org Id, sandbox Id, and sandboxName.
		* The org Id and sandbox Id can be any valid object Id... As of 4/27/16 I've seen example of passing Account Ids
		* 	into these two parameters and the test working as expected
		*/
		Test.testSandboxPostCopyScript(manager, UserInfo.getOrganizationId(), UserInfo.getOrganizationId(), 'sandboxName');
		
	}

	@isTest
	static void testPostSbxRefreshManagerWithCMDT() {
		PostSbxRefreshManager manager = new PostSbxRefreshManager();
		/*In case you post script is going to make a callout, this integration test
		should be having a mock callout to support that
		*/
		if(System.Label.IS_MAKING_HTTP_CALLOUT.toLowerCase() == 'true') {
			Test.setMock(HttpCalloutMock.class, new HttpResponseGenerator(200, 'OK', '{{"key1":"value1", "crumbRequestField":"test"}}', new Map<String, String>{'Content-Type'=>'application/json'}));
		}
		/**
		* The following sandboxpostcopy test takes these params: apex class name, org Id, sandbox Id, and sandboxName.
		* The org Id and sandbox Id can be any valid object Id... As of 4/27/16 I've seen example of passing Account Ids
		* 	into these two parameters and the test working as expected
		*/
		Test.testSandboxPostCopyScript(manager, UserInfo.getOrganizationId(), UserInfo.getOrganizationId(), 'sandboxName');
	}

}