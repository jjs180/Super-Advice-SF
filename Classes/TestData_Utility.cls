public class TestData_Utility{
     public static Account createAccount(){
        Account accountRecord = new Account(name='test');
        return accountRecord;
    }
    
    public static contact createContact(Id AccId){
        contact contactRecord = new contact(lastname = 'test',accountId = accId);
        return contactRecord;
    }
}