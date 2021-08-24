import { LightningElement, track } from 'lwc';

export default class BmiCalculator extends LightningElement {
    @track details;
    /**
     * bmiData ={weight:0,height:0,result:0}
     * 
     * 
     * 
     */

    weight;
    height;

    weightChange(event){
        this.weight=parseFloat(event.target.value);
        //this.bmiData.weight

    }
    
    heightChange(event){
        this.height=parseFloat(event.target.value);

    }

    calculateBMI(){
        try{
            this.details = this.weight / (this.height * this.height ) ;
        }catch(error){
            this.details=undefined;
        }
      

    }

}