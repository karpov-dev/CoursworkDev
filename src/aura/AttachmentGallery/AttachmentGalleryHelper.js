({
    getAttachments : function(component) {
        let ownerId = component.get('v.ownerId');
        if(ownerId){
            component.set('v.attachmentPath', null);
            let action = component.get('c.getAttachmentsByOwnerId');

            action.setParams({
                'ownerId' : ownerId
            })

            action.setCallback(this, (response) => {
                let state = response.getState();
                
                if(state === 'SUCCESS'){
                    let attachments = response.getReturnValue();
                    component.set('v.attachmentPath', attachments);
                } else if(state === "ERROR" || state === "INCOMPLETE"){
                    console.log('response is ' + state);
                    if(state == 'ERROR'){
                        let errors = response.getError();
                        if (errors) {
                            if (errors[0] && errors[0].message) {
                                console.log("Error message: " + errors[0].message);
                            } else{
                                console.log("Unknown error");
                            }
                        }
                    }
                }
            });

            $A.enqueueAction(action);
        }
    }
})