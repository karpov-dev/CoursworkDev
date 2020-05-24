public without sharing class ContactManager {

    public static List<String> getContactEmails(List<Contact> contacts) {
        if (contacts == null) return null;

        List<String> emails = new List<String>();
        for (Contact contact : contacts) {
            emails.add(contact.Email);
        }
        return emails;
    }

    public static String getContactIdByEmailAndPhone(String email, String phone) {
        if (String.isBlank(email) && String.isBlank(phone)) return null;

        List<Contact> contacts = [SELECT Id FROM Contact WHERE Email = :email OR Phone = :phone LIMIT 1];
        if (contacts.size() > 0) return contacts[0].Id; else return null;
    }

    @InvocableMethod
    public static void sendReviewEmails(List<Contact> contacts) {
        if (contacts == null) return;

        EmailTemplate template = [SELECT Id FROM Emailtemplate WHERE Name = 'Room Review Email' LIMIT 1];
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
        for (Contact contact : contacts) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toaddresses = new String[]{
                    contact.Email
            };
            message.setTemplateId(template.Id);
            message.setTargetObjectId(contact.Id);
            emailsToSend.add(message);
        }
        Messaging.sendEmail(emailsToSend);
    }
}