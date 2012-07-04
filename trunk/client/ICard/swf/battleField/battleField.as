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
		//private var _timer_but2:MovieClip;
		
    public function battleField(){
			InitSlot();
			//RunTest();
			_timerMC = new TimerMC(_timer_but);
			_targetCtl = new TargetIndicator(this);
			_myResNumMC = new ResNumMC;
			_yourResNumMC = new ResNumMC;
			_myResNumMC.x = 60-_myResNumMC.width/2;
			_myResNumMC.y = 575;
			_yourResNumMC.x = 60 -_yourResNumMC.width/2;
			_yourResNumMC.y = 130;
			this.addChild(_myResNumMC);
			this.addChild(_yourResNumMC);
		}
		private function InitSlot():void{
			_slots  = [];
			
			
			_slots[BattleFieldType.MyHandSlotId] = new SlotBar;
			_slots[BattleFieldType.MyHandSlotId].Init(BattleFieldType.MyHandSlotId,2,650,1180);
			
			
			_slots[BattleFieldType.MyResourceSlotId] = new ResourceBar;
			_slots[BattleFieldType.MyResourceSlotId].Init(BattleFieldType.MyResourceSlotId,2,500,826);
			
			_slots[BattleFieldType.MyEquipSlotId] = new EquipBar;
			_slots[BattleFieldType.MyEquipSlotId].Init(BattleFieldType.MyEquipSlotId,1198,535,1300);
			
			_slots[BattleFieldType.MyFightSlotId] = new SlotBar;
			_slots[BattleFieldType.MyFightSlotId].Init(BattleFieldType.MyFightSlotId,2,350,1180);
			
			_slots[BattleFieldType.MyTombSlotId] = new SlotBar;
			_slots[BattleFieldType.MyTombSlotId].Init(BattleFieldType.MyTombSlotId,2,350,1180);
			
			_slots[BattleFieldType.MyHeroSlotId] = new HeroBar;
			_slots[BattleFieldType.MyHeroSlotId].Init(BattleFieldType.MyHeroSlotId,880,500,1180);
			
			_slots[BattleFieldType.YouHandSlotId] = new SlotBar;
			_slots[BattleFieldType.YouHandSlotId].Init(BattleFieldType.YouHandSlotId,2,-100,1180);
			
			_slots[BattleFieldType.YouResourceSlotId] = new ResourceBar;
			_slots[BattleFieldType.YouResourceSlotId].Init(BattleFieldType.YouResourceSlotId,2,50,826);
			
			_slots[BattleFieldType.YouEquipSlotId] = new EquipBar;
			_slots[BattleFieldType.YouEquipSlotId].Init(BattleFieldType.YouEquipSlotId,2,500,856);
			
			_slots[BattleFieldType.YouFightSlotId] = new SlotBar;
			_slots[BattleFieldType.YouFightSlotId].Init(BattleFieldType.YouFightSlotId,2,350,1180);
			
			_slots[BattleFieldType.YouTombSlotId] = new SlotBar;
			_slots[BattleFieldType.YouTombSlotId].Init(BattleFieldType.YouTombSlotId,2,350,1180);
			
			_slots[BattleFieldType.YouHeroSlotId] = new HeroBar;
			_slots[BattleFieldType.YouHeroSlotId].Init(BattleFieldType.YouHeroSlotId,880,50,1180);
		
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
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
    	var id:int = BattleFieldType.MyHandSlotId;
    	var card:MovieClip;
			while(id <= BattleFieldType.YouHeroSlotId)
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
	    	var id:int = BattleFieldType.MyHandSlotId;
	    	var card:MovieClip;
				while(id <= BattleFieldType.YouHeroSlotId)
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
	}
	public function onInitalFight(realID:int):void{
		var targetArr:Array = _battleStage.FightTarget;
		if(targetArr==null)
			return;
		_targetCtl.Empty();
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
		public function SideCard(info:Object):void{
		
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
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
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
			{
				_slots[id].BattleStage = _battleStage;
				_slots[id].BattleField = this;
				id++;
			}
		}
		public function set tip(_arg1:ITip):void{
			_tip = _arg1;
		   
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
			{
				_slots[id].tip = _tip;
				id++;
			}
		}
		
		public function onEndOpOk():void{
			_timerMC.onEndOpOk();
			_targetCtl.Empty();
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
				Add2Slot(BattleFieldType.MyHeroSlotId,c1);
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
