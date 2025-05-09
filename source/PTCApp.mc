import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Ant;

class PTCApp extends Application.AppBase
{

    function initialize()
    {
        AppBase.initialize();
    }

    function onStart(state as Dictionary?) as Void
    {
    }

    function onStop(state as Dictionary?) as Void
    {
    }

    
    function getInitialView() as[Views] or [ Views, InputDelegates ]
    {
        return [new PTCView()];
    }

    function getRunnerID() as String
    {
        var runnerID = Properties.getValue("runnerID");
        return runnerID;
    }
}



class broadcastClass extends Ant.GenericChannel {
    using Toybox.Ant;
    using Toybox.Lang;
    using Toybox.System;
    // Step 1: Assign the channel
    function onMessage(msg)
    {
        
    }
    var channelType = Ant.CHANNEL_TYPE_SHARED_BIDIRECTIONAL_RECEIVE;
    var channelAssign = new Ant.ChannelAssignment(channelType, Ant.NETWORK_PUBLIC);
    var channelMethod = new Lang.Method(broadcastClass, :onMessage);
    function initialize(){
        GenericChannel.initialize(method(channelMethod), channelAssign);
    }
  public function broadcastID(){
    
   // GenericChannel.initialize(method(Lang.Method(:onMessage)),chanAssign); // No message handler for simplicity

    // Step 2: Configure the channel
    var deviceCfg = new Ant.DeviceConfig({
        :deviceNumber => 123,          // Device number
        :deviceType => 1,             // Device type
        :transmissionType => 0,       // Transmission type
        :messagePeriod => 32768,      // 1 Hz period
        :radioFrequency => 66         // Frequency
    });
    GenericChannel.setDeviceConfig(deviceCfg);

    // Step 3: Open the channel
    GenericChannel.open();

    // Step 4: Create and broadcast a message
    var message = new Ant.Message();
    var payload = [0x66, 2, 3, 4, 5, 6, 7, 8] as Array<Number>; // Example payload
    message.setPayload(payload);
    GenericChannel.sendBroadcast(message);

    // Print confirmation
    System.println("Message broadcasted successfully!");
    }
}

function getApp() as PTCApp
{
    return Application.getApp() as PTCApp;
}

