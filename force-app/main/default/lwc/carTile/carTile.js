import { LightningElement, api, wire } from 'lwc';
import { fireEvent} from 'c/pubsub';
import { CurrentPageReference} from 'lightning/navigation';



export default class CarTile extends LightningElement {

 @api car;
 @api carSelectedId;
 @wire(CurrentPageReference) pageRef;

 handleCarSelect(event){
   // alert('from cartile before');
    event.preventDefault();
    //alert('from cartile before1');
    const carId = this.car.Id;
    //alert('from cartile');

    const carSelect = new CustomEvent('carselect', {detail:carId});
    
    this.dispatchEvent(carSelect);

    fireEvent(this.pageRef, 'carselect', this.car);
 }

 get isCarSelected(){
     
    
   // alert(this.carSelectedId);
     if(this.car.Id === this.carSelectedId){
       // alert('this.car.Id');
         return "title selected";
     }
     return "title";
 }

 
}