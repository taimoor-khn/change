@isTest
global class ChangingFolderOfReportMockClass200 implements HttpCalloutMock 
{
    global HTTPResponse respond(HTTPRequest req) 
    {
        system.debug('respond call'+req.getEndpoint());
        HttpResponse res = new HttpResponse();
        res.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        if(req.getEndpoint().contains('/reports'))
        {
            
            res.setStatusCode(200);  
        }
        return res;
    }
}