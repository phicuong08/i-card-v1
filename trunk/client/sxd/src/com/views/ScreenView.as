//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import com.views.map.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.view.map.*;

    public class ScreenView extends Base implements IView {

        private var _screen:Sprite;
        private var _currentMap:MapViewBase;

        public function ScreenView(){
            this._screen = new Sprite();
            super();
        }
        public function show():void{
            this.render();
        }
        private function render():void{
            _view.structure.content.addChild(this._screen);
            _view.toolbar.init();
            this._screen.addChild(_view.toolbar.content);
            this.initMap();
            if (_ctrl.player.bossMapId != 0){
                _view.worldBossMap.gotoBossTown(_ctrl.player.bossMapId);
            } else {
                _view.townMap.gotoTownAtId(((_ctrl.player.jihuisuoId) || (_ctrl.player.townMapId)));
            };
            _view.setting.loadInitSound();
            _view.chooseCamp.loginToChoose();
            _view.activities.show();
        }
        public function close():void{
        }
        public function clear():void{
        }
        public function get display():Sprite{
            return (this._screen);
        }
        public function stopPlayerRun():void{
            if (this._currentMap){
                this._currentMap.stopPlayerRun();
            };
        }
        public function set currentMap(_arg1:MapViewBase):void{
            if (this._currentMap){
                this._currentMap.clear();
            };
            this._currentMap = _arg1;
            this._screen.addChildAt(this._currentMap.content, 0);
        }
        public function get currentMap():MapViewBase{
            return (this._currentMap);
        }
        private function initMap():void{
            MapStatic.mapInstance = (_view.getAssetsObj("Map").loader.content as IMapInstance);
            _view.townMap.init();
            _view.missionMap.init();
            _view.worldBossMap.init();
            _view.factionWarMap.init();
        }

    }
}//package com.views 
