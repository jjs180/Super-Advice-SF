public class updateEmployeeHelper{

    public static void updateAccount(list<contact>lstContact,map<Id,contact>mapOldContact){
        Map<String,Holding_Accounts__c>mapHoldingAccount = Holding_Accounts__c.getAll();
        set<string>setEmployeeNumber = new set<string>();
        for(contact con : lstContact){
            if(mapOldContact == null){
                if(con.Deceased_Member__c){
                    if(mapHoldingAccount.get('Deceased Member') != null && mapHoldingAccount.get('Deceased Member').Account_ID__c != '' && mapHoldingAccount.get('Deceased Member').Account_ID__c != null){
                        con.AccountId = mapHoldingAccount.get('Deceased Member').Account_ID__c;
                    }
                }                
                else if(con.Employer_Number__c == '' || con.Employer_Number__c == null){
                    if(mapHoldingAccount.get('Closed Account') != null && mapHoldingAccount.get('Closed Account').Account_ID__c != '' && mapHoldingAccount.get('Closed Account').Account_ID__c != null){
                        con.AccountId = mapHoldingAccount.get('Closed Account').Account_ID__c;
                    }
                }
                else{
                    setEmployeeNumber.add(con.Employer_Number__c);
                }
            }
            else{
                if(con.Deceased_Member__c){
                    if(mapHoldingAccount.get('Deceased Member') != null && mapHoldingAccount.get('Deceased Member').Account_ID__c != '' && mapHoldingAccount.get('Deceased Member').Account_ID__c != null){
                        con.AccountId = mapHoldingAccount.get('Deceased Member').Account_ID__c;
                    }
                }            
                else if(mapOldContact.get(con.Id).Employer_Number__c != con.Employer_Number__c){
                    if(con.Employer_Number__c == '' || con.Employer_Number__c == null){
                        if(mapHoldingAccount.get('Closed Account') != null && mapHoldingAccount.get('Closed Account').Account_ID__c != '' && mapHoldingAccount.get('Closed Account').Account_ID__c != null){
                            con.AccountId = mapHoldingAccount.get('Closed Account').Account_ID__c;
                        }
                    }
                    else{
                        setEmployeeNumber.add(con.Employer_Number__c);
                    }
                }
            }
        }
        system.debug('@@@@____'+setEmployeeNumber);
        map<string,Id>mapEmployeeAccountId = new map<string,Id>();
        if(!setEmployeeNumber.isEmpty()){
            list<account>lstAccount = [select id,Employer_Number__c from account where Employer_Number__c IN : setEmployeeNumber];
            if(!lstAccount.isEmpty()){
                for(account acc : lstAccount){
                    mapEmployeeAccountId.put(acc.Employer_Number__c,acc.Id);
                }
            }
        }
        for(contact conRecord : lstContact){
            if(!setEmployeeNumber.isEmpty() && setEmployeeNumber.contains(conRecord.Employer_Number__c)){
                if(conRecord.Employer_Number__c != '' && conRecord.Employer_Number__c != null && !mapEmployeeAccountId.isEmpty() && mapEmployeeAccountId.containsKey(conRecord.Employer_Number__c)){
                    conRecord.AccountId = mapEmployeeAccountId.get(conRecord.Employer_Number__c);
                }
                else{
                    if(conRecord.Employer_Number__c != '' && conRecord.Employer_Number__c != null){
                        conRecord.AccountId = mapHoldingAccount.get('Ex Member').Account_ID__c;
                    }
                }
            }
        }        
    }
}