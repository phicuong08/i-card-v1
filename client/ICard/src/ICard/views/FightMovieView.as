//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    
    import flash.events.MouseEvent;

    public class FightMovieView extends Base implements IView {
		private var _fightmovie:IFightMovie;
		private var _srcCard:int;
		private var _targets:Array;
		private var _oldCards:Array;
		private var _bEnemy:Boolean;
		public function InitShow(srcID:int,targets:Array,oldCards:Array,bEnemy:Boolean):void{
			_srcCard =srcID;
			_targets = targets;
			_oldCards = oldCards;
			_bEnemy = bEnemy;
			loadAssets("fightmovie", this.loadCallback, "");
		}
		public function show():void{
			loadAssets("fightmovie", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
//			_viewMgr.addToPositionList(sign, this.reposition);
			this._fightmovie = (_viewMgr.getAssetsObject("fightmovie", "fightmovie") as IFightMovie);
//			this._fightmovie.show(_srcCard,_targets,_oldCards,_bEnemy);
			this.render();
		}
		private function render():void{
			if(this._fightmovie){
				_popup.addView(this, this._fightmovie.content);
				_viewMgr.center(sign, this._fightmovie.content);
			}
		}
	
		public function close():void{
				_popup.closeView(this);
		}
		public function clear():void{
		}
		public function reposition(_arg1:Boolean=true):void{
			var _local2:int;
			var _local3:int;
			if (inStage == false){
				return;
			};
			if (true == _arg1){
				//				_viewMgr.toolbar.reposition();
			} else {
				_local2 = Structure.stageWidth;
				_local3 = Structure.stageHeight;
//				this._il.content.x = ((_local2 - this._il.content.width) / 2);
//				this._il.content.y = ((_local3 - this._il.content.height) / 2);
			};
			_structure.reposition();
		}
	}
}//package com.views 
