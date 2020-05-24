@IsTest
private class ReviewManager_Test {

    @IsTest static void getHotelReviewsByOffset_WithoutOffset() {
        Hotel__c hotel = HotelFactory.getHotel();
        insert hotel;
        Contact contact = ContactFactory.createContact();
        insert contact;
        List<Hotel_Review__c> reviews = new List<Hotel_Review__c>();
        for(Integer i = 0; i < 10; i++){
            reviews.add(HotelReviewDataFactory.getHotelReviewWithTitle('number: ' + i, hotel, contact));
        }
        insert  reviews;

        Test.startTest();
        List<Hotel_Review__c> result = ReviewManager.getHotelReviewsByOffset(0, hotel.Id, 10);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(10, result.size());
    }
    @IsTest static void getHotelReviewsByOffset_WithOffset() {
        Hotel__c hotel = HotelFactory.getHotel();
        insert hotel;
        Contact contact = ContactFactory.createContact();
        insert contact;
        List<Hotel_Review__c> reviews = new List<Hotel_Review__c>();
        for(Integer i = 0; i < 10; i++){
            reviews.add(HotelReviewDataFactory.getHotelReviewWithTitle('number: ' + i, hotel, contact));
        }
        insert  reviews;

        Test.startTest();
        List<Hotel_Review__c> result = ReviewManager.getHotelReviewsByOffset(5, hotel.Id, 10);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(5, result.size());
    }
    @IsTest static void getHotelReviewsByOffset_InvalidData() {
        Test.startTest();
        List<Hotel_Review__c> result = ReviewManager.getHotelReviewsByOffset(5, null, 10);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(0, result.size());
    }

    @IsTest static void updateAllRating_ValidData(){
        Hotel__c hotel = HotelFactory.getHotel();
        insert hotel;
        Product2 product = ProductFactory.getProduct();
        product.Hotel__c = hotel.Id;
        Contact contact = ContactFactory.createContact();
        insert contact;
        insert product;

        List<Hotel_Review__c> reviews = new List<Hotel_Review__c>();
        for(Integer i = 0; i < 11; i++){
            Hotel_Review__c review = HotelReviewDataFactory.getHotelReviewWithTitle('Number: ' + i, hotel, contact);
            review.Product_Rating__c = i;
            review.Hotel_Rating__c = i;
            review.Product__c = product.Id;
        }
        insert  reviews;

        Test.startTest();
        ReviewManager.updateAllRating(reviews);
        Test.stopTest();

        List<Product2> products = [SELECT Id, Rating__c FROM Product2];
        System.assert(!products.isEmpty());
        System.assertEquals(5, products[0].Rating__c);
    }
    @IsTest static void updateAllRating_InvalidData(){
        Boolean testIsPassed = true;
        Test.startTest();
        try{
            ReviewManager.updateAllRating(null);
        } catch (Exception e){
            testIsPassed = false;
        }

        Test.stopTest();

        System.assert(testIsPassed);
    }
}