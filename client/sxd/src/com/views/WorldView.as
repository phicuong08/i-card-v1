//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.assist.view.map.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class WorldView extends Base implements IView {

        private var _world:IWorld;
        private var _autoList:Array;
        private var _frameSprite:IWorldFrame;
        private var _travelEventInfo:Object;
        public var endTownId:int = 0;

        public function WorldView(){
            this._autoList = [];
            super();
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            _view.closeEvent();
            _view.screen.stopPlayerRun();
            loadAssets("World", this.render, WorldViewLang.LoadAssets);
        }
        private function render():void{
            var item:* = null;
            var sign:* = null;
            this._world = (_view.getAssetsObject("World", "World") as IWorld);
            _popup.addView(this, this._world.content);
            this._world.tip = _view.tip.iTip;
            this._world.alert = _view.alert.iAlert;
            this._world.logoVisible = (((URI.isBaidu == false)) && ((URI.isMangguo == false)));
            var townId:* = _ctrl.player.mapId;
            if (TownType.isTownById(townId) == false){
                if (_ctrl.player.townMapId){
                    townId = _ctrl.player.townMapId;
                } else {
                    townId = TownType.getId(TownType.XiaoYuCun);
                };
            };
            var townSign:* = TownType.getSign(townId);
            this._world.defaultTown = townSign;
            this._world.townInfo = TownType.getOpenedTownInfo();
            var towns:* = TownType.getOpenedTownSigns(TownType.AllTown);
            if (towns.indexOf(townSign) == -1){
                towns.push(townSign);
            };
            for each (item in this._autoList) {
                if (towns.indexOf(item) == -1){
                    towns.push(item);
                };
            };
            this._world.townOpened = towns;
            this._world.townAllowed = towns;
            this._world.onArrive = function (_arg1:String):void{
                close();
                _autoList = [];
                endTownId = TownType.getId(_arg1);
                _view.townMap.gotoTownAtId(endTownId);
            };
            this._world.onTownClick = function ():void{
                _view.quest.haltWayFinding();
            };
            this._world.onClose = function ():void{
                close();
            };
            sign = (_ctrl.player.playerInfo.sign + _ctrl.player.playerInfo.signSuffix);
            if (this._frameSprite == null){
                this._frameSprite = (MapStatic.mapInstance as IMapInstance).worldFrame;
                this._frameSprite.playerInfo = _ctrl.player.playerInfo;
            };
            this._world.playerPosition(sign, this._frameSprite);
            if (this._autoList.length > 1){
                this._world.autoTown(this._autoList);
            };
            this.reposition();
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._world.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function autoEnterTown(_arg1:int, _arg2:int):void{
            var _local3:String = TownType.getSign(_arg1);
            var _local4:String = TownType.getSign(_arg2);
            this._autoList = [_local3, _local4];
            this.show();
        }
        public function close():void{
            this.clear();
            if (this._world != null){
                this._world.close();
            };
            _popup.closeView(this);
            _view.openEvent();
        }
        public function clear():void{
            if (_view.travelEvent.inStage){
                _view.travelEvent.close();
            };
        }

    }
}//package com.views 
