//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.info.*;
    import com.haloer.data.*;
    import com.lang.client.com.datas.*;
    
    import flash.utils.*;

    public class WorldBossData extends Base {

        public var result:int = 0;
        public var warStatus:int;
        public var warData:Array;
        public var awards:Array;
        public var combatBuff:int = 0;
        public var bossList:Array;
        public var nowBoss:BossInfo;
        public var notifyBoss:BossInfo;
        private var week:Array;

        public function WorldBossData():void{
            this.bossList = [];
            this.week = [WorldBossMapDataLang.Week7, WorldBossMapDataLang.Week1, WorldBossMapDataLang.Week2, WorldBossMapDataLang.Week3, WorldBossMapDataLang.Week4, WorldBossMapDataLang.Week5, WorldBossMapDataLang.Week6, WorldBossMapDataLang.Week7];
            super();
            this.bossList[BossInfo.BossQingTianMu] = new BossInfo(MonsterType.BossQingTianMu);
            this.bossList[BossInfo.BossChiYanShou] = new BossInfo(MonsterType.BossChiYanShou);
            this.bossList[BossInfo.BossDaoBaTu] = new BossInfo(MonsterType.BossDaoBaTu);
        }
        public function get_world_boss_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:BossInfo;
            for each (_local2 in _arg1[0]) {
                _local3 = this.bossList[_local2[0]];
                oObject.list(_local2, _local3, ["bossId", "mapId", "lv", "state", "canSet"]);
                _local3.htmlName = (("<b>" + HtmlText.format(Lang.sprintf(WorldBossMapDataLang.Lv, _local3.name, _local3.lv), HtmlText.Orange, 14)) + "</b>");
                if (_local3.bossId == BossInfo.BossDaoBaTu){
                    if (_local3.state == 5){
                        _local3.infoMsg = WorldBossMapDataLang.BossWarTwo;
                    } else {
                        _local3.infoMsg = Lang.sprintf(WorldBossMapDataLang.BossWarTime, this.getDateMsg((_local2[5] * 1000), _local2[7]));
                    };
                } else {
                    _local3.auto = _local2[8];
                    _local3.infoMsg = HtmlText.white(Lang.sprintf(WorldBossMapDataLang.BossWarTime2, this.timeFormat(_local2[5])));
                    _local3.infoMsg = ((_local3.infoMsg + "\n") + HtmlText.format(Lang.sprintf(WorldBossMapDataLang.BossKillAdd, _local3.name), 10315052));
                    _local3.robotTip = WorldBossMapDataLang.RobotTip;
                    if (_local2[9] != 0){
                        _local3.robotTip = ((_local3.robotTip + "\n") + Lang.sprintf(WorldBossMapDataLang.RobotTip2, HtmlText.yellow2((_local2[9] + WorldBossMapDataLang.Coin)), HtmlText.yellow2((_local2[10] + WorldBossMapDataLang.Fame))));
                    };
                    _local3.robotTip = HtmlText.white(_local3.robotTip);
                };
            };
        }
        private function getDateMsg(_arg1:Number, _arg2:int=0):String{
            var _local3:String = "";
            if (_arg2 == 1){
                _local3 = WorldBossMapDataLang.WeekNext;
            } else {
                if (_arg2 == 0){
                    _local3 = WorldBossMapDataLang.WeekNow;
                };
            };
            var _local4:Date = new Date();
            _local4.setTime(_arg1);
			return "";
            //return ((((((_local3 + this.week[_local4.day]) + " ") + ((_local4.hours)<10) ? ("0" + _local4.hours) : _local4.hours) + ":") + ((_local4.minutes)<10) ? ("0" + _local4.minutes) : _local4.minutes.toString());
        }
        public function timeFormat(_arg1:int):String{
            if (_arg1 <= 0){
                return ("00:00");
            };
            var _local2:int = (_arg1 / 60);
            _arg1 = (_arg1 % 60);
            var _local3:int = (_local2 / 60);
            _local2 = (_local2 % 60);
            return (((((_local3)>9) ? _local3.toString() : ("0" + _local3) + ":") + ((_local2)>9) ? _local2.toString() : ("0" + _local2)));
        }
        public function get_world_boss_data(_arg1:Array):void{
            var _local2:BossInfo = this.bossList[_arg1[0]];
            oObject.list(_arg1, _local2, ["bossId", "id", "state", "mapId", "x", "y", "time", "lv", "life", "lifeMax"]);
            _local2.time = (getTimer() + (_local2.time * 1000));
        }
        public function get_defeat_record_list(_arg1:Array):void{
            if (this.nowBoss == null){
                return;
            };
            this.nowBoss.updateRankList(_arg1[1]);
        }
        public function clear_death_cd(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function reset_death_cd(_arg1:Array):void{
            this.player_death_cd([0, _data.player.playerId, _arg1[0]]);
        }
        public function fight_world_boss(_arg1:Array):void{
            this.warStatus = _arg1[1];
            this.warData = _arg1[2];
            this.awards = _arg1[3];
            this.combatBuff = _arg1[4];
        }
        public function super_reborn(_arg1:Array):void{
            this.result = _arg1[1];
        }
        public function strengthen_combat(_arg1:Array):void{
            this.result = _arg1[2];
        }
        public function call_world_boss(_arg1:Array):void{
            this.result = _arg1[0];
        }
        public function hurt_world_boss(_arg1:Array):void{
            var _local2:BossInfo = this.bossList[_arg1[0]];
            _local2.updateBossHurt(_arg1[1], _arg1[2]);
        }
        public function close_world_boss(_arg1:Array):void{
            this.notifyBoss = this.bossList[_arg1[0]];
            this.notifyBoss.lifeMax = _arg1[2];
            this.notifyBoss.updateCloseTip(_arg1[3]);
        }
        public function open_world_boss(_arg1:Array):void{
            this.notifyBoss = this.bossList[_arg1[0]];
            this.notifyBoss.updateOpenTip(_arg1[2]);
            this.notifyBoss.resetCount = 5;
        }
        public function defeat_world_boss(_arg1:Array):void{
            this.notifyBoss = this.bossList[_arg1[0]];
            this.notifyBoss.lifeMax = _arg1[5];
            this.notifyBoss.lv = _arg1[2];
            this.notifyBoss.updateKillTip(_arg1[6], _arg1[3], _arg1[4]);
        }
        public function player_death_cd(_arg1:Array):void{
            if (this.nowBoss == null){
                return;
            };
            var _local2:Object = {};
            _local2.id = _arg1[1];
            _local2.time = _arg1[2];
            if (_local2.time > 0){
                _local2.time = ((getTimer() + 500) + (_local2.time * 1000));
            };
            this.nowBoss.fuhuoList.push(_local2);
        }
        public function update_world_boss_position(_arg1:Array):void{
            if (this.nowBoss == null){
                return;
            };
            this.nowBoss.x = _arg1[0];
            this.nowBoss.y = _arg1[1];
        }
        public function player_world_boss_buff(_arg1:Array):void{
            var _local2:BossInfo = this.bossList[_arg1[0]];
            _local2.guwu = _arg1[1];
            _local2.resetCount = _arg1[2];
        }
        public function select_faction_boss_time(_arg1:Array):void{
            this.result = _arg1[2];
            if (this.result != -1){
                this.notifyBoss = this.bossList[_arg1[0]];
                this.notifyBoss.chatTips = Lang.sprintf(WorldBossMapDataLang.SetOpenTime, HtmlText.yellow2(this.getDateMsg((this.result * 1000))));
            };
        }
        public function faction_boss_time_list(_arg1:Array):void{
            var _local3:Object;
            var _local4:Array;
            this.notifyBoss = this.bossList[_arg1[0]];
            this.notifyBoss.setList = [];
            var _local2:String = ((_arg1[1])==1) ? WorldBossMapDataLang.WeekNext : WorldBossMapDataLang.WeekNow;
            for each (_local4 in _arg1[2]) {
                _local3 = {};
                this.notifyBoss.setList.push(_local3);
                _local3.type_id = _local4[0];
                _local3.selected = _local4[1];
                _local3.expired = _local4[3];
                _local3.see = _local2;
                _local3.msg = ((this.getDateMsg((_local4[2] * 1000), 3) + " ") + WorldBossMapDataLang.Open);
            };
        }
        public function set_robot(_arg1:Array):void{
            this.result = _arg1[0];
        }

    }
}//package com.datas 
