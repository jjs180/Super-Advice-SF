@istest
public class updateEmployeeHelper_test{

    //Test method to test scenarios to populate related account
    static testMethod void  testupdateAccount(){
        Account accRecord = TestData_Utility.createAccount();
        accRecord.name ='Closed Account';
        insert accRecord;
        system.assertNotEquals(accRecord.Id,null);

        Account accRecorddec = TestData_Utility.createAccount();
        accRecorddec.name ='Deceased Member';
        insert accRecorddec;
        system.assertNotEquals(accRecorddec.Id,null);
        
        Account accRecord1 = TestData_Utility.createAccount();
        accRecord1.name ='Ex Member';
        insert accRecord1;
        system.assertNotEquals(accRecord1.Id,null);
        
        Account accRecord2 = TestData_Utility.createAccount();
        accRecord2.name ='Test Account';
        accRecord2.Employer_Number__c ='1234';
        insert accRecord2;
        system.assertNotEquals(accRecord2.Id,null);
        
        Holding_Accounts__c holdingAcc = new Holding_Accounts__c(name='Closed Account',Account_ID__c=accRecord.Id);
        insert holdingAcc;
        system.assertNotEquals(holdingAcc.Id,null);
        
        Holding_Accounts__c holdingAcc1 = new Holding_Accounts__c(name='Ex Member',Account_ID__c=accRecord1.Id);
        insert holdingAcc1;
        system.assertNotEquals(holdingAcc1.Id,null);

        Holding_Accounts__c holdingAcc2 = new Holding_Accounts__c(name='Deceased Member',Account_ID__c=accRecorddec.Id);
        insert holdingAcc2;
        system.assertNotEquals(holdingAcc2.Id,null);
        
        list<contact>lstCon = new list<contact>();
       for(integer h=0;h<10;h++){
            contact conRecord = TestData_Utility.createContact(accRecord.Id);
            conRecord.Deceased_Member__c = TRUE;
            lstCon.add(conRecord);
        }
        for(integer i=0;i<21;i++){
            contact conRecord = TestData_Utility.createContact(accRecord.Id);
            lstCon.add(conRecord);
        }
        for(integer j=0;j<21;j++){
            contact conRecord1 = TestData_Utility.createContact(accRecord.Id);
            conRecord1.Employer_Number__c ='1234';
            lstCon.add(conRecord1);
        }
        for(integer k=0;k<21;k++){
            contact conRecord1 = TestData_Utility.createContact(accRecord.Id);
            conRecord1.Employer_Number__c ='12345';
            lstCon.add(conRecord1);
        }
        
        test.startTest();
            insert lstCon;
            integer count =0;
            for(contact conRec : lstCon){
                if(count <30)
                    conRec.Employer_Number__c ='';
                else if(count <60)
                    conRec.Employer_Number__c ='1234';
                else
                    conRec.Deceased_Member__c = TRUE;
                count++;
            }
            update lstCon;
        test.stopTest();
    }
}