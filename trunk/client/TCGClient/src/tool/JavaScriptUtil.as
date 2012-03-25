//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {
    import flash.events.*;
    import flash.external.*;

    public class JavaScriptUtil {

        public static function get isAvailable():Boolean{
            return (ExternalInterface.available);
        }
        public static function getScreenData():String{
            if (isAvailable){
                return (ExternalInterface.call("function getScreenData(){return screen.width + '×' + screen.height;}"));
            };
            return ("unknow");
        }
        public static function getOsData():String{
            var _local1:RegExp;
            var _local2:Object;
            if (isAvailable){
                _local1 = new RegExp("(Windows NT [\\w.]+);", "i");
                _local2 = ((_local1.exec(browserAgent)) || ([]));
                return (((_local2[1]) || ("unknow")));
            };
            return ("unknow");
        }
        public static function getBrowserData():Object{
            var _local1:String;
            var _local2:RegExp;
            var _local3:RegExp;
            var _local4:RegExp;
            var _local5:RegExp;
            var _local6:RegExp;
            var _local7:Object;
            if (isAvailable){
                _local1 = browserAgent;
                _local2 = new RegExp("(Chrome)[ \\/]([\\w.]+)", "i");
                _local3 = new RegExp("(opera)(?:.*version)?[ \\/]([\\w.]+)", "i");
                _local4 = new RegExp("(msie) ([\\w.]+)", "i");
                _local5 = new RegExp("(mozilla)(?:.*? rv:([\\w.]+))?", "i");
                _local6 = new RegExp("(Safari)[ \\/]([\\w.]+)", "i");
                _local7 = ((((((((((_local2.exec(_local1)) || (_local3.exec(_local1)))) || (_local4.exec(_local1)))) || (_local5.exec(_local1)))) || (_local6.exec(_local1)))) || ([]));
                return ({
                    name:((_local7[1]) || ("unknow")),
                    version:((_local7[2]) || ("unknow"))
                });
            };
            return ({
                browser:"unknow",
                version:"unknow"
            });
        }
        public static function get browserAgent():String{
            return (ExternalInterface.call("function getScreenData(){return window.navigator.userAgent;}"));
        }

    }
}//package tool 
