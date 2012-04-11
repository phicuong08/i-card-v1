//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import flash.display.*;
    
  
    public class ScreenView extends Base implements IView {

        private var _screen:Sprite;
  
        public function ScreenView(){
            this._screen = new Sprite();
            super();
        }
        public function show():void{
            this.render();
        }
        private function render():void{
            _viewMgr.structure.content.addChild(this._screen);
            _viewMgr.toolbar.init();
            this._screen.addChild(_viewMgr.toolbar.content);
           
            //_viewMgr.setting.loadInitSound();
            // _view.activities.show();
        }
        public function close():void{
        }
        public function clear():void{
        }
        public function get display():Sprite{
            return (this._screen);
        }
     }
}//package com.views 
