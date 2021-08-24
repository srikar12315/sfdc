import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
@track output;
@track previousResults=[];
@track showPreviousRslt =false;

firstnumber;
secondnumber;
numberChangeHandler(event){
    const inputBoxName = event.target.name;
    if(inputBoxName =='firstNumber'){
        this.firstnumber =event.target.value;
    }else if(inputBoxName=='secondNumber'){
        this.secondnumber=event.target.value;;
    }

}

    addvalues(){
        const fnumber = parseInt(this.firstnumber);
        const snumber = parseInt(this.secondnumber);
        this.output=` Result of ${fnumber} + ${snumber} is ${fnumber+snumber}`;
        this.previousResults.push(this.output);
    }
    subvalues(){
        const fnumber = parseInt(this.firstnumber);
        const snumber = parseInt(this.secondnumber);
        this.output=` Result of ${fnumber} - ${snumber} is ${fnumber-snumber}`;
        this.previousResults.push(this.output);
    }
    multiplyvalues(){
        const fnumber = parseInt(this.firstnumber);
        const snumber = parseInt(this.secondnumber);
        this.output=` Result of ${fnumber} * ${snumber} is ${fnumber*snumber}`;
        this.previousResults.push(this.output);
    }
    dividevalues(){
        const fnumber = parseInt(this.firstnumber);
        const snumber = parseInt(this.secondnumber);
        this.output=` Result of ${fnumber} / ${snumber} is ${fnumber/snumber}`;
        this.previousResults.push(this.output);
    }

    showpreviousResultes(event){
        this.showPreviousRslt =event.target.checked;

    }
}