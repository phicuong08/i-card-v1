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
		private var _alpha1:Number;
		private var _alpha2:Number;
		private var _secNum:int;
		public function InitFade(a1:Number,a2:Number,secNum:int):void{
			_alpha1 = a1;
			_alpha2 = a2;
			_secNum = secNum;
		}
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
			_fightmovie = (_viewMgr.getAssetsObject("fightmovie", "fightmovie") as IFightMovie);
			
			this.render();
		}
		private function render():void{
			if(this._fightmovie){
				_fightmovie.onClose = this.close;
				//_popup.addView(this, this._fightmovie.content);
				_viewMgr.stage.addChild(this._fightmovie.content);
				//_viewMgr.center(sign, this._fightmovie.content);
				_fightmovie.show(_srcCard,_targets,_oldCards,_bEnemy);
				_fightmovie.initFade(_alpha1,_alpha2,_secNum);
				reposition();
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
			_local2 = Structure.stageWidth;
			_local3 = Structure.stageHeight;
			this._fightmovie.content.x = 300;// ((_local2 - this._fightmovie.content.width) / 2);
			this._fightmovie.content.y = 300;//((_local3 - this._fightmovie.content.height) / 2);
			_structure.reposition();
		}
	}
}//package com.views 
