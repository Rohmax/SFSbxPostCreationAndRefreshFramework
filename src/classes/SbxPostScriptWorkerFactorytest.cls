@isTest
private class SbxPostScriptWorkerFactorytest {
    
    @isTest
    static void testSbxPostScriptWorkerFactoryForNoCustomMetadata() {
        SbxPostScriptWorkerFactory.getWorkers(new List<String>());

    }
    
    @isTest
    static void testSbxPostScriptWorkerFactoryForInvalidRegisteredClass() {
        SbxPostScriptWorkerFactory.createWorkerObjectFromString('InvalidClass');

    }

    @isTest
    static void testSbxPostScriptWorkerFactoryForNoClassNameInCMDT() {
        SbxPostScriptTask__mdt mdtRecord = new SbxPostScriptTask__mdt();
        List<SbxPostScriptTask__mdt > taskList = new List<SbxPostScriptTask__mdt >();
        taskList.add(mdtRecord);
        SbxPostScriptWorkerFactory.getWorkerListFromCustomMetaDataTypes(taskList);

    }

}