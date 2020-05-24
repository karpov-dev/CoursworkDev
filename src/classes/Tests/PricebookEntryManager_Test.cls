@IsTest
private class PricebookEntryManager_Test {

    @IsTest
    static void getCurrencyRates_CheckData() {
        Boolean testIsPassed = true;
        Test.startTest();
        try{
            Map<String, Decimal> result = PricebookEntryManager.getCurrencyRates();
        } catch (Exception e){
            testIsPassed = false;
        }
        Test.stopTest();

        System.assert(testIsPassed);
    }
}