import { LightningElement, track } from 'lwc';

export default class LwcComp extends LightningElement {
    @track fname="Your Name";
    @track location;
    @track chkBox=false;
    @track cityList =['Auckland','Wellington','South Island'];


    namechanges(event){
        this.fname = event.target.value;

    }

    locationchanged(event){
        this.location = event.target.value;

    }
    showCheckboxhandler(event){
        this.chkBox = event.target.checked;
    }
}