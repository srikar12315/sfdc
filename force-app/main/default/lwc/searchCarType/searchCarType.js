import { LightningElement, wire, track} from 'lwc';
import getCarTypes from '@salesforce/apex/SearchCarTypesController.getCarTypes';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class SearchCarType extends  NavigationMixin(LightningElement) {
    @track carTypes;
    @wire(getCarTypes)
    wiredCareType({data, error}){

        if(data){ 
            this.carTypes = [{value:'', label: 'All Types'}];
            data.forEach(element => {
                const carType ={};
                carType.label = element.Name;
                carType.value =  element.Id;
                this.carTypes.push(carType);         
            });
        }else if(error){
         this.showToast('ERROR' , error.body.message, 'error');

        }

    }

    handleCarTypeChange(event){

        const carTypeId = event.detail.value;
        const carTypeSelectionChangeDispacthEvent = CustomEvent('cartypeselect' , {detail : carTypeId});
       
        this.dispatchEvent(carTypeSelectionChangeDispacthEvent);



    }

    createNewCarType(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes : {
                objectApiName : 'Car_Type__c',
                actionName : 'new'
            }


        });


    }

    showToast(title, message, variant){
        const evt = new ShowToastEvent({
            title : title,
            message : message,
            variant : variant,
            
        });
        this.dispatchEvent(evt);
    }
   



}