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

    public class CardTypeSign extends SmoothBitmapImage {

        public static var bu:Class = CardTypeSign_bu;
        public static var equip:Class = CardTypeSign_equip;
        public static var forever:Class = CardTypeSign_forever;
        public static var land:Class = CardTypeSign_land;
        public static var qi:Class = CardTypeSign_qi;
        public static var shui:Class = CardTypeSign_shui;

        public function CardTypeSign(){
            this.width = 36;
            this.height = 36;
        }
        public function set cardType(_arg1:String):void{
            source = CardTypeSign[_arg1];
        }

    }
}//package card_ui 
