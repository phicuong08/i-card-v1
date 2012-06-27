package {
    import flash.display.*;
	import flash.utils.*;
    import flash.text.*;
	import ICard.assist.view.interfaces.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;

    public class fightmovie extends MovieClip implements IFightMovie{
		private var _timerInterval:int = 100;
		private var _timerShowResult:Timer;
		private var _onClose:Function;
		private var _showCardArr:Array;
		private var _alphaInterval:Number;
		private var _curAlphaVal:Number;
		private var _alpha1:Number;
		private var _alpha2:Number;
    public function fightmovie(){
    	_showCardArr = new Array;
    	this._onClose = new Function();
			//var card1:Object= {realID:1,cardID:40001,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
//			var card2:Object={realID:2,cardID:40002,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
//			var card3:Object={realID:3,cardID:30001,hp:18,cost:32,turncost:12,atk:22,def:0,side:false,turn:false};
//			var card4:Object= {realID:1,cardID:40001,hp:16,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
//			var card5:Object={realID:2,cardID:40002,hp:18,cost:3,turncost:1,atk:4,def:0,side:false,turn:false};
//			var card6:Object={realID:3,cardID:30001,hp:18,cost:32,turncost:12,atk:22,def:1,side:false,turn:false};

			_timerShowResult = new Timer(_timerInterval, 0);
			
			//show(1,[card1,card2,card3],[card4,card5,card6],true);
			_timerShowResult.addEventListener(TimerEvent.TIMER, this.showResult);
		}
		public function initFade(a1:Number,a2:Number,secNum:int):void{
		  _alphaInterval = (a2-a1)/(Number)(secNum*1000/_timerInterval);
			this._timerShowResult.start();
			_curAlphaVal = a1;	
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
		}
		
		private function showResult(_arg1:TimerEvent):void{ //牌上的战斗结果渐变显示
				var bCompleted:Boolean = true;
				_curAlphaVal += _alphaInterval;
				for each(var obj:MovieClip in _showCardArr)
				{
					cardFactory.ResultAlphaInc(obj,_curAlphaVal);
				}
				if(_alphaInterval>0)
				 	bCompleted = (_curAlphaVal >= _alpha2)? true:false;
				if(_alphaInterval<0)
					bCompleted = (_curAlphaVal <= _alpha2)? true:false;
					
				if(bCompleted)
				{
					this._timerShowResult.stop();
					this._onClose();
				}
		}
		
	  public function get content():MovieClip{
       return (this);
    }
    
		private function GetCardObj(realID:int,Cards:Array):Object{
			if(Cards==null)
				return null;
			for each(var card:Object in Cards)
			{
				if(card["realID"]==realID)
					return card;
			}
			return null;
		}
		
		private function InitMCFade(mc:MovieClip,val:Number):void{
			mc.alpha =val;
			mc.fadeVal = 1;
		}
		
		private function CreateFightCard(realID:int,oldCards:Array,targets:Array):MovieClip{
			var oldCard:Object = GetCardObj(realID,oldCards);
			var newCard:Object = GetCardObj(realID,targets);
			if(oldCard==null)
				return null;
			var cardMC:MovieClip = cardFactory.CreateCard(oldCard);
			if( newCard==null)
				return cardMC;
				
			var resultMC:MovieClip;
			trace("hp new",newCard["hp"],"hp old",oldCard["hp"]);
			if( newCard["hp"]!= oldCard["hp"])
			{

					var hpVal:int = newCard["hp"] - oldCard["hp"];
					resultMC = (hpVal>0)?cardFactory.CreateGain_Big(Math.abs(hpVal)): cardFactory.CreateDebuf_Big(Math.abs(hpVal));
					//resultMC.x =resultMC.width/2;
					//resultMC.y =resultMC.height/2;
					resultMC.y = 20;
					InitMCFade(resultMC,_alpha1);
					cardMC.addChild(resultMC);
			}
			if( newCard["atk"]!= oldCard["atk"])
			{
					var atkVal:int = newCard["atk"] - oldCard["atk"];
					resultMC = (atkVal>0)?cardFactory.CreateGain_Mini(Math.abs(atkVal)): cardFactory.CreateDebuf_Mini(Math.abs(atkVal));
					//resultMC._scale=0.6;
					resultMC.x = -cardMC.width/2 + resultMC.width/2;
					resultMC.y = cardMC.height/2 - resultMC.height/2;
					InitMCFade(resultMC,_alpha1);
					cardMC.addChild(resultMC);			
			}
			if( newCard["def"]!= oldCard["def"])
			{
					var defVal:int = newCard["def"] - oldCard["def"];
					resultMC = (defVal>0)?cardFactory.CreateGain_Mini(Math.abs(defVal)): cardFactory.CreateDebuf_Mini(Math.abs(defVal));
					//resultMC._scale=0.6;
					resultMC.x = cardMC.width/2 - resultMC.width/2;
					resultMC.y = cardMC.height/2 - resultMC.height/2;
					InitMCFade(resultMC,_alpha1);
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
		
		public function set onClose(_arg1:Function):void{
            this._onClose = _arg1;
    }
    
    }
}//package 

