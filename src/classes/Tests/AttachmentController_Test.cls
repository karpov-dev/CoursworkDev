@IsTest
private class AttachmentController_Test {

    @IsTest static void getAttachmentsByOwnerId_FoundData() {
        Hotel__c hotel = HotelFactory.getHotel();
        hotel.Hotel_Image__c = 'image';
        insert hotel;

        Test.startTest();
        String result = AttachmentController.getAttachmentsByOwnerId(hotel.Id);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals('image', result);
    }
    @IsTest static void getAttachmentsByOwnerId_EmptyParentID() {
        Test.startTest();
        String result = AttachmentController.getAttachmentsByOwnerId(null);
        Test.stopTest();

        System.assertEquals('', result);
    }
}