@IsTest
private class NbRBService_Test {

    @IsTest
    static void getRates_Test() {
        Test.setMock(HttpCalloutMock.class, new MbRBServiceMock());

        Test.startTest();
        List<CurrencyRate> response = NbRBService.getRates();
        Test.stopTest();

        System.assertEquals(1, response.size());
        System.assertEquals('170', response[0].CUR_ID);
        System.assertEquals('AUD', response[0].Cur_Abbreviation);
        System.assertEquals('1', response[0].Cur_scale);
        System.assertEquals('Австралийский доллар', response[0].Cur_Name);
        System.assertEquals('1.5638', response[0].Cur_OfficialRate);
    }
}