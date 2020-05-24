@isTest
public with sharing class HotelManager_Test {
    
    @isTest static void test_getHotelsByRequestString_GoodRequestString(){
        Hotel__c hotel = HotelFactory.getHotel();
        insert hotel;
        String requestString = 'SELECT Id FROM Hotel__c';

        Test.startTest();
            List<Hotel__c> hotels = HotelManager.getHotelsByRequestString(requestString);
        Test.stopTest();
        System.assertEquals(hotel.Id, hotels[0].Id);
    }

    @isTest static void test_getHotelsByRequestString_NullRequestString(){
        Hotel__c hotel = HotelFactory.getHotel();
        insert hotel;
        String nullRequestString = null;

        Test.startTest();
            List<Hotel__c> hotels = HotelManager.getHotelsByRequestString(nullRequestString);
        Test.stopTest();
        System.assertNotEquals(null, hotels);
    }
}