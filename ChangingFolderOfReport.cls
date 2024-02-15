public class ChangingFolderOfReport {
    
    public Integer editCall(string reportId)
    {
        // Define the endpoint URL for the PATCH request
        String endpoint = URL.getOrgDomainUrl().toExternalForm()+'/services/data/v34.0/analytics/reports/'+reportId;
        
        // Define the JSON payload with the updated report name and folder
       String requestBody = '{ "reportMetadata" : {"name":"myUpdatedReport","folderId":"'+System.Label.ReportChange_FolderId+'"}}';
        
        // Create an HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('PATCH');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setBody(requestBody);
        
        // Create an HTTP instance and send the request
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        // Check the response
        if (res.getStatusCode() == 200) {
            System.debug('Report updated successfully.');
        } else {
            System.debug('Failed to update report. Status code: ' + res.getStatusCode() + ', Response: ' + res.getBody());
        }
        return res.getStatusCode();
    }
}