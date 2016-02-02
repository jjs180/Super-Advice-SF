public class convertContactToLeadController{

    private final Contact con;
    private Id leadId;
    private Id conId;
    
    Set<Id> conIdSet = new Set<Id>();
    Set<Id> insertedPersonAccountSet2 = new Set<Id>();

    Map<String, Id> recordTypeMap = new Map<String, Id>();
    
    Map<Id, String> leadMap = new Map<Id, String>();

    public boolean isCreateOpportunity{get; set;}
    public boolean isConverted{get; set;}
    public Id convAccId{get; set;}
    public String convAccName{get; set;}    
 
    public convertContactToLeadController(ApexPages.StandardController Controller)
    {
        this.con = (Contact)Controller.getRecord();
        
        conId = con.Id;
        conIdSet.add(con.Id);
        isConverted();
        
        recordTypeMap();
        
    }
    
        public PageReference isConverted() 
        {
    
        isConverted = isContactConverted();
        return null;
        }
        
        public List<Contact> getContactList()
        {
        
        List<Contact> conList = [Select Id, Salutation, FirstName, LastName, Account.Name, Account.Id, OwnerId, Phone, Name, Gender__c, Birthdate, HomePhone, MobilePhone, Email, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry from Contact Where Id In: conIdSet];
        
        return conList;
        }        
        
        public void recordTypeMap()
        {
        //List<RecordType> rtList = [select Id, Name from RecordType where (Name='Person Account' or Name='Individual Opportunity' or Name = 'Individual Lead') and (SobjectType='Account' or SobjectType = 'Opportunity' or SobjectType = 'Lead')];
        List<RecordType> rtList = [select Id, Name from RecordType where (Name='Person Account' or Name='Individual Opportunity' or Name = 'Individual Lead (AU)') and (SobjectType='Account' or SobjectType = 'Opportunity' or SobjectType = 'Lead')];
        for(RecordType rt : rtList)
        {
            recordTypeMap.put(rt.Name, rt.Id);
        }
        }
        
        public void createNewLead(){
        
        List<Lead> leadList = new List<Lead>();
        for(Contact con: getContactList()){
            
            Lead newleadObj = new Lead();
            
            newleadObj.RecordTypeId = recordTypeMap.get('Individual Lead (AU)');
            
            newleadObj.OwnerId = con.OwnerId;
            newleadObj.Salutation = con.Salutation;
            newleadObj.FirstName = con.FirstName;
            newleadObj.LastName = con.LastName;
            
            newleadObj.Gender__c = con.Gender__c;
            newleadObj.Birthdate__c = con.Birthdate;
            System.debug('***::con id: ' + con.Id);
            newleadObj.Member_Contact__c = con.Id;

            newleadObj.Home_Phone__c = con.HomePhone;
            newleadObj.MobilePhone = con.MobilePhone;
            newleadObj.Phone = con.Phone;
            newleadObj.Email = con.Email;
            
            newleadObj.LeadSource = 'Ex Member';
            
            newleadObj.Street = con.MailingStreet;
            newleadObj.City = con.MailingCity;
            newleadObj.State = con.MailingState;
            newleadObj.PostalCode = con.MailingPostalCode;
            newleadObj.Country = con.MailingCountry;
            
            leadList.add(newleadObj);
        }    
        try{
            Database.SaveResult[] insertLead = Database.insert(leadList);
        
            for(Database.SaveResult sr : insertLead){
                if(sr.isSuccess()){
                    leadId = sr.getId();
                }
            }
        }
        Catch(DmlException dml){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL, dml.getMessage());
            ApexPages.addMessage(myMsg);
        } 
    }
        
    
        public Boolean isContactConverted(){
        boolean isConvert = false;
        
        List<Lead> convertedLead = [Select Id, Name from Lead Where Member_Contact__c In: conIdSet];    

        for(Lead l: convertedLead){
            convAccId = l.Id;
            convAccName = l.Name;
        }
        
        if(convertedLead.isEmpty()){
            isConvert = true;
        }
        
        return isConvert;
    }   
    
    public PageReference doCancel() {
        
        PageReference returnPage = new PageReference('/' + conId);
        
        return returnPage;
    
    }
    
    public PageReference convertToPersonAccount() {
        
        createNewLead();
        
        PageReference returnPage = new PageReference('/' + leadId);

        if(ApexPages.hasMessages()){
            return null;
        } else {
            return returnPage;
        }

    }

}