package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
	import ICard.lang.client.com.views.RoomListViewLang;
    import flash.text.*;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

    public class roomlist extends MovieClip implements IRoomList{
        public var _fresh_but:SimpleButton;
		public var _quick_but:SimpleButton;
		public var _roomDict:Dictionary;
		private var _barArr:Array;
        public function roomlist(){
						_barArr = [_bar1,_bar2,_bar3,_bar4,_bar5,_bar6,_bar7];
						
						//InitCallback(f1,f2);
						_roomDict = new Dictionary;
						var bar:Object;
						for each (bar in _barArr) {
							InitBar(bar);
						}
						FreshRoomsInfo();
						
				}
        		public function get content():MovieClip{
            		return (this);
        		}
				public function InitCallback(arg1:Function,arg2:Function,arg3:Function,arg4:Function):void
				{
						var index:int= 1;
						var bar:Object;
						for each (bar in _barArr) {
							InitBarCallback(bar,arg1,arg2,index++);
						}
						_fresh_but.addEventListener(MouseEvent.CLICK,arg3);
						_quick_but.addEventListener(MouseEvent.CLICK,arg4);
				}
				private function InitBar(bar:Object):void{
						bar.stop();
						/*var handleMouseOver:* = function(e:MouseEvent):void{
							bar.gotoAndStop(2);
							SetRoomInfo(bar);
						}
						var handleMouseOut:* = function(e:MouseEvent):void{
							bar.gotoAndStop(1);
							SetRoomInfo(bar);
						}
						bar.addEventListener(MouseEvent.MOUSE_OVER,handleMouseOver);
						bar.addEventListener(MouseEvent.MOUSE_OUT,handleMouseOut);*/
				}
		
				private function InitBarCallback(bar:Object,arg1:Function,arg2:Function,arg3:int):void{
						var onWatch:* = function(e:MouseEvent):void{
							arg1(arg3);
						};
						var onJoin:* = function(e:MouseEvent):void{
							arg2(arg3);
						};
						bar._watch_but.addEventListener(MouseEvent.MOUSE_UP,onWatch);
						bar._join_but.addEventListener(MouseEvent.MOUSE_UP,onJoin);
				}
	
				public function UpdateRoom(id:int,owner:String,slotInfo:String,
															joinAble:Boolean,watchAble:Boolean,started:Boolean):void{
						var bar:Object = this["_bar" + id] as Object;
						bar._watch_but.enabled  = watchAble;
						bar._join_but.enabled = joinAble;
				}
				public function UpdateVSRooms(roomArr:Array):void{
					_roomDict = new Dictionary;
					var room:Object;
					for each (room in roomArr)
					{
						_roomDict[room.id] = room;
					}
					FreshRoomsInfo();
				}
				public function AddVSRoom(room:Object):void{
					_roomDict[room.id] = room;
					FreshRoomsInfo();
				}
				public function DelVSRoom(id:int):void{
					delete _roomDict[id]; 
					FreshRoomsInfo();
				}
				
				public function FreshRoomsInfo():void{
					var bar:Object;
					for each (bar in _barArr) {
						bar._roomName.text = RoomListViewLang.RoomName + "  --";
						bar._playerNum.text = RoomListViewLang.PlayerNum +"  0/0";
					}
					
					var id:String;
					var index:int = 0;
					for(id in _roomDict){
						var room:Object = _roomDict[id];
						//var val:String = RoomListViewLang.RoomName + "  --";
						_barArr[index]._roomName.text = RoomListViewLang.RoomName + "  "+room.name;
						_barArr[index]._playerNum.text = RoomListViewLang.PlayerNum +"  "+room.userCount +"/" +room.maxUsers;
						index++;
					}
           
				}
		
    }
}//package 
