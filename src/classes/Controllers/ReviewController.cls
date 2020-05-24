public with sharing class ReviewController {

    @AuraEnabled(cacheable=true)
    public static List<Hotel_Review__c> getHotelReviewsByOffset(Integer recordsOffset, String hotelId, Integer recordsLimit) {
        if (recordsOffset == null || String.isBlank(hotelId) || recordsLimit == null) return new List<Hotel_Review__c>();
        return ReviewManager.getHotelReviewsByOffset(recordsOffset, hotelId, recordsLimit);
    }

}