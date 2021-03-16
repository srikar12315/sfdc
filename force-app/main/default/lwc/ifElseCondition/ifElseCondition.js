import { LightningElement } from 'lwc';

export default class IfElseCondition extends LightningElement {

    tom=false;
    jerry=false;

    tommMethod(){
        this.tom=true;
        this.jerry=false;

    }
    jerryMethod(){
        this.jerry=true;
        this.tom=false;

        
    }


}