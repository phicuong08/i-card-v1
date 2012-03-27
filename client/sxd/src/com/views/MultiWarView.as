//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class MultiWarView extends WarView implements IView {

        public function MultiWarView():void{
            _type = WarType.MultiWar;
        }
        override public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            isLastMonster = false;
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(MultiWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            this.loadData();
        }
        override protected function loadData():void{
            opened = true;
            _data.call(Mod_MultipleMission_Base.get_war_result, this.loadResources, []);
        }
        override protected function loadResources():void{
            var lr:* = null;
            if (_view.hasResource("MultiWar")){
                this.loadRoleResource();
            } else {
                lr = new LoadResponder(this.loadRoleResource, function (_arg1:String, _arg2:int):void{
                    _view.showLoading(MultiWarViewLang.LoadInfo, _arg2);
                });
                _view.loadResources(["MultiWar"], lr);
            };
        }
        override protected function loadRoleResource():void{
            super.loadRoleResource();
        }
        override protected function extractRoleData():Array{
            var _local1:Array = [];
            var _local2:Array = [];
            var _local3:MultiWarData = _ctrl.multiMission.multiWarData;
            var _local4:Array = this.getOriginSigns(_local1, _local2, _local3.attackerInfo, false);
            var _local5:Array = this.getOriginSigns(_local1, _local2, _local3.defenderInfo, true);
            extractStuntData(_local1, _local2, _local4, false);
            extractStuntData(_local1, _local2, _local5, true);
            addonRole(_local1, _local2);
            var _local6:int = _ctrl.multiMission.multiWarData.multipleMissionId;
            var _local7:String = (URI.mapUrl + "multi_mission/");
            _local1.push("WarIcon");
            _local2.push(((_local7 + _local6) + ".png"));
            _local1.push("Background");
            _local2.push(((_local7 + _local6) + ".swf"));
            return ([_local1, _local2]);
        }
        protected function getOriginSigns(_arg1:Array, _arg2:Array, _arg3:Array, _arg4:Boolean):Array{
            var _local7:Object;
            var _local8:String;
            var _local9:String;
            var _local10:Object;
            var _local11:String;
            var _local12:String;
            var _local5:Array = [];
            var _local6:int;
            while (_local6 < _arg3.length) {
                _local7 = _arg3[_local6]["roleList"];
                _local8 = _arg3[_local6]["mainRoleSign"];
                _local9 = _arg3[_local6]["mainRoleSuffix"];
                for each (_local10 in _local7) {
                    _local11 = _local10["sign"];
                    _local12 = (_arg4) ? MonsterType.sameResource(_local11) : _local11;
                    if (_arg1.indexOf(_local12) == -1){
                        if (_local12 == _local8){
                            _local12 = (_local12 + _local9);
                        };
                        _local12 = (_local12 + WarType.getMiniSuffix(_type));
                        if (_arg1.indexOf(_local12) == -1){
                            _arg1.push(_local12);
                            _arg2.push(((URI.warRolesUrl + _local12) + ".swf"));
                        };
                    };
                    if (_local5.indexOf(_local11) == -1){
                        _local5.push(_local11);
                    };
                };
                _local6++;
            };
            return (_local5);
        }
        override protected function render():void{
            super.render();
        }
        override protected function createTarget():void{
            _war = (_view.getAssetsObject("MultiWar", "MultiWar") as IMultiWar);
            (_war as IMultiWar).multiWarData = _ctrl.multiMission.multiWarData;
        }
        override protected function onCloseHandler(_arg1:Boolean):void{
            var _local2:int;
            var _local3:MultiWarData;
            var _local4:int;
            var _local5:int;
            var _local6:Object;
            var _local7:String;
            _view.hideLoading();
            if (WarType.MultiWar == _type){
                _local2 = _ctrl.multiMission.multiWarData.multipleTeamId;
                _data.call(Mod_MultipleMission_Base.leave_multiple_mission_war, new Function(), [_local2]);
                _local3 = _ctrl.multiMission.multiWarData;
                _local4 = _local3.awardItems.length;
                _local5 = 0;
                while (_local5 < _local4) {
                    _local6 = _local3.awardItems[_local5];
                    _local7 = Lang.sprintf(MultiWarViewLang.Get, _local6.name, _local6.count);
                    _view.chat.addSystemMessage(_local7);
                    _local5++;
                };
            };
            clearRoles();
            super.onCloseHandler(_arg1);
        }
        override protected function loadStudyStunt(_arg1:Function):void{
            var _local6:String;
            _arg1();
        }
        override public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                super.reposition(false);
            };
        }

    }
}//package com.views 
