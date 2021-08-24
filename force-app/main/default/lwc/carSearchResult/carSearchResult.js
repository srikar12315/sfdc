import { LightningElement, api, wire, track } from 'lwc';
import getCars from '@salesforce/apex/CarSearchResultController.getCars';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';


export default class CarSearchResult extends LightningElement {
    @api carTypeId;
    @track cars;
    @track selectedCarId;

    @wire(getCars, {carTypeId : '$carTypeId'})
    wiredCars({data,error}){
        if(data){
         this.cars = data;
        }else if(error){
       this.showToast('ERROR', error.body.message, 'error');
        }
    }

showToast(title, message, variant){
    const evt = new ShowToastEvent({
        title:title,
        message:message,
        error:error,
    });
    this.dispatchEvent(evt);
}
carSelectHandler(event){
    const carId = event.detail;
   // alert(carId);
   
    this.selectedCarId = carId;

}

get carsFound(){
    if(this.cars){
       // alert('true');
        return true;    
    }
        return false;
    
        
   
   
}



}