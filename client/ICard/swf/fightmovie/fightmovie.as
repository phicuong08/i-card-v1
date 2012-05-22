package {
    import flash.display.*;
	import flash.utils.*;
    import flash.text.*;
	import ICard.assist.view.interfaces.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;

    public class fightmovie extends MovieClip implements IFightMovie{
		
		private var _timerShowResult:Timer;
		private var _showCardArr:Array;
    public function fightmovie(){
    	_showCardArr = new Array;
			var card1:Object= {realID:1,cardID:40001,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			var card2:Object={realID:2,cardID:40002,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			var card3:Object={realID:3,cardID:30001,hp:18,cost:32,turncost:12,atk:22,def:0,side:false,turn:false};
			var card4:Object= {realID:1,cardID:40001,hp:16,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			var card5:Object={realID:2,cardID:40002,hp:18,cost:3,turncost:1,atk:4,def:0,side:false,turn:false};
			var card6:Object={realID:3,cardID:30001,hp:18,cost:32,turncost:12,atk:22,def:1,side:false,turn:false};

			_timerShowResult = new Timer(100, 0);
			
			show(1,[card1,card2,card3],[card4,card5,card6],true);
			_timerShowResult.addEventListener(TimerEvent.TIMER, this.showResult);
		}
		public function show(srcID:int,targets:Array,oldCards:Array,bEnemy:Boolean):void{
			AddObject(CreateFightCard(srcID,oldCards,targets));
			var fightIcon:MovieClip = cardFactory.CreateFightIcon(bEnemy);
			AddObject(fightIcon);
			for each(var target:Object in targets)
			{
				if(target["realID"]!=srcID)
				{
					AddObject(CreateFightCard(target["realID"],oldCards,targets));
				}
			}
			this._timerShowResult.start();			
		}
		private function showResult(_arg1:TimerEvent):void{ //牌上的战斗结果渐变显示
				var bCompleted:Boolean = true;
				for each(var obj:MovieClip in _showCardArr)
				{
					if(cardFactory.ResultAlphaInc(obj))
						bCompleted=false;
				}
				if(bCompleted)
					this._timerShowResult.stop();
		}
	  public function get content():MovieClip{
       return (this);
    }
		private function GetCardObj(realID:int,Cards:Array):Object{
			for each(var card:Object in Cards)
			{
				if(card["realID"]==realID)
					return card;
			}
			return null;
		}
		private function CreateFightCard(realID:int,oldCards:Array,targets:Array):MovieClip{
			var oldCard:Object = GetCardObj(realID,oldCards);
			var newCard:Object = GetCardObj(realID,targets);
			if(oldCard==null)
				return null;
			var cardMC:MovieClip = cardFactory.CreateCard(oldCard);
			var resultMC:MovieClip;
			trace("hp new",newCard["hp"],"hp old",oldCard["hp"]);
			if( newCard["hp"]!= oldCard["hp"])
			{

					var hpVal:int = newCard["hp"] - oldCard["hp"];
					resultMC = (hpVal>0)?cardFactory.CreateGain(Math.abs(hpVal)): cardFactory.CreateDebuf(Math.abs(hpVal));
					resultMC.x =resultMC.width/2;
					resultMC.y =resultMC.height/2;
					cardMC.addChild(resultMC);
			}
			if( newCard["atk"]!= oldCard["atk"])
			{
					var atkVal:int = newCard["atk"] - oldCard["atk"];
					resultMC = (atkVal>0)?cardFactory.CreateGain(Math.abs(atkVal)): cardFactory.CreateDebuf(Math.abs(atkVal));
					//resultMC._scale=0.6;
					resultMC.x = -cardMC.height/2 + resultMC.width/2;
					resultMC.y = cardMC.height/2 + resultMC.height/2;
					cardMC.addChild(resultMC);			
			}
			if( newCard["def"]!= oldCard["def"])
			{
					var defVal:int = newCard["def"] - oldCard["def"];
					resultMC = (defVal>0)?cardFactory.CreateGain(Math.abs(defVal)): cardFactory.CreateDebuf(Math.abs(defVal));
					//resultMC._scale=0.6;
					resultMC.x = -cardMC.height/2 + resultMC.width/2;
					resultMC.y = cardMC.height/2 + resultMC.height/2;
					cardMC.addChild(resultMC);			
			}
			return cardMC;
		}
		public function AddObject(obj:MovieClip):void{
			if(!obj)
				return;
			this.addChild(obj);
			_showCardArr.push(obj);
			UpdatePos();
		}
		
		private function UpdatePos():void{
			var totalWidth:Number = 0;
			for each(var obj:MovieClip in _showCardArr)
			{
				obj.x = obj.width/2 + totalWidth;
				totalWidth = totalWidth + obj.width + 10;
				obj.y = 0;
			}
		}
		
    }
}//package 
