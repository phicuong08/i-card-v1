package 
{
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * 文档类
	 * @author Tiger 1748055943@qq.com
	 * 2011-6-18 10:24
	 */
	public class slideMain extends Sprite 
	{
		private var testVect:CircleMove;
		private var midAry:Array;
		private var totalNum:int = 12;
		private var infoTxt:TextField;
		
		public function slideMain()
		{
			infoTxt = new TextField();
			infoTxt.autoSize = TextFieldAutoSize.RIGHT
			infoTxt.textColor = 0xF2B82F;
			infoTxt.backgroundColor = 0x000000;
			infoTxt.background = true;
			addChild(infoTxt);
			
			var midTF:TextFormat = new TextFormat();
			midTF.size = 14;
			infoTxt.defaultTextFormat = midTF;
			
			testVect = new CircleMove(260,5,30);
			testVect.x = 100;
			testVect.y = 20;
			addChild(testVect);
			testVect.addEventListener("OpenState", getIsOpen);
			setInfo("单击展开按钮可展开菜单:)");
			
			var midAry:Array = []; 
			for (var i:int = 0; i < totalNum; i++) 
			{
				var midMc:mm = new mm(i);
				addChild(midMc);
				midAry.push(midMc);
				midMc.addEventListener("selectItem", getSelected);
			}
			testVect.created(midAry);
		}
		
		private function getSelected(e:DataEvent):void 
		{
			var id:int = int(e.data);
			setInfo("当前选中第:" + id + "个对象");
		}
		
		private function getIsOpen(e:DataEvent):void
		{
			var index:int = int(e.data);
			index == 1?setInfo(""):setInfo("单击展开按钮可展开菜单:)");
		}
		
		private function setInfo(arg1:String):void
		{
			infoTxt.text = arg1;
			infoTxt.x = stage.stageWidth - infoTxt.width;
		}
	}
	
}