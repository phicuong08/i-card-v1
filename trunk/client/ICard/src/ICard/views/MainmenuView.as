//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
    
    import com.smartfoxserver.v2.core.SFSEvent;
    
    import flash.events.MouseEvent;
    import flash.net.*;
    public class MainmenuView extends Base implements IView {

		private var _mainmenu:IMainMenu;
		public function show():void{
			loadAssets("mainmenu", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			this._mainmenu = (_viewMgr.getAssetsObject("mainmenu", "mainmenu") as IMainMenu);
			this._mainmenu.onExit = this.onExit;
			this._mainmenu.onSet = this.onSet;
			this._mainmenu.onGold = this.onGold;
			this._mainmenu.onFriend = this.onFriend;
			this._mainmenu.onTask = this.onTask;
			this._mainmenu.onPack = this.onPack;
			this._mainmenu.onGuy = this.onGuy;
			this._mainmenu.onBattle = this.onBattle;
			this._mainmenu.onTrain = this.onTrain;
			this._mainmenu.onVS = this.onVS;
			this._mainmenu.onRace = this.onRace;
			this._mainmenu.onCard = this.onCard;
			this._mainmenu.onShop = this.onShop;
			this.render();
		}
		
		private function render():void{
			if(this._mainmenu){
				_popup.addView(this, this._mainmenu.content);
			}
		}
	
		private function onExit(e:MouseEvent):void{
			
			if(_popup.CloseTop()==false)
				this._mainmenu.ShowMainBut(true);
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
		private function onBattle(e:MouseEvent):void{
			this._mainmenu.ShowMainBut(false);
		}
		private function onTrain(e:MouseEvent):void{
			this._mainmenu.ShowMainBut(false);

		}
		private function onVS(e:MouseEvent):void{
			this._mainmenu.ShowMainBut(false);
			_viewMgr.roomList.show();
		}
		private function onRace(e:MouseEvent):void{
			this._mainmenu.ShowMainBut(false);
		}
		private function onCard(e:MouseEvent):void{
			this._mainmenu.ShowMainBut(false);
		}
		private function onShop(e:MouseEvent):void{
			this._mainmenu.ShowMainBut(false);
		}
		
		public function close():void{
		}
		public function clear():void{
		}
		
	}
}//package com.views 
