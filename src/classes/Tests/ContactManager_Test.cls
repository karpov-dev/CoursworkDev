@isTest
public with sharing class ContactManager_Test {
    
    @isTest static void test_GetContactEmails_ValidData(){
        List<Contact> contacts = new List<Contact>();
        contacts.add(ContactFactory.createContact());
        insert contacts;

        Test.startTest();
            List<String> emails = ContactManager.getContactEmails(contacts);
        Test.stopTest();

        System.assertEquals(1, emails.size());
        System.assertEquals(contacts[0].Email, emails[0]);
    }
    @isTest static void test_GetContactEmails_NullContactData(){
        Test.startTest();
            List<String> emails = ContactManager.getContactEmails(null);
        Test.stopTest();

        System.assertEquals(null, emails);
    }


    @isTest static void test_getContactIdByEmailAndPhone_ValidData(){
        Contact contact = ContactFactory.createContact();
        insert contact;

        Test.startTest();
            Id contactId = ContactManager.getContactIdByEmailAndPhone(contact.Email, contact.Phone);
        Test.stopTest();

        System.assertEquals(contact.Id, contactId);
    }
    @isTest static void test_getContactIdByEmailAndPhone_WrongPhone(){
        String wrongPhone = ContactFactory.getWrongPhone();
        Contact contact = ContactFactory.createContact();
        insert contact;

        Test.startTest();
            Id contactId = ContactManager.getContactIdByEmailAndPhone(contact.Email, wrongPhone);
        Test.stopTest();

        System.assertEquals(contact.Id, contactId);
    }
    @isTest static void test_getContactIdByEmailAndPhone_WrongEmail(){
        String wrongEmail = ContactFactory.getWrongEmail();
        Contact contact = ContactFactory.createContact();
        insert contact;

        Test.startTest();
            Id contactId = ContactManager.getContactIdByEmailAndPhone(wrongEmail, contact.Phone);
        Test.stopTest();

        System.assertEquals(contact.Id, contactId);
    }
    @isTest static void test_getContactIdByEmailAndPhone_WrongData(){
        String wrongEmail = ContactFactory.getWrongEmail();
        String wrongPhone = ContactFactory.getWrongPhone();
        Contact contact = ContactFactory.createContact();
        insert contact;

        Test.startTest();
            Id contactId = ContactManager.getContactIdByEmailAndPhone(wrongEmail, wrongPhone);
        Test.stopTest();

        System.assertEquals(null, contactId);
    }
    @isTest static void test_getContactIdByEmailAndPhone_NullData(){
        Test.startTest();
            Id contactId = ContactManager.getContactIdByEmailAndPhone(null, null);
        Test.stopTest();

        System.assertEquals(null, contactId);
    }

    @IsTest static void test_sendReviewEmails_ValidData(){
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 10; i++){
            contacts.add(ContactFactory.createContactByEmail(i + '@email.com'));
        }
        insert contacts;

        Boolean testPassed = true;
        Test.startTest();
        try{
            ContactManager.sendReviewEmails(contacts);
        } catch (Exception exp){
            testPassed = false;
        }
        Test.stopTest();

        System.assertEquals(true, testPassed);
    }
    @IsTest static void test_sendReviewEmails_NullData(){

        Boolean testPassed = true;
        Test.startTest();
        try{
            ContactManager.sendReviewEmails(null);
        } catch (Exception exp){
            testPassed = false;
        }
        Test.stopTest();

        System.assertEquals(true, testPassed);
    }
    @IsTest static void test_sendReviewEmails_EmptyListData(){
        List<Contact> contacts = new List<Contact>();

        Boolean testPassed = true;
        Test.startTest();
        try{
            ContactManager.sendReviewEmails(contacts);
        } catch (Exception exp){
            testPassed = false;
        }
        Test.stopTest();

        System.assertEquals(true, testPassed);
    }
}