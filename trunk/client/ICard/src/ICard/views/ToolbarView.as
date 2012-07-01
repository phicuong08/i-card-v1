//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
	import ICard.assist.view.controls.*;
	
    import com.smartfoxserver.v2.core.SFSEvent;
    
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.utils.*;
    import flash.events.MouseEvent;
    import flash.net.*;
    public class ToolbarView extends Base implements IView {

		private var _toolbar:IToolbar;
		private function loadCallback():void
		{
			this._toolbar = (_viewMgr.getAssetsObject("toolbar", "toolbar") as IToolbar);
			this._toolbar.onExit = this.onExit;
			this._toolbar.onSet = this.onSet;
			this._toolbar.onGold = this.onGold;
			this._toolbar.onFriend = this.onFriend;
			this._toolbar.onTask = this.onTask;
			this._toolbar.onPack = this.onPack;
			this._toolbar.onGuy = this.onGuy;
		
			this.render();
		}
		
		public function get content():Sprite{
			return (this._toolbar.content);
		}
		override public function get inStage():Boolean{
			return (((this._toolbar) && (this._toolbar.content.parent)));
		}
		public function init():void{
			this._toolbar = (_viewMgr.getAssetsObject("toolbar", "toolbar") as IToolbar);
			this._toolbar.tip = _viewMgr.tip.iTip;
			
			this._toolbar.init();
			this._toolbar.onExit = this.onExit;
			this._toolbar.onFriend = this.onFriend;
			this._toolbar.onGold = this.onGold;
			this._toolbar.onGuy = this.onGuy;
			this._toolbar.onPack = this.onPack;
			this._toolbar.onSet = this.onSet;
			this._toolbar.onTask = this.onTask;
//			this.playerData();
//			this.buffInfo();
//			this.functionLink();
//			this.activityInfo();
//			this.initMiniMap();
//			this.questTrace();
//			this.chat();
//			this.functionBar();
//			this.keepAlive();
//			this.friend();
			
			_viewMgr.addToPositionList(sign, this.reposition);
			//_view.whatsNew.show();
//			this.load_effect_circle();
//			this.loadFunctionBarEffect();
//			_view.addToFrameProcessList("ToolbarUpdateMouseCursor", this.updateMouseCursor);
		}
		
		private function render():void{
			if(this._toolbar){
				_popup.addView(this, this._toolbar.content);
			}
		}
	
		private function onExit(e:MouseEvent):void{
				_popup.popAndShow();
		}
		private function onSet(e:MouseEvent):void{
		}
		private function onGold(e:MouseEvent):void{
		}
		private function onFriend(e:MouseEvent):void{
		}
		private function onTask(e:MouseEvent):void{
		}
		private function onPack(e:MouseEvent):void{
		}
		private function onGuy(e:MouseEvent):void{
		}
		
		public function show():void{
			this._toolbar.content.visible = true;
		}
		public function hide():void{
			this._toolbar.content.visible = false;
		}
		public function close():void{
			this.clear();
			if (this._toolbar.content.parent){
				this._toolbar.content.parent.removeChild(this._toolbar.content);
			};
		}
		public function clear():void{
		}
		
		public function reposition():void{
			if (this.inStage == true){
			//	_viewMgr.center(sign, this._toolbar.content);
				//this._toolbar.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
			};
			Tip.offset = Structure.stageOffset;
			_structure.reposition();
			_viewMgr.reposition();
		
		}
		
	}
}//package com.views 
