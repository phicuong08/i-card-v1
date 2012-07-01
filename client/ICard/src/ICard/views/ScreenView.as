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
           
            _viewMgr.toolbar.init();
//            this._screen.addChild(_viewMgr.toolbar.content);
//			_screen.x = (Structure.stageWidth - _screen.width)/2;
//			_screen.y = (Structure.stageHeight -_screen.height)/2;
//			_viewMgr.structure.content.addChild(this._screen);
			
			
			_viewMgr.toolbar.content.x = (Structure.stageWidth - _viewMgr.toolbar.content.width)/2;
			_viewMgr.toolbar.content.y = (Structure.stageHeight - _viewMgr.toolbar.content.height)*0.5;
			
			_viewMgr.structure.content.addChild(_viewMgr.toolbar.content);
			//_viewMgr.stage.addChild(_viewMgr.toolbar.content);
			
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
