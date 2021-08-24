import { LightningElement, track } from 'lwc';

export default class PublicParentMethod extends LightningElement {
  @track value;


    selectCheckboxHandler(){
        const childComponent = this.template.querySelector('c-public-child-method');
        const returnMessage = childComponent.selectCheckbox(this.value);
        console.log('returnMessage' ,returnMessage);

    }

    inputChangeHandler(event){
        this.value = event.target.value;
    }
}