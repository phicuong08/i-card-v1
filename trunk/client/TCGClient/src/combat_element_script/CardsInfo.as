//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;
    import file_read.*;

    public class CardsInfo {

        private static var cardCsv:Class = CardsInfo_cardCsv;
        protected static var allCardsInfo:Object;

        public static function getAllCardsInfo():Object{
            return (allCardsInfo);
        }
        public static function buildCardsInfo():void{
            var _local1:Csv = new Csv();
            debugWindow.myTrace("开始读取 card.csv 文件\n");
            _local1.addEventListener(Event.COMPLETE, cardsLoadComplete);
            if (TCGClient.isDebugMode){
                _local1.loadURL("../src/source/etc/card.csv");
            } else {
                _local1.loadLocalFile(cardCsv);
            };
        }
        public static function cardsLoadComplete(_arg1:Event):void{
            var _local3:Object;
            var _local2:Csv = (_arg1.currentTarget as Csv);
            _local2.removeEventListener(Event.COMPLETE, cardsLoadComplete);
            allCardsInfo = new Object();
            for each (_local3 in _local2.getData()) {
                setColorIndexForRange(_local3);
                _local3.image = _local3.id;
                _local3.use_level = int(_local3.use_level);
                allCardsInfo[_local3["id"]] = _local3;
            };
            debugWindow.myTrace("card.csv 表载入成功!");
        }
        public static function addAttribById(_arg1:Object):void{
            var _local2:String;
            if (_arg1["id"] == "0"){
                return;
            };
            for (_local2 in allCardsInfo[_arg1.id]) {
                _arg1[_local2] = allCardsInfo[_arg1.id][_local2];
            };
        }
        private static function setColorIndexForRange(_arg1:Object):void{
            switch (_arg1.color){
                case "gold":
                    _arg1.color_range_index = 1;
                    break;
                case "silver":
                    _arg1.color_range_index = 2;
                    break;
                case "green":
                    _arg1.color_range_index = 3;
                    break;
                default:
                    _arg1.color_range_index = 4;
            };
        }
        public static function getCardTooltip(_arg1):String{
            if ((_arg1 is String)){
                _arg1 = allCardsInfo[_arg1];
            };
            if (!_arg1.name){
                throw (new Error("生成卡片 tooltip 文本异常!"));
            };
            var _local2:String = ("【" + _arg1.name);
            if (_arg1["agname"] != ""){
                _local2 = (_local2 + ("·" + _arg1["agname"]));
            };
            _local2 = (_local2 + "】#n<br>");
            _local2 = (_local2 + (_arg1["use_level"]) ? (("#d使用等级：" + _arg1["use_level"]) + "#n<br>") : "");
            if (_arg1["color"] == "gold"){
                _local2 = ("#o" + _local2);
                _local2 = (_local2 + ((((((("#o" + _arg1["star"]) + "星金卡#n<br>") + "#g武：") + _arg1["str"]) + " 智：") + _arg1["int"]) + "#n<br>"));
            } else {
                if (_arg1["color"] == "silver"){
                    _local2 = ("#w" + _local2);
                    _local2 = (_local2 + ((((((("#w" + _arg1["star"]) + "星银卡#n<br>") + "#g武：") + _arg1["str"]) + " 智：") + _arg1["int"]) + "#n<br>"));
                } else {
                    if (_arg1["color"] == "red"){
                        _local2 = ("#r" + _local2);
                        _local2 = (_local2 + "#r陷阱卡#n<br>");
                    } else {
                        _local2 = ("#g" + _local2);
                        _local2 = (_local2 + "#g计策卡#n<br>");
                    };
                };
            };
            _local2 = (_local2 + ((("#o" + _arg1["info"]) + _arg1["skill_info"]) + "#n"));
            return (_local2);
        }
        public static function getRareColor(_arg1):uint{
            if ((_arg1 is String)){
                _arg1 = allCardsInfo[_arg1];
            };
            var _local2:int = int(_arg1["rare_level"]);
            switch (_local2){
                case 4:
                    return (15104776);
                case 3:
                    return (10946786);
                case 2:
                    return (2970353);
                default:
                    return (0xFFFFFF);
            };
        }

    }
}//package combat_element_script 
