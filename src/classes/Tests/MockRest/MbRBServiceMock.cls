@IsTest
global class MbRBServiceMock implements HttpCalloutMock{

    global HttpResponse respond(HttpRequest param1) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"Cur_ID": 170, "Date": "2020-05-22T00:00:00", "Cur_Abbreviation": "AUD", "Cur_Scale": 1, "Cur_Name": "Австралийский доллар", "Cur_OfficialRate": 1.5638}]');
        response.setStatusCode(200);
        return response;
    }
}