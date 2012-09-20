//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {

	import ICard.assist.server.CardType;
		
	public class CardAttr {
	
		public static const ATT_NULL:int 	 	      =0; //
		public static const ATK_UNSTOP:int        =1; //攻击不可防止
		public static const DIST_ATK:int        	=2; //远程
		public static const GUIDE:int        			=3; //护卫
		public static const HIDE:int        			=4; //隐遁
		public static const INSTANT:int        		=5; //瞬发
		public static const LATENT:int        		=6; //潜行
		public static const POINT_UNABLE:int      =7; //不可指定
		public static const ONGOING:int           =8; //持续
		
		private var _id:int;
		private var _vals:Array;
		
		
		public function CardAttr(id:int):void{
			_id = id;
			_vals = [];
			var info:Array = CardType.CardAttrInfo(id);
			var buf:String;
			for each(buf in info){
				AddAttr(buf);
			}
		}
		public function getID():int{
			return _id;
		}
		public function AddAttr(val:String):void{
			var attr:int = parseVal(val);
			if(attr != CardAttr.ATT_NULL){
				_vals.push(attr);
			}
				
		}
		public function IsExistAttr(attr:int):Boolean{
			var local1:int;
			for each (local1 in _vals) {
				if(local1==attr)
					return true;
			};
			return false;
		}
		private function parseVal(val:String):int{
			if(val=="ATK_UNSTOP")
				return CardAttr.ATK_UNSTOP;
			else if(val=="DIST_ATK")
				return CardAttr.DIST_ATK;
			else if(val=="GUIDE")
				return CardAttr.GUIDE;
			else if(val=="HIDE")
				return CardAttr.HIDE;
			else if(val=="INSTANT")
				return CardAttr.INSTANT;
			else if(val=="LATENT")
				return CardAttr.LATENT;
			else if(val=="POINT_UNABLE")
				return CardAttr.POINT_UNABLE;		
			else if(val=="ONGOING")
				return CardAttr.ONGOING;	
			return 	CardAttr.ATT_NULL;
		}
	
	}
}//package com.assist.data.mission 
