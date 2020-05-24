public without sharing class HotelController {

    @AuraEnabled(cacheable=true)
    public static List<Hotel__c> getHotelsByRequestString(String requestString) {
        if (String.isBlank(requestString)) return new List<Hotel__c>();
        return HotelManager.getHotelsByRequestString(requestString);
    }
}