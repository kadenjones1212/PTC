import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.System;



class PTCView extends WatchUi.SimpleDataField
{


    function initialize()
    {
        SimpleDataField.initialize();
        label = "PortaTrack ID";
    }

public var broadcaster = new broadcastClass();
    function compute(info as Activity.Info) as Numeric or Duration or String or Null
    {
       
        // See Activity.Info in the documentation for available information.
        broadcaster.broadcastID();
        return getApp().getRunnerID();
         
    }
}
     
// 