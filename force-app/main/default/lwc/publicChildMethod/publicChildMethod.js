import { LightningElement, track, api } from 'lwc';

export default class PublicChildMethod extends LightningElement {

  @track  value = ['Red'];

        chckValues = [ { label: 'Red Marker',     value: 'Red'    },
                     { label: 'Green Marker',   value: 'Green'  },
                     { label: 'Yellow Marker',  value: 'Yellow' },
                     { label: 'Orange Marker',  value: 'Orange' },
                     { label: 'Black Marker',   value: 'Black'  },
                     { label: 'White Marker',   value: 'White'  },
             ];

    @api
    selectCheckbox(checkboxValue){
       const suppliedValue = this.chckValues.find(checkbox =>{
            return checkboxValue === checkbox.value;
        })
       if(suppliedValue){
           this.value = suppliedValue.value;
           return "Successfully checked";

       }
       return "No Checkbox found";


    }

}