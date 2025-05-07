import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Ant;
class PTCApp extends Application.AppBase {
    
    function onMessage(msg) { //Function to construct and broadcast a message object
   
    var data = new [msg.length];    // create an array the length of the message
    msg.open();
    data = [0x1f,2,3,4,5,6,7,10];
    var message = new Ant.Message();
    message.setPayload(data);       // Form the Message

    // Set the broadcast buffer
    msg.sendBroadcast(message);
}

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        
       //onMessage();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new PTCView() ];
        
    }
     function getRunnerID() as String{
        var runnerID = Properties.getValue("runnerID");
        return runnerID;
    }
    

}

function getApp() as PTCApp {
    return Application.getApp() as PTCApp;
   
}

