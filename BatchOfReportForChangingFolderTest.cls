@isTest
public class BatchOfReportForChangingFolderTest {
    
    @testSetup static void methodName()
    {
        list<Report_Changing__c> tempReportList =new list<Report_Changing__c>();
        
        for(integer i=0;i<10;i++)
        {
            Report_Changing__c newReport =new Report_Changing__c(); 
            newReport.Name='i'+i;
            newReport.Report_Id__c='i'+i;
            tempReportList.add(newReport);
        }
        insert tempReportList;
    }
    @IsTest
    static void myTestMethod1() 
    {
        Test.startTest();
        
        Test.setMock(HttpCalloutMock.class, new ChangingFolderOfReportMockClass200());
        BatchOfReportForChangingFolder obj = new BatchOfReportForChangingFolder();
        DataBase.executeBatch(obj);
        Test.stopTest();
    }
}