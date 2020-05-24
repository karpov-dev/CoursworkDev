public with sharing class AttachmentController {

    @AuraEnabled(cacheable=true)
    public static String getAttachmentsByOwnerId(String ownerId) {
        List<Attachment> attachments = new List<Attachment>();
        if (String.isBlank(ownerId)) return '';

        Hotel__c hotel = [SELECT Id, Hotel_Image__c FROM Hotel__c WHERE Id = :ownerId];
        return hotel.Hotel_Image__c;
    }
}