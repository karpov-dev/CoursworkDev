@IsTest
public with sharing class HotelReviewDataFactory {
    public static  Hotel_Review__c getHotelReviewWithTitle(String title, Hotel__c hotel, Contact contact){
        return new Hotel_Review__c(Title__c = title, Hotel__c = hotel.Id, Contact__c = contact.Id, Review__c = 'Review');
    }
}