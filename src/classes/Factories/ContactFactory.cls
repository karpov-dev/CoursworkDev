@IsTest
public class ContactFactory {
    public static Contact createContact() {
        return new Contact(FirstName = 'FirstName', LastName = 'LastName', Email = 'Email@email.com', Phone = '123456789');
    }

    public static Contact createContactByEmail(String email){
        return new Contact(FirstName = 'FirstName', LastName = 'LastName', Email = email, Phone = '123456789');
    }

    public static String getWrongEmail() {
        return 'wrong@wrong.com';
    }

    public static String getWrongPhone() {
        return '6555555';
    }
}