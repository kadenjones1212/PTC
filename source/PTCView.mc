import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.Ant;
import Toybox.System;

using Toybox.Ant;
// Wrap the message prep and broadcast in a callback method
function onMessage(msg) {
   
    var data = new [msg.length];    // create an array the length of the message
    msg.open();
    // Iterate and add data to the Message with each pass
    for (var i = 0; i < msg.length; i++) {
        data[i] = i;            // Adds {0,1,2,3,4,5,6,7}
    }

    var message = new Ant.Message();
    message.setPayload(data);       // Form the Message

    // Set the broadcast buffer
    msg.sendBroadcast(message);
}

class PTCView extends WatchUi.SimpleDataField
{

    // Set the label of the data field here.
    function initialize()
    {
        SimpleDataField.initialize();
        label = "PortaTrack ID";
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null
    {
        // See Activity.Info in the documentation for available information.
        return getApp().getRunnerID();
    }
}
 