package 
{
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * 半圆形运动效果类
	 * @author Tiger 1748055943@qq.com
	 * 2010-11-18 10:24
	 */
	public class CircleMove extends Sprite
	{
		
		private var mRadius:Number;				//半径
		private var iconCount:int;				//显示数量
		private var leftOrRight:int;			//朝向(-1,1);
		private var mFp		:uint = 30;			//帧频
		private var centerX:Number = 400;
		private var centerY:Number = 300;		//圆心

		private var speed:Number = 0;			//旋转累积速度
		private var step:int;					//旋转步长
		private var basicStep:int = 5;			//基础旋转步长
		private var showStep:int;				//出现步长
		private var mDisAngle:int;				//间距角度
		private var mTotalAngle:int;			//可视元件的总角度
		private var outTime:Number = .2;		//出现消失时间(s)
		
		
		private var isMove:Boolean;				//一次旋转的结束
		private var isHide:Boolean;				//一个元件的隐藏
		private var curtOutID:int;				//当前移出舞台的元件
		
		private var mcAry:Array;				//保存元件
		private var mPosAry:Array;				//保存默认位置
		private var totalMove:int;				//一次移动角度
		private var borderAngle0:Number;			//下边界角度
		private var borderAngle1:Number;			//上边界角度
		private var startNum:int;				//起始编号
		
		private var startPosInfor:String;		//开始位置信息
		private var endPosInfor:String;			//结束位置信息
		
		private var isAllShow:Boolean;			//是否完全显示
		private var isBtnUp:Boolean;			//按钮是否谈起;
		private var btnDownKind:int;			//按下的按钮时哪一个
		private var isHasTest:Boolean;			//是否增加了自动检测侦听
		
		private var btnUp:CircleBtn;
		private var btnDown:CircleBtn;
		//************test show hide*************
		private var testShow:Boolean = false;
		private var btnNone:CircleBtn;				//按钮
		
		/** 
		 * @param	r		半径
		 * @param	amount	可显示数量
		 * @param	angle	间距角度
		 * @param	west	朝向左边 
		 * PS:参数都有，功能应该也都有，没有严格测试过，如果想反方向用自己多测试和调整:D
		 */
		public function CircleMove(r:uint = 200, amount:uint = 5, angle:Number = 25,west:Boolean = true)
		{
			mRadius = r;
			iconCount = amount;
			mDirection = west;
			mDisAngle = angle;
			addObjectInit();
		}
		
		private function addObjectInit():void
		{
			mcAry = new Array();
			mPosAry = new Array();
			startNum = 0;
			isAllShow = false;
			isMove = false;
			isHide = true;
			curtOutID = -1;
			isBtnUp = true;
			isHasTest = false;
			btnDownKind = -1;
			startPosInfor = "";
			endPosInfor = "";
			mTotalAngle = 0;
			centerX = 800 - mRadius - 20;
			
			btnUp = this["mcUp"];
			btnDown = this["mcDown"];
			btnNone = this["mcNone"];
			
			btnEvent();
			checkBtn(startNum);
		}
		
		/** 
		 * @param	displayObjList 可视化对象列表 */
		public function created(displayObjList:Array):void
		{
			mcAry = displayObjList;
			var len:int = displayObjList.length;
			if (len <= iconCount)
			{
				//少于显示数量
				mTotalAngle = (len - 1) * mDisAngle;
				checkBtn( -100);
			}
			else
			{
				//多于显示数量
				mTotalAngle = (iconCount - 1) * mDisAngle;
			}
			makeSlidePos(mTotalAngle);
			initPosHide(mcAry, mTotalAngle);
		}
		
		//出现
		public function show():void
		{
			this.addEventListener(Event.ENTER_FRAME, showMove);
		}
		
		//消失
		public function close():void
		{
			this.addEventListener(Event.ENTER_FRAME, hideMove);
		}
		
		/*
		 * 按钮事件
		 */
		private function btnEvent():void
		{
			btnUp.addEventListener("btnMouse", btnHandler);
			btnDown.addEventListener("btnMouse", btnHandler);
			btnNone.addEventListener("btnMouse", closeItem);
			btnNone.isStateBtn = true;
			btnNone.isOpen = false;
			hideUpDownBtn(false);
		}
		private function hideUpDownBtn(b:Boolean):void
		{
			btnUp.visible = b;
			btnDown.visible = b;
		}
		
		private function btnHandler(e:DataEvent):void 
		{
			var midNum:int = int(e.data);
			
			if (midNum == 0)
			{
				if (!isAllShow)
				{
					return;
				}
				
				if (!isMove && isHide)
				{
					isBtnUp = false;
					if (e.target == btnUp)
					{
						btnDownKind = 0;
						moveBegin(true);
					}
					else if (e.target == btnDown)
					{
						btnDownKind = 1;
						moveBegin(false);
					}
				}
			}
			else if(midNum == 1)
			{
				isBtnUp = true;
				btnDownKind = -1;
			}
		}
		
		private function closeItem(e:DataEvent):void
		{
			var midNum:int = int(e.data);
			if (midNum == 0)
			{
				testShow = !testShow;
				hideUpDownBtn(testShow);
				btnNone.isOpen = testShow;
				dispatchEvent(new DataEvent("OpenState", false, false, testShow?"1":"0"));
				if (testShow)
				{
					show();
				}
				else
				{
					close();
				}
			}
		}
		//点击上下按钮开始
		private function moveBegin(b:Boolean):void
		{
			if (b)
			{
				step = basicStep;
			}
			else
			{
				step = -basicStep;
			}
			totalMove = mDisAngle;
			moveStart();
		}
		//运动开始
		private function moveStart():void
		{
			isHide = false;
			isMove = true;
			curtOutID = -1;
			this.addEventListener(Event.ENTER_FRAME, moveItem);
		}
		//运动停止
		private function moveStop():void
		{
			isMove = false;
			this.removeEventListener(Event.ENTER_FRAME, moveItem);
			speed = 0;
			if (!isBtnUp)
			{
				if (isHasTest) return;
				autoTest(true);
			}
			else
			{
				if (!isHasTest) return;
				autoTest(false);
			}
			
		}
		//检测是否按下按钮不放
		private function autoTest(b:Boolean):void
		{
			if (b)
			{
				isHasTest = true;
				this.addEventListener(Event.ENTER_FRAME, testAutoRun);
			}
			else
			{
				if (!isHasTest) return;
				isHasTest = false;
				this.removeEventListener(Event.ENTER_FRAME, testAutoRun);
			}
		}
		//自动运行
		private function testAutoRun(e:Event):void
		{
			if (btnDownKind == -1 || isBtnUp) return;
			var midB:Boolean = (btnDownKind == 0?btnUp.cBtnUseable:btnDown.cBtnUseable);
			if (!midB)
			{
				isBtnUp = true;
				return;
			}
			if (!isMove && isHide)
			{
				moveBegin(!Boolean(btnDownKind));
			}
		}
		//对象旋转
		private function moveItem(e:Event):void
		{
			for (var i:int = startNum; i < iconCount + startNum; i++)
			{
				var mc:mm = mm(mcAry[i]);
				var mAngle:Number = Number(mPosAry[i - startNum].split("*")[2]);
				
				mc.Angle = mAngle + speed ;
				mc.x = centerX + leftOrRight * cosD(mc.Angle) * mRadius;
				mc.y = centerY + leftOrRight * sinD(mc.Angle) * mRadius;
				mc.rotation = mc.Angle;
				if (mc.rotation > borderAngle0 || mc.rotation < borderAngle1)
				{
					if (curtOutID != mc.mID)
					{
						curtOutID = mc.mID;
						hideMc(mc);
					}
					
				}
			}
			speed += step;
			if (Math.abs(speed) >= totalMove)
			{
				moveStop();
			}
		}
		
		//出现动画
		private function showMove(e:Event):void 
		{
			var alphaStep:Number = 1 / (mFp * outTime);
			for (var i:int = startNum; i < iconCount + startNum; i++)
			{
				var mc:mm = mm(mcAry[i]);
				mc.visible = true;
				mc.Angle += Number(mPosAry[i - startNum].split("*")[3]);
				mc.x = centerX + leftOrRight * cosD(mc.Angle) * mRadius;
				mc.y = centerY + leftOrRight * sinD(mc.Angle) * mRadius;
				mc.rotation = mc.Angle;
				mc.alpha += alphaStep;
				//trace(i + " alpha:" + mc.alpha + " anglestep:" + Number(mPosAry[i - startNum].split("*")[3]));
				if (mcAry[startNum].alpha >= 1)
				{
					this.removeEventListener(Event.ENTER_FRAME, showMove);
					initPosShow(mcAry, mTotalAngle);
					isAllShow = true;
				}
			}
		}
		//消失动画
		private function hideMove(e:Event):void
		{
			var alphaStep:Number = 1 / (mFp * outTime);
			for (var i:int = startNum; i < iconCount + startNum; i++)
			{
				var mc:mm = mm(mcAry[i]);
				mc.Angle += -Number(mPosAry[i - startNum].split("*")[3]);
				mc.x = centerX + leftOrRight * cosD(mc.Angle) * mRadius;
				mc.y = centerY + leftOrRight * sinD(mc.Angle) * mRadius;
				mc.rotation = mc.Angle;
				mc.alpha -= alphaStep;
				if (mcAry[startNum].alpha < .1)
				{
					this.removeEventListener(Event.ENTER_FRAME, hideMove);
					initPosHide(mcAry, mTotalAngle);
					isAllShow = false;
				}
			}
		}
		//初始化位置(hide)
		private function initPosHide(objAry:Array,totalAngle:int):void
		{
			var len:int = objAry.length;
			for (var i:int = startNum; i < len; i++)
			{
				var midAry:Array = mPosAry[2].split("*");
				objAry[i].x = Number(midAry[0]);
				objAry[i].y = Number(midAry[1]);
				objAry[i].Angle = 0;
				objAry[i].rotation = 0;
				objAry[i].alpha = 0;
				objAry[i].visible = false;
			}
		}
		//初始化位置(show)
		private function initPosShow(objAry:Array,totalAngle:int):void
		{
			var len:int = objAry.length;
			for (var i:int = startNum; i < iconCount + startNum; i++)
			{
				var midAry:Array = mPosAry[i - startNum].split("*");
				objAry[i].visible = true;
				objAry[i].x = Number(midAry[0]);
				objAry[i].y = Number(midAry[1]);
				objAry[i].rotation = Number(midAry[2]);
				objAry[i].alpha = 1;
			}
		}
		
		//计算圆弧上的位置(坐标，旋转角度)
		private function makeSlidePos(angleNum:int):Array
		{
			var num:int = angleNum / mDisAngle + 1;
			var stat:Number = -angleNum / 2;
			borderAngle0 = -stat;
			borderAngle1 = stat;
			for (var i:int = 0; i < num; i++) 
			{
				var basicAngle:Number = stat + i * mDisAngle;
				mPosAry.push(countPosInfor(basicAngle));
			}
			//起始之前的位置
			startPosInfor = countPosInfor(stat - mDisAngle);
			//结束之后的位置
			endPosInfor = countPosInfor( -stat + mDisAngle);
			return mPosAry;
		}
		//计算坐标角度信息
		private function countPosInfor(angle:Number):String
		{
			var midStr:String = "";
			var midNum:Number = mFp * outTime;
			var midx:Number = centerX + leftOrRight * cosD(angle) * mRadius;
			var midy:Number = centerY + leftOrRight * sinD(angle) * mRadius;
			var step:Number = angle / midNum;
			return (midx + "*" + midy + "*" + angle + "*" + step);
		}
		
		/*
		 * 渐隐隐藏 更新起始id  
		 */
		private function hideMc(mc:mm):void
		{
			TweenLite.to(mc, .3, { alpha:0, onComplete:changeStartNum, onCompleteParams:[mc.rotation, mc.mID,mc] } );
			sameTimeShow(mc.rotation, mc.mID);
		}
		//同时显示
		private function sameTimeShow(midAngle:Number, midID:int):void
		{
			var midNum:int;
			if (midAngle > 0)
			{
				midNum = midID - iconCount;
				showMc(midID, -iconCount);
			}
			else
			{
				midNum = midID + 1;
				showMc(midID, iconCount);
			}
			checkBtn(midNum);
		}
		
		//改变起始ID
		private function changeStartNum(midAngle:Number, midID:int,mc:mm):void
		{
			isHide = true;
			mc.visible = false;
			startNum = (midAngle > 0)?(midID - iconCount):(midID + 1);
		}
		
		/*
		 * 渐隐出现，更新起始id
		 */
		private function showMc(mcID:int,kind:int):void
		{
			var checkNum:int = mcID + kind;
			var midmc:mm = mm(mcAry[checkNum]);
			var midPos:String = "";
			var midID:int;
			var outStep:int;
			midmc.alpha = 0;
			if (kind > 0)
			{
				midPos = endPosInfor;
				midID = iconCount - 1;
				outStep = basicStep;
			}
			else
			{
				midPos = startPosInfor;
				midID = 0;
				outStep = -basicStep;
			}
			itemSlowOut(midmc, midPos, mPosAry[midID], outStep);
			
		}
		/*
		 * 对出现的元件进行旋转出现操作
		 */
		private function itemSlowOut(midmc:mm, posx:String, posy:String,outStep:int):void
		{
			showStep = outStep;
			var midAry:Array = posx.split("*");
			midmc.x = Number(midAry[0]);
			midmc.y = Number(midAry[1]);
			midmc.rotation = Number(midAry[2]);
			midmc.visible = true;
			var endAry:Array = posy.split("*");
			var midx:Number = Number(endAry[0]);
			var midy:Number = Number(endAry[1]);
			var midRotation:Number = Number(endAry[2]);
			TweenLite.to(midmc, .3, { x:midx, y:midy, rotation:midRotation, alpha:1 } );
		}
		
		/*
		 * 检测按钮状态
		 */
		private function checkBtn(beginID:int):void
		{
			if (beginID <= 0)
			{
				btnDown.cBtnUseable = true;
				btnUp.cBtnUseable = false;
			}
			else if (beginID >= mcAry.length -iconCount)
			{
				btnDown.cBtnUseable = false;
				btnUp.cBtnUseable = true;
			}
			else
			{
				btnDown.cBtnUseable = true;
				btnUp.cBtnUseable = true;
			}
			//当总数少于显示数量时，用特殊值屏蔽翻页按钮
			if (beginID == -100)
			{
				btnDown.cBtnUseable = false;
				btnUp.cBtnUseable = false;
			}
		}
		
	
		//角度转弧度
		private function angleToRation(angle:Number):Number
		{
			return angle * Math.PI / 180;
		}
		//弧度转角度
		private function radianToAngle(radian:Number):Number
		{
			return radian * 180 / Math.PI;
		}
		//计算正弦值；
		private function sinD(angle:Number):Number
		{
			return Math.sin(angleToRation(angle));
		}
		//计算余弦值；
		private function cosD(angle:Number):Number
		{
			return Math.cos(angleToRation(angle));
		}
		
		public function get mDirection():Boolean { return Boolean(leftOrRight); }
		
		public function set mDirection(value:Boolean):void 
		{
			leftOrRight = (value == true)? -1:1;
		}
	}	
}