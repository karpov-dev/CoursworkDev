@IsTest
private class ProductManager_Test {


    @IsTest static void getProductsByRequestString_ValidString() {
        Product2 product = ProductFactory.getProduct();
        insert product;
        String request = 'Select id From Product2';

        Test.startTest();
        List<Product2> result = ProductManager.getProductsByRequestString(request);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(1, result.size());
        System.assertEquals(product.Id, result[0].Id);
    }
    @IsTest static void getProductsByRequestString_NullString() {
        Test.startTest();
        List<Product2> result = ProductManager.getProductsByRequestString(null);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(0, result.size());
    }
    @IsTest static void getProductsByRequestString_BadRequestString() {
        String request = 'Select idd From Product2re';

        Test.startTest();
        List<Product2> result = ProductManager.getProductsByRequestString(request);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(0, result.size());
    }

    @IsTest static void getMaxFieldInternalValue_ValidData(){
        Product2 product = ProductFactory.getProduct();
        product.Rating__c = 5;
        insert product;

        Test.startTest();
        Integer result = ProductManager.getMaxFieldInternalValue('Rating__c');
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(5, result);
    }
    @IsTest static void getMaxFieldInternalValue_EmptyFieldName(){
        Test.startTest();
        Integer result = ProductManager.getMaxFieldInternalValue(null);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(-1, result);
    }
    @IsTest static void getMaxFieldInternalValue_FieldNotExists(){
        Test.startTest();
        Integer result = ProductManager.getMaxFieldInternalValue('FieldNotExits_fdsfsd');
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(-1, result);
    }

    @IsTest static void getMaxUnitPrice_NotFoundData(){
        Test.startTest();
        Decimal result = ProductManager.getMaxUnitPrice();
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(-1, result);
    }
}