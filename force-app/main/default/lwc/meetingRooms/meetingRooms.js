import { LightningElement, track } from 'lwc';

export default class MeetingRooms extends LightningElement {
    @track selectedMeetingRoom;
    @track selectedMeetingRoomDetails;
    chkBox=false;
    meetingRoomsInfo=[
        {roomName:'A-01', roomCapacity:'12'},
        {roomName:'A-02', roomCapacity:'120'},
        {roomName:'A-03', roomCapacity:'1200'},
        {roomName:'A-04', roomCapacity:'12000'},
        {roomName:'A-05', roomCapacity:'120000'},
        {roomName:'A-06', roomCapacity:'1200000'}
    ]
    
       
    showCheckboxhandler(event){

        this.chkBox = event.target.checked;
    }

    tileSelectedHandler(event){
        const meetingRoomInfo = event.detail;
        this.selectedMeetingRoom=meetingRoomInfo.roomName;
        this.selectedMeetingRoomDetails=meetingRoomInfo.roomCapacity;
    }

    constructor(){
        super();
        this.template.addEventListener('tileclick',this.tileSelectedHandler.bind(this));
        
    }
    
    
}