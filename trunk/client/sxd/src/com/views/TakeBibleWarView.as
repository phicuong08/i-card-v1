//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class TakeBibleWarView extends SportWarView {

        public var awardFame:int;
        public var awardCoin:int;
        public var warData:WarData;
        public var reportId:int;
        public var detail:Object;

        public function TakeBibleWarView():void{
            _type = WarType.TakeBibleWar;
        }
        override public function show():void{
            super.show();
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(TakeBibleWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            _popup.addMask();
            loadResources();
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            _warData.reportId = this.reportId;
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.mapUrl + "take_bible/war_icon.png"));
            _arg1.push("Background");
            _arg2.push((URI.mapUrl + "take_bible/1.swf"));
        }
        override protected function createTarget():void{
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.playerId = _ctrl.player.playerId;
            _war.sportDetailData = this.detail;
            _war.onSportDetailLink = _view.toolbar.onTextLink;
            if (((this.awardCoin) || (this.awardFame))){
                _war.sportAwardText = Lang.sprintf(TakeBibleWarViewLang.Award, (("<font color=\"#00ff00\">" + this.awardCoin) + "</font>"), (("<font color=\"#00ff00\">" + this.awardFame) + "</font>"));
            };
        }
        private function onSportDetailLink(_arg1:TextEvent):void{
        }

    }
}//package com.views 
