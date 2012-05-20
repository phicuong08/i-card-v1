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
			this._fightmovie = (_viewMgr.getAssetsObject("fightmovie", "fightmovie") as IFightMovie);
			this._fightmovie.show(_srcCard,_targets,_oldCards,_bEnemy);
			this.render();
		}
		private function render():void{
			if(this._fightmovie){
				_popup.addView(this, this._fightmovie.content);
			}
		}
	
		public function close():void{
				_popup.closeView(this);
		}
		public function clear():void{
		}
		
	}
}//package com.views 
