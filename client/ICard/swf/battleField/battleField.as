package {
    import flash.display.*;
	import SlotBar;
	import HeroBar;
	import flash.utils.Dictionary;
    import ICard.assist.view.interfaces.*;
	import ICard.assist.data.IBattleStage;
	import ICard.assist.view.controls.BattleFieldType;
    import flash.text.*;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;


    public class battleField extends MovieClip implements IBattleField{
		private var _slots:Array;
		private var _tip:ITip;
		private var _battleStage:IBattleStage;
		private var _myResNumMC:ResNumMC;
		private var _yourResNumMC:ResNumMC;
		public var _fight_but:SimpleButton;
		private var _timerMC:TimerMC;
		private var _targetCtl:TargetIndicator;
		public  var _secondTick:Timer; 
		//private var _timer_but2:MovieClip;
		
    public function battleField(){
			InitSlot();
			//RunTest();
			_timerMC = new TimerMC(_timer_but);
			_targetCtl = new TargetIndicator;
			_myResNumMC = new ResNumMC;
			_yourResNumMC = new ResNumMC;
			_myResNumMC.x = 850-_myResNumMC.width/2;
			_myResNumMC.y = 630;
			_yourResNumMC.x = 850 -_yourResNumMC.width/2;
			_yourResNumMC.y = 185;
			this.addChild(_myResNumMC);
			this.addChild(_yourResNumMC);
			_fight_but.visible=false;
			
			_secondTick = new Timer(500,0);
			_secondTick.addEventListener(TimerEvent.TIMER, onTick);
			_secondTick.start();
			
		}
		private function InitSlot():void{
			_slots  = [];
			
			
			_slots[BattleFieldType.HandSlotId] = new SlotBar;
			_slots[BattleFieldType.HandSlotId].Init(true,2,650,1180);
			
			_slots[BattleFieldType.ResourceSlotId] = new EmptyBar;
						
			_slots[BattleFieldType.EquipSlotId] = new EquipBar;
			_slots[BattleFieldType.EquipSlotId].Init(true,1198,535,1300);
			
			_slots[BattleFieldType.FightSlotId] = new SlotBar;
			_slots[BattleFieldType.FightSlotId].Init(true,2,350,1180);
			
			_slots[BattleFieldType.GraveSlotId] = new EmptyBar;
			_slots[BattleFieldType.GraveSlotId].Init(true,2,350,1180);
			
			_slots[BattleFieldType.HeroSlotId] = new HeroBar;
			_slots[BattleFieldType.HeroSlotId].Init(true,880,500,1180);
			
			_slots[BattleFieldType.SupportSlotId] = new SlotBar;
			_slots[BattleFieldType.SupportSlotId].Init(true,2,500,826);
			
			_slots[BattleFieldType.AttachSlotId] = new EmptyBar;
			
			
			
			_slots[BattleFieldType.HandSlotId+BattleFieldType.SlotNum] = new SlotBar;
			_slots[BattleFieldType.HandSlotId+BattleFieldType.SlotNum].Init(false,2,-100,1180);
						
			_slots[BattleFieldType.ResourceSlotId+BattleFieldType.SlotNum] = new EmptyBar;

			_slots[BattleFieldType.EquipSlotId+BattleFieldType.SlotNum] = new EquipBar;
			_slots[BattleFieldType.EquipSlotId+BattleFieldType.SlotNum].Init(false,2,500,856);
			
			_slots[BattleFieldType.FightSlotId+BattleFieldType.SlotNum] = new SlotBar;
			_slots[BattleFieldType.FightSlotId+BattleFieldType.SlotNum].Init(false,2,200,1180);
			
			_slots[BattleFieldType.GraveSlotId+BattleFieldType.SlotNum] = new EmptyBar;
			_slots[BattleFieldType.GraveSlotId+BattleFieldType.SlotNum].Init(false,2,350,1180);
			
			_slots[BattleFieldType.HeroSlotId+BattleFieldType.SlotNum] = new HeroBar;
			_slots[BattleFieldType.HeroSlotId+BattleFieldType.SlotNum].Init(false,880,50,1180);
		
			_slots[BattleFieldType.SupportSlotId+BattleFieldType.SlotNum] = new SlotBar;
			_slots[BattleFieldType.SupportSlotId+BattleFieldType.SlotNum].Init(false,2,50,826);
			
			_slots[BattleFieldType.AttachSlotId+BattleFieldType.SlotNum] = new EmptyBar;
			
			var id:int = BattleFieldType.HandSlotId;
			while(id <= BattleFieldType.SlotNum*2)
			{
				addChild(_slots[id]);
				id++;
			}
					
			
		}
	    public function get content():MovieClip{
            return (this);
        }
		private function freshResNum():void{
			
			var myRes:int = _battleStage.GetResNum(true);
			trace("fresh res my:",myRes);
			_myResNumMC.setVal(myRes);
			var yourRes:int  = _battleStage.GetResNum(false);
			_yourResNumMC.setVal(yourRes);
		}
		public function set onFight(_arg1:Function):void
		{
			_fight_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		
    public function FindCard(realID:int):MovieClip{
    	var id:int = BattleFieldType.HandSlotId;
    	var card:MovieClip;
			while(id <= BattleFieldType.SlotNum*2)
			{
				card = _slots[id].FindCard(realID);
				if(card)
						return card;
				id++;
			}	
			return null;
    }    
		public function SetMyHero(card:MovieClip):void{
			
		}
		
		public function Add2Slot(slotId:int,cardMC:MovieClip):void{
			if(cardMC==null)
				return;
			
			RemoveCard(cardMC.realID);
			_slots[slotId].AddCard(cardMC);
			freshResNum();
		}
		
		 public function RemoveCard(realID:int):void{
	    	var id:int = BattleFieldType.HandSlotId;
	    	var card:MovieClip;
				while(id <= BattleFieldType.SlotNum*2)
				{
					card = _slots[id].FindCard(realID);
					if(card)
					{
							_slots[id].RemoveCard(realID);
							break;
					}
					id++;
				}	
    }   
		public function onClickCard(realID:int):void{
			if(_targetCtl.IsTarget(realID)==false)
				return;
			_targetCtl.Empty();
			_battleStage.AddFightTarget(realID);
			_fight_but.visible=true;
		}
		public function onInitalFight(realID:int):void{
			_targetCtl.Empty();
			var srcCard:MovieClip = FindCard(realID);
			var targetArr:Array = _battleStage.FightTarget;
			FillTargetCtrl(targetArr);
		}
		private function FillTargetCtrl(targetArr:Array):void{
			if(targetArr==null)
				return;
			
			for each(var target:int in targetArr){
				var card:MovieClip = FindCard(target);
				_targetCtl.AddIndicator(card);
			}

		}
		public function PriFresh(myLoop:Boolean,secNum:int):void{
			_timerMC.InitTimeMC(secNum);
		}
		
    public function LoopFresh(myLoop:Boolean,secNum:int):void{
			_timerMC.InitTimeMC(secNum);
			_targetCtl.Empty();
		}
		public function onCardExOp(realID:int,abilityId:int):void{
			LoopFresh(true,30);
			_battleStage.InitialFight(realID);
			_targetCtl.Empty();
			var srcCard:MovieClip = FindCard(realID);
			_targetCtl.AddIndicator(srcCard);
			
			var targetArr:Array = _battleStage.getAbilityTarget(abilityId);
			FillTargetCtrl(targetArr);
			_fight_but.visible=true;
		}
		public function SideCard(info:Object):void{
		
			var id:int = BattleFieldType.HandSlotId;
			while(id <= BattleFieldType.SlotNum*2)
			{
				if(_slots[id].SideCard(info))
					return;
				id++;
			}	
			freshResNum();
		}
		public function set BattleStage(arg1:IBattleStage):void{
			_battleStage = arg1;
			_timerMC.Init(_battleStage);
			var id:int = BattleFieldType.HandSlotId;
			while(id <= BattleFieldType.SlotNum*2)
			{
				_slots[id].BattleStage = _battleStage;
				_slots[id].BattleField = this;
				id++;
			}
		}
		public function set tip(_arg1:ITip):void{
			_tip = _arg1;
		   
			var id:int = BattleFieldType.HandSlotId;
			while(id <= BattleFieldType.SlotNum*2)
			{
				_slots[id].tip = _tip;
				id++;
			}
		}
		
		public function onEndOpOk():void{
			_timerMC.onEndOpOk();
			_targetCtl.Empty();
			_fight_but.visible=false;
		}
		
		public function onTick(evt:TimerEvent):void{
			updateActiveCard();
      	}
		private function updateActiveCard():void{
			if(!_battleStage)
				return;
			DeactiveAllCard();
			var arr:Array = _battleStage.getActiveTarget();
			var cardArr:Array = [];
			for each(var target:int in arr){
				var card:MovieClip = FindCard(target);
				if(card!=null){
					card.cir.visible=true;
				}
			}
		}
		
		public function DeactiveAllCard():void{
    		var id:int = BattleFieldType.HandSlotId;
    		var card:MovieClip;
			while(id <= BattleFieldType.SlotNum*2)
			{
				_slots[id].DeactiveAllCard();
				id++;
			}	
    	}    
	
		public function RunTest():void{
			var index:int=1;
			var c1:MovieClip;
			while(index <2)
			{
				c1 = new c_20005;
				c1.stand ="normal";
				c1.realID = index;
				c1.tipInfo = "abc";
				Add2Slot(BattleFieldType.HeroSlotId,c1);
				index++;
			}
	//	RemoveCard(BattleFieldType.YouResourceSlotId,3);
			
			
			index = 1;
			
			
				
			//while(index <11)
//			{
//				c1 = new c_20005;
//				c1.realId = index;
//				Add2Slot(BattleFieldType.YouFightSlotId,c1);
//				index++;
//			}
//			index = 1;
//			while(index <11)
//			{
//				c1 = new c_20005;
//				c1.realId = index;
//				Add2Slot(BattleFieldType.MyResourceSlotId,c1);
//				index++;
//			}
			
			//_slots[BattleFieldType.MyFightSlotId].PrintChild();
			
		}
		
		
    }
}//package 
