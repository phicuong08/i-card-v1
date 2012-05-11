//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {
			
    public class BufDB {
		
					private var _bufArr:Dictionary;
		
					public function BufDB():void{
							_bufArr = new Dictionary;
					}
					public function AddBuf(arg1:Array):void{
							var buf:BufData = new BufData(arg1);
							_bufArr[buf.RealID] = buf;
					}
     			public function DelBuf(realID:int):void{
     					delete _bufArr[realID];
     			}
					public function HpAdd():void{
							var hpAdd:int = 0;
							for each( var buf:BufData in _bufArr) 
							{
									hpAdd = hpAdd + buf.HpAdd;
							}
							return hpAdd;
					}
					public function AtkAdd():void{
							var atkAdd:int = 0;
							for each( var buf:BufData in _bufArr) 
							{
									atkAdd = atkAdd + buf.AtkAdd;
							}
							return atkAdd;
					}
					public function DefAdd():void{
							var defAdd:int = 0;
							for each( var buf:BufData in _bufArr) 
							{
									defAdd = defAdd + buf.DefAdd;
							}
							return defAdd;
					}
        }

    }
}//package com.assist.data.mission 
