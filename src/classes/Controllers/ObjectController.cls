public without sharing class ObjectController {

    @AuraEnabled(cacheable=true)
    public static Map<String, String> getContactInformationOwner(String email, String phone) {
        if (String.isBlank(email) && String.isBlank(phone)) return new Map<String, String>();
        return ObjectsManager.getContactInformationOwner(email, phone);
    }

    @AuraEnabled(cacheable=true)
    public static Boolean roomIsFree(Date startDate, Date endDate, String roomId) {
        if (startDate == null || endDate == null || String.isBlank(roomId)) return false;
        return OpportunityManager.hasOpportunityByDateForProduct(startDate, endDate, roomId);
    }

    @AuraEnabled
    public static String insertLeadAndGetId(Lead newLead) {
        if (newLead == null) return null;
        return LeadManager.insertLeadAndGetId(newLead);
    }

    @AuraEnabled
    public static void insertOpportunity(Opportunity newOpportunity) {
        if (newOpportunity == null) return;
        OpportunityManager.insertOpportunity(newOpportunity);
    }

    @AuraEnabled
    public static void insertCase(Case newCase) {
        if (newCase == null) return;
        insert newCase;
    }
}