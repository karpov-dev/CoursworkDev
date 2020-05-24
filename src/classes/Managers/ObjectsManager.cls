public without sharing class ObjectsManager {
    
    public static Boolean checkEmailIsUniqueEnabled = true;

    public static Boolean emailIsUnique(List<String> emails){
        if(emails.isEmpty()) return false;
        if(!checkEmailIsUniqueEnabled) return true;

        List<Lead> leads = [SELECT Id FROM Lead WHERE Email IN :emails LIMIT 1];
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Email IN :emails LIMIT 1];
        if(leads.size() == 0 && contacts.size() == 0){
            return true;
        }
        return false;
    }

    public static Map<String,String> getContactInformationOwner(String email, String phone){
        Map<String,String> searchResult = new Map<String,String>();
        if(String.isBlank(email) || String.isBlank(phone)) return searchResult;

        String leadId = LeadManager.getLeadIdByEmailAndPhone(email, phone);
        if(leadId != null) {
            searchResult.put('LEAD', leadId);
            return searchResult;
        }

        String contactId = ContactManager.getContactIdByEmailAndPhone(email, phone);
        if(contactId != null){
            searchResult.put('CONTACT', contactId);
            return searchResult;
        }

        searchResult.put('NULL', 'NULL');
        return  searchResult;
    }

}