//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class ZodiacWarView extends SportWarView {

        public var warData:WarData;

        public function ZodiacWarView():void{
            _type = WarType.ZodiacWar;
        }
        override public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            super.show();
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(ZodiacWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            loadResources();
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.mapUrl + "zodiac/zodiac.png"));
            _arg1.push("Background");
            _arg2.push((URI.mapUrl + "zodiac/zodiac.swf"));
        }
        override protected function createTarget():void{
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.background = background;
            if (((_ctrl.zodiac.awardGoldOilName) || (_ctrl.zodiac.awardAura))){
                _war.sportAwardText = Lang.sprintf(ZodiacWarViewLang.Award, (_ctrl.zodiac.awardGoldOilName) ? HtmlText.yellow2((_ctrl.zodiac.awardGoldOilName + "+1")) : "", (_ctrl.zodiac.awardAura) ? (ZodiacWarViewLang.Aura + HtmlText.green(("+" + _ctrl.zodiac.awardAura))) : "");
            };
        }
        override protected function onCloseHandler(_arg1:Boolean):void{
            clearRoles();
            closeWar();
            if ((onClose is Function)){
                onClose(_arg1);
            };
        }

    }
}//package com.views 
