//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class GetPeachWarView extends SportWarView {

        public var warData:WarData;

        public function GetPeachWarView():void{
            _type = WarType.GetPeachWar;
            isBoss = true;
        }
        public function set requested(_arg1:Boolean):void{
            _requested = _arg1;
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(GetPeachWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            loadResources();
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.mapUrl + "get_peach/get_peach.png"));
            _arg1.push("Background");
            _arg2.push((URI.mapUrl + "get_peach/get_peach.swf"));
        }
        override protected function createTarget():void{
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.background = background;
            if (_ctrl.getPeach.warExp > 0){
                _war.sportAwardText = (GetPeachWarViewLang.Exp + HtmlText.green(("+" + _ctrl.getPeach.warExp)));
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
