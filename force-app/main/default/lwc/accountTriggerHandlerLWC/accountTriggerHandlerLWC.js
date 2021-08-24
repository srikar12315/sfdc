import { LightningElement, track} from 'lwc';
import getAccounts from '@salesforce/apex/AccountTriggerHandler.getAccounts';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class AccountTriggerHandlerLWC extends LightningElement {
  @track numberOfAccounts;
  @track accounts;

    get responseReceived(){
        if(this.accounts){
            return true;
        }
        return false;
    }

    numberChangeHandler(event){
     this.numberOfAccounts =event.target.value;
    }

    getAccounts(){
        getAccounts({numberOfAccounts: this.numberOfAccounts}).then( response => {
            this.accounts = response;
            const toastEvent = new ShowToastEvent({
                title : 'Accounts Loaded',
                message : this.numberOfAccounts + ' Accounts fetched from the server',
                variant :'success',
            });
            this.dispatchEvent(toastEvent);
        }).catch(error => {
            
            
            const toastEvent = new ShowToastEvent({
                title : 'ERROR',
                message : error.body.message,
                variant :'error',
            });
            this.dispatchEvent(toastEvent);
        })

    }

}