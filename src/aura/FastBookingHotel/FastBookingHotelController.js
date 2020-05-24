({
    findHotels : function(component, event, helper) {

    },

    isFullInformation : function(component, event, helper){

        let location = component.find('location').get('v.value');
        let startBooking = component.find('startBookingDate').get('v.value');
        let endBooking = component.find('endBookingDate').get('v.value');
        let searchDisabiled = true;

        if(location != null && startBooking != null && endBooking != null){
            searchDisabiled = false;
        }
        component.set('v.searchDisabled', searchDisabiled);

    }
})