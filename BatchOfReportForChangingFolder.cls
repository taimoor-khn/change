global class BatchOfReportForChangingFolder implements Database.Batchable<sObject>, Database.AllowsCallouts  {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // Query records to process
        return Database.getQueryLocator('SELECT Id,Name,Report_Id__c , Status_Code__c FROM Report_Changing__c');
    }
    
    global void execute(Database.BatchableContext bc, List<Report_Changing__c> reportList) {
        
        list<Report_Changing__c> newReportList =new list<Report_Changing__c>();
        ChangingFolderOfReport objChangingFolderOfReport=new ChangingFolderOfReport();
        
        for(Report_Changing__c obj :reportList)
        {
            system.debug('Report Name--->>  '+obj.Name);
            obj.Status_Code__c=String.valueOf(objChangingFolderOfReport.editCall(obj.Report_Id__c));
            newReportList.add(obj);
        }
        if(newReportList.size()>0)
        {
            update newReportList;
        }
    }
    
    global void finish(Database.BatchableContext bc) {
        // Perform any post-processing tasks
    }
    
}