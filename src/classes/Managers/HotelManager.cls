public class HotelManager {

    public static List<Hotel__c> getHotelsByRequestString(String requestString) {
        if (String.isBlank(requestString)) return new List<Hotel__c>();
        return Database.query(requestString);
    }
}