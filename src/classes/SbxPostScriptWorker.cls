/**
*   SbxPostScriptWorker 
*
*   @author Rohan Gore
*   
*   @date 1/05/2017
*   Changes to test commit from IntelliJ Idea
*/
public with sharing abstract class SbxPostScriptWorker {

    /**
    * One of the two methods that are required to be implemented by a SBX_PostCopyWorker.
    * Class extensions will implement this method and include any post copy logic they want to run.
    * Generic exception handling is provided by the wrapper method process() below which is directly
    *   called by the Manager classes
    */
    protected abstract void run(SandboxContext context);

    /**
    * This is the publicly available method called by the Manager classes. Class extensions
    *   are required to implement the run method above which is then wrapped by this process() method.
    *   It attempts to provide generic exception handling. If you are catching your own exceptions then
    *   be sure to look at the Logging Frameworks classes to see the way they are generated.
    */
    public void process(SandboxContext context){
        try {
            run(context);
            //Logging framework method to generate the log
        } catch (Exception e){
            //Logging framework method to generate the exception log
        }
    }

}