import { LightningElement,api,wire } from 'lwc';
import {fireEvent} from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

export default class MeetingRoom extends LightningElement {

    @api meetingRoomInfo;
    @api showRooms=false;
    @wire(CurrentPageReference) pageReference;


    clickEventHandler(){
        const tileclicked = new CustomEvent('tileclick',{detail : this.meetingRoomInfo, bubbles:true});
        this.dispatchEvent(tileclicked);
        fireEvent(this.pageReference,'pubsubtileClick', this.meetingRoomInfo);
        
    }

}