//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {

    public class UrlTool {

        public static function getIp():String{
            if (TCGClient.getInstance().url.indexOf("59.57.253.168") != -1){
                return ("59.57.253.168");
            };
            if (TCGClient.getInstance().url.indexOf("180.186.33.252") != -1){
                return ("180.186.33.252");
            };
            if (TCGClient.getInstance().url.indexOf("lz.entplay.com") != -1){
                return ("lz.entplay.com");
            };
            if (TCGClient.getInstance().url.indexOf("218.104.139.194") != -1){
                return ("218.104.139.194");
            };
            return ("localhost");
        }

    }
}//package tool 
