//Created by Action Script Viewer - http://www.buraks.com/asv
package card_ui {
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CardCountrySign extends SmoothBitmapImage {

        public static var dongzhuo:Class = CardCountrySign_dongzhuo;
        public static var han:Class = CardCountrySign_han;
        public static var lvbu:Class = CardCountrySign_lvbu;
        public static var yuanshao:Class = CardCountrySign_yuanshao;
        public static var caowei:Class = CardCountrySign_caowei;
        public static var shuhan:Class = CardCountrySign_shuhan;
        public static var sunwu:Class = CardCountrySign_sunwu;

        public function CardCountrySign(){
            this.width = 32;
            this.height = 40;
        }
        public function set country(_arg1:String):void{
            source = CardCountrySign[_arg1];
        }

    }
}//package card_ui 
