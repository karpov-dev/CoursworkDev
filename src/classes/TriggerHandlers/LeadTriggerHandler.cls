public class LeadTriggerHandler extends TriggerHandler{

    public override void beforeInsert(){
        List<Lead> leadsBeforeInsert = (List<Lead>)Trigger.new;
        if(!ObjectsManager.emailIsUnique(getEmails(leadsBeforeInsert))) {
            leadsBeforeInsert[0].addError('Email must be unique');
        }
    }

    private static List<String> getEmails(List<Lead> leads){
        if(leads.isEmpty()) return new List<String>();

        List<String> emails = new List<String>();
        for(Lead lead : leads){
            emails.add(lead.Email);
        }

        return emails;
    }
}