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
		
		public function show(srcID:int,targets:Array):void{
			_srcCard =srcID;
			_targets = targets;
			loadAssets("fightmovie", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			this._fightmovie = (_viewMgr.getAssetsObject("fightmovie", "fightmovie") as IFightMovie);
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
