import { LightningElement,track,wire } from 'lwc';
import {registerListener, unregisterAllListeners, unregisterListener} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class SelectedMeetingRoom extends LightningElement {

@track selectedMeetingRoom=[];
@wire (CurrentPageReference) pageRef;

connectedCallback(){
    registerListener('pubsubtileClick',this.onMeetingRoomSelectedHandler,this);
}

disconnectedCallback(){
    unregisterListener(this);
}

onMeetingRoomSelectedHandler(payload){
    this.selectedMeetingRoom=payload;
}



}