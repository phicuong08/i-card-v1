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
		private var _state:int;
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
			switch(_state){
				case 1:   //battle
					break;
				case 2:  //train
					break;
				case 3:  //VS
					_viewMgr.roomList.onExitCmd();
					break;
				case 4:  //Race
					break;
				case 5:
					break;//Card
				case 6:  //Shop
					
					break;
			}
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
			_state = 1;
		}
		private function onTrain(e:MouseEvent):void{
			_state = 2;
		}
		private function onVS(e:MouseEvent):void{
			_state =3;
			_viewMgr.roomList.show();
		}
		private function onRace(e:MouseEvent):void{
			_state = 4;
		}
		private function onCard(e:MouseEvent):void{
			_state = 5;
		}
		private function onShop(e:MouseEvent):void{
			_state = 6;
		}
		
		public function close():void{
		}
		public function clear():void{
		}
		
	}
}//package com.views 
