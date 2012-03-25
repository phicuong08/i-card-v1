//Created by Action Script Viewer - http://www.buraks.com/asv
package task {
    import train_system.*;
    import combat_element_script.*;
    import item_system.*;

    public class TaskDescScript {

        public static function getTaskDescScript(_arg1:Object, _arg2:Boolean=false):Object{
            if (TaskDescScript[("script" + _arg1.id)]){
                return (TaskDescScript[("script" + _arg1.id)](_arg1, _arg2));
            };
            return (null);
        }
        private static function getBonusText(_arg1:Object):String{
            var _local3:String;
            var _local4:Object;
            if (!_arg1){
                return ("无奖励");
            };
            var _local2 = "";
            if (_arg1.item){
                for (_local3 in _arg1.item) {
                    _local4 = ItemCardLib.getItemInfoById(_local3);
                    _local2 = (_local2 + (((("道具#o【" + _local4.name) + "】#n × ") + _arg1.item[_local3]) + "<br>"));
                };
            };
            if (_arg1.money){
                _local2 = (_local2 + (("金币 × " + _arg1.money) + "<br>"));
            };
            if (_arg1.score){
                _local2 = (_local2 + (("积分 × " + _arg1.score) + "<br>"));
            };
            if (_arg1.exp){
                _local2 = (_local2 + (("经验 × " + _arg1.exp) + "<br>"));
            };
            if (_arg1.card){
                _local2 = (_local2 + "卡片：未知");
            };
            return (_local2);
        }
        private static function script100(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "救援";
            if (!_arg2){
                _local3["descText"] = "<p>皇甫嵩被黄巾军围困，前往救援并击退敌军。 </p><p>#o完成主线任务，有助于快速熟悉游戏，并获得丰厚奖励。#n</p>";
                _local3["targetText"] = (_arg1.guide1_complete) ? "#g● 完成战役：初战#n<br>" : "● 完成战役：初战<br>";
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide2_complete) ? "#g● 完成战役：坚守#n<br>" : "● 完成战役：坚守<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide3_complete) ? "#g● 完成战役：诡计#n" : "● 完成战役：诡计");
                _local3["bonusText"] = getBonusText(_arg1.bonus);
            };
            return (_local3);
        }
        private static function script110(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "追击";
            if (!_arg2){
                _local3["descText"] = "<p>黄巾军已经溃败，趁机率兵追击，将之歼灭。 </p><p>#o完成主线任务，有助于快速熟悉游戏，并获得丰厚奖励。#n</p>";
                _local3["targetText"] = (_arg1.guide_complete) ? "#g● 完成战役：追击#n" : "● 完成战役：追击";
                _local3["bonusText"] = getBonusText(_arg1.bonus);
            };
            return (_local3);
        }
        private static function script120(_arg1:Object, _arg2:Boolean):Object{
            var _local4:String;
            var _local5:String;
            var _local6:String;
            var _local7:int;
            var _local3:Object = new Object();
            _local3["name"] = "备战";
            if (!_arg2){
                _local4 = UserObject.camp;
                switch (_local4){
                    case "曹操":
                        _local5 = "● 获得武将卡【典韦】。";
                        _local6 = "● 获得武将卡【李典】。";
                        _local7 = 10;
                        break;
                    case "刘备":
                        _local5 = "● 获得计策卡【青龙偃月刀】。";
                        _local6 = "● 获得计策卡【丈八蛇矛】。";
                        _local7 = 30;
                        break;
                    case "孙权":
                        _local5 = "● 获得计策卡【长江】。";
                        _local6 = "● 获得计策卡【战船修补】。";
                        _local7 = 20;
                        break;
                };
                _local3["descText"] = "<p>黄巾之乱平定后，军阀割据严重。为在将来的战斗中取得优势，商店中有我军需要加强的战备。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (((_arg1.buy_card1) && (_arg1.set_card1))) ? (("#g" + _local5) + "#n<br>") : (_local5 + "<br>");
                _local3["targetText"] = (_local3["targetText"] + (((_arg1.buy_card2) && (_arg1.set_card2))) ? (("#g" + _local6) + "#n<br>") : (_local6 + "<br>"));
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script130(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "讨伐董卓";
            if (!_arg2){
                _local3["descText"] = "<p>董卓占据了京城，祸乱朝政。形势危急，应当会合十八路诸侯，将之剿灭！<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide_complete) ? "#g● 完成战役：长安攻坚战#n<br>" : "● 完成战役：长安攻坚战<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script140(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "不打不相识";
            if (!_arg2){
                _local3["descText"] = "<p>卡牌的乐趣在于与其他玩家对战。可以通过对战了解更多的个性化战术，还可以因此结交朋友。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.complete_flag) ? "#g● 参加对战并取得3场胜利（3/3）#n<br>" : (("● 参加对战并取得3场胜利（" + _arg1.pvp_num) + "/3）<br>");
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script150(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "天涯若比邻";
            if (!_arg2){
                _local3["descText"] = "<p>将牌友添加到#o“好友列表”#n中，这样可以方便聊天，并可以收到对方上线的提示。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.complete_flag) ? "#g● 新添加3个好友（3/3）#n<br>" : (("● 新添加3个好友（" + _arg1.friends_num) + "/3）<br>");
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script160(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "整肃军容";
            if (!_arg2){
                _local3["descText"] = "<p>正式比赛要求卡组卡片数量#o40#n张以上。为参加正式比赛，需要组建符合要求的卡组。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.complete_flag) ? "#g● 组一套含40张以上卡片的卡组。#n<br>" : "● 组一套含40张以上卡片的卡组<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script170(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "初出茅庐";
            if (!_arg2){
                _local3["descText"] = "<p>经过了长时间的磨练，现在是检验战术的时候了。<br>进入对战大厅的#g正式区#n，在藏龙卧虎的沙场上建立自己的威信。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.complete_flag) ? "#g● 在正式区取得3场对战胜利（3/3）#n<br>" : (("● 在正式区取得3场对战胜利（" + _arg1.win_num) + "/3）<br>");
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script180(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "主线任务第一章完结";
            if (!_arg2){
                _local3["descText"] = "<p>主线任务第一章完结，敬请期待后续。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = "<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + "");
            };
            return (_local3);
        }
        private static function script1000(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "救援皇甫嵩";
            if (!_arg2){
                _local3["descText"] = "<p>皇甫嵩被黄巾军围困，前往救援并击退敌军。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide1_complete) ? "#g● 完成战役：初战#n<br>" : "● 完成战役：初战<br>";
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide2_complete) ? "#g● 完成战役：围困#n<br>" : "● 完成战役：围困<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide3_complete) ? "#g● 完成战役：坚守#n<br>" : "● 完成战役：坚守<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide4_complete) ? "#g● 完成战役：补给#n<br>" : "● 完成战役：补给<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide5_complete) ? "#g● 完成战役：埋伏#n<br>" : "● 完成战役：埋伏<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide6_complete) ? "#g● 完成战役：克敌#n<br>" : "● 完成战役：克敌<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.guide7_complete) ? "#g● 完成战役：决战#n<br>" : "● 完成战役：决战<br>");
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script101(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·初战";
            if (!_arg2){
                _local3["descText"] = "<p>救援皇甫嵩的路上遇到黄巾兵，请击退黄巾兵。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide1_complete) ? "#g● 完成战役：初战#n<br>" : "● 完成战役：初战<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script102(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·围困";
            if (!_arg2){
                _local3["descText"] = "<p>黄巾兵又变多了，请击退黄巾兵增援皇甫嵩。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide2_complete) ? "#g● 完成战役：围困#n<br>" : "● 完成战役：围困<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script103(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·坚守";
            if (!_arg2){
                _local3["descText"] = "<p>皇甫嵩被黄巾军围困，坚守城池，等待援军的到来。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide3_complete) ? "#g● 完成战役：坚守#n<br>" : "● 完成战役：坚守<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script104(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·备战";
            if (!_arg2){
                _local3["descText"] = "<p>到商店购买卡片【伤兵医疗】，并加入卡组。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (((_arg1.buy_card) && (_arg1.set_card))) ? "#g● 获得计策卡：伤兵医疗#n<br>" : "● 获得计策卡：伤兵医疗<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script105(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·补给";
            if (!_arg2){
                _local3["descText"] = "<p>使用【伤兵医疗】救治皇甫嵩的士兵。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide4_complete) ? "#g● 完成战役：补给#n<br>" : "● 完成战役：补给<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script106(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·埋伏";
            if (!_arg2){
                _local3["descText"] = "<p>帮助皇甫嵩抵挡黄巾军的新一轮进攻。<br></p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide5_complete) ? "#g● 完成战役：埋伏#n<br>" : "● 完成战役：埋伏<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script107(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·克敌";
            if (!_arg2){
                _local3["descText"] = "<p>张角带领黄巾兵前来鏖战，帮助皇甫嵩击败张角。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide6_complete) ? "#g● 完成战役：克敌#n<br>" : "● 完成战役：克敌<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script108(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "新手指引·决战";
            if (!_arg2){
                _local3["descText"] = "<p>黄巾军已经溃败，趁机率兵追击，将之歼灭。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.guide7_complete) ? "#g● 完成战役：决战#n<br>" : "● 完成战役：决战<br>";
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script10001(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "日常·新手对决";
            if (!_arg2){
                _local3["descText"] = "<p>卡牌的乐趣在于与其他玩家对战。可以通过对战了解更多的个性化战术，还可以因此结交朋友。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.complete_flag) ? "#g● 在新手区对战胜利（3/3）#n<br>" : (("● 在新手区对战胜利（" + _arg1.win_num) + "/3）<br>");
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script10002(_arg1:Object, _arg2:Boolean):Object{
            var _local3:Object = new Object();
            _local3["name"] = "日常·正式对决";
            if (!_arg2){
                _local3["descText"] = "<p>卡牌的乐趣在于与其他玩家对战。可以通过对战了解更多的个性化战术，还可以因此结交朋友。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.complete_flag) ? "#g● 在正式区对战胜利（3/3）#n<br>" : (("● 在正式区对战胜利（" + _arg1.win_num) + "/3）<br>");
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }
        private static function script10003(_arg1:Object, _arg2:Boolean):Object{
            var _local4:String;
            var _local5:String;
            var _local6:String;
            var _local3:Object = new Object();
            _local3["name"] = "日常·训练";
            if (!_arg2){
                _local4 = TrainSystem.getInstance().getTrainName(_arg1.train1);
                _local5 = TrainSystem.getInstance().getTrainName(_arg1.train2);
                _local6 = TrainSystem.getInstance().getTrainName(_arg1.train3);
                _local3["descText"] = "<p>训练中有着各式各样的战术可供学习与探索。<br> </p>";
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务目标#n </p><br>");
                _local3["targetText"] = (_arg1.train1_complete) ? ((("#g● 完成训练：#n" + "#g") + _local4) + "#n<br>") : (("● 完成训练：" + _local4) + "<br>");
                _local3["targetText"] = (_local3["targetText"] + (_arg1.train2_complete) ? ((("#g● 完成训练：#n" + "#g") + _local5) + "#n<br>") : (("● 完成训练：" + _local5) + "<br>"));
                _local3["targetText"] = (_local3["targetText"] + (_arg1.train3_complete) ? ((("#g● 完成训练：#n" + "#g") + _local6) + "#n<br>") : (("● 完成训练：" + _local6) + "<br>"));
                _local3["descText"] = (_local3["descText"] + _local3["targetText"]);
                _local3["descText"] = (_local3["descText"] + "<p align='center'>#y任务奖励#n </p><br>");
                _local3["descText"] = (_local3["descText"] + getBonusText(_arg1.bonus));
            };
            return (_local3);
        }

    }
}//package task 
