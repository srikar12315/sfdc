import { LightningElement, track } from 'lwc';

export default class AccountManagementLDSForms extends LightningElement {

    @track recordId;


    succesHandler(event){
        this.recordId = event.detail.id;
    }


}