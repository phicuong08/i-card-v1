package {

    public class ChatLimit {

        private static var shieldChat:Array = ["①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩", "㈠", "㈡", "㈢", "㈣", "㈤", "㈥", "㈦", "㈧", "㈨", "㈩", "⑴", "⑵", "⑶", "⑷", "⑸", "⑹", "⑺", "⑻", "⑽", "⑼", "⒇", "⒆", "⒅", "⒄", "⒃", "⒂", "⒁", "⒀", "⑿", "⑾", "⒈", "⒒", "⒔", "⒓", "⒉", "⒊", "⒋", "⒕", "⒖", "⒌", "⒍", "⒗", "⒘", "⒎", "⒏", "⒙", "⒚", "⒐", "⒑", "⒛", "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖", "拾", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "１", "２", "３", "４", "５", "６", "７", "８", "９", "０", "❶", "❷", "❸,", "❹", "❺", "❻", "❼", "❽", "❾", "⒈", "⒉", "⒊", "⒋", "⒍", "⒌", "⒎", "⒏", "⒐"];

        public static function isSendTrue(_arg1:Object, _arg2:int, _arg3:int):Boolean{
            var _local10:int;
            var _local4:String = _arg1.message;
            var _local5:int = _local4.length;
            var _local6:int;
            var _local7:Array = shieldChat;
            var _local8:int = _local7.length;
            var _local9:int;
            while (_local9 < _local5) {
                _local10 = 0;
                while (_local10 < _local8) {
                    if (_local4.charAt(_local9) == _local7[_local10]){
                        _local6++;
                        if (_local6 >= _arg3){
                            return (false);
                        };
                    };
                    _local10++;
                };
                _local9++;
            };
            return (true);
        }
        public static function wordsLimit(_arg1:Object):Boolean{
            var _local6:String;
            var _local2:String = _arg1.message;
            var _local3:int = _local2.length;
            var _local4:String = "";
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = _local2.charAt(_local5);
                if (((!((_local6 == " "))) && (!((_local6 == "　"))))){
                    _local4 = (_local4 + _local6);
                };
                _local5++;
            };
            return (/壹|贰|叁|肆|伍|陆|柒|捌|玖|拾|佰|仟|①|②|③|④|⑤|⑥|⑦|⑧|⑨|⑩|㈠|㈡|㈢|㈣|㈤|㈥|㈦|㈧|㈨|㈩|⑴|⑵|⑶|⑷|⑸|⑹|⑺|⑻|⑼|⑽|叄|泗|汣|氿|叭|扒|妧|貦|萬|贎|莞|圆|圜|賲|宝|寳|圜寳|窷|聨|聫|聯|芫|架q|扣扣|蔻蔻|参参|送万寿无疆|\+飞仙|\+VIP满级|飞仙\+VIP|万寿无疆\+|\+万寿无疆|飞仙\+|送飞仙|送VIP|送vip|q:|送紫色装备|霖|億|蔻|疆|源|飛|q\+/i.test(_local4));
        }

    }
}//package 
