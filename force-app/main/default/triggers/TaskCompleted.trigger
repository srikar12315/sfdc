trigger TaskCompleted on Lead (before Update) {
    
    
   TaskCompletedHandlerCtrl.TaskCompletedHandler(Trigger.New);
    

}