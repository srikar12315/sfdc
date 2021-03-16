import { LightningElement } from 'lwc';

export default class HtmlEventsBasic extends LightningElement {
    message="Welcome";


    handleChange(event){

       const val =  event.target.value;
       const lbl = event.target.label;

        alert( 'I am inside the Method : ' + val +' The label is  :' + lbl );

    }


}