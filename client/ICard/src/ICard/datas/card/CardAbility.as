//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {

	import ICard.assist.server.CardType;

	public class CardAbility {
		public static const WHICH_NULL:int = 0;
		public static const WHICH_MY:int = 1;
		public static const WHICH_MYHERO:int = 2;
		public static const WHICH_MYSOLDIER:int = 3;
		public static const WHICH_YOUR:int = 4;
		public static const WHICH_YOURHERO:int = 5;
		public static const WHICH_YOURSOLDIER:int = 6;
		
		public static const BUF_NULL:int              =0;
		public static const BUF_ATK_DIST:int          =1;   //Զ��
		public static const BUF_ATK_WITH_EQUIP:int    =2;   //ÿװ���򹥻�����
		public static const BUF_ATK_ADD:int           =3;   //����������
		public static const BUF_ATK_UNABLE:int        =4;   //�޷�����
		public static const BUF_CURE:int              =5;   //�ܵ�����ʱ�˺�����
		public static const BUF_DAMAGE_UNSTOP:int     =6;   //�˺����ɷ�ֹ
		public static const BUF_GUIDE:int             =7;   //��������
		public static const BUF_HEAL:int              =8;   //����
		public static const BUF_HIDDEN:int            =9;   //����
		public static const BUF_HP_WITH_EQUIP:int     =10;  //ÿװ������������
		public static const BUF_LATENT:int            =11;  //Ǳ��
		public static const BUF_SHIELD:int            =12;  //�����˺�
		public static const BUF_SIDE:int              =13;  //����
		public static const BUF_STRIKE_COST_ADD:int   =14;  //���������������
		public static const BUF_STRIKE_DAMAGE_ADD:int =15;  //��������˺�����
		public static const BUF_POINT_UNABLE:int      =16;  //����ָ��
		public static const BUF_DEF_ADD:int           =17;   //
		public static const BUF_DEF_UNABLE:int        =18;  //�޷�����
		
		public static const BUF_MAX:int        				=99;  //
	
		public static const DO_ATK_SIDE_ADD:int         =101;  //��������ʱ���˺�
		public static const DO_BREAK_SKILL:int          =102;  //��ϼ���
		public static const DO_DROP_HAND_CARD:int       =103;  //������
		public static const DO_DRAW_HAND_CARD:int       =104;  //ץ��
		public static const DO_DROP_RES:int             =105;  //����Դ
		public static const DO_DAMAGE:int               =106;  //�˺�
		public static const DO_HEAL:int                 =107;  //����
		public static const DO_KILL:int                 =108;  //����
		public static const DO_KILL_COST_UP:int         =109;  //������ô���
		public static const DO_KILL_COST_DOWN:int       =110;  //�������С��
		public static const DO_RESET:int                =111;  //����
		public static const DO_SIDE:int                 =112;  //����
	
		private var _id:int;
		private var _which:int = WHICH_NULL;
		private var _what:int = BUF_NULL;
		private var _targetNum:int = 0;
		
		public function CardAbility(id:int){
			_id = id;
			var info:Array = CardType.CardAbilityInfo(id);
			if(info){
				parseWhich(info);
				parseWhat(info);
				_targetNum = info[7];
			}
		}
		
		public function IsBuf():Boolean{
			return (_what >=BUF_ATK_DIST && _what <BUF_MAX);
		}
		
		private function parseWhat(info:Array):void{
			if(info[1] == "BUF_ATK_DIST")
				_what = BUF_ATK_DIST;
			else if(info[1] == "BUF_ATK_WITH_EQUIP")
				_what = BUF_ATK_WITH_EQUIP;
			else if(info[1] == "BUF_ATK_ADD")
				_what = BUF_ATK_ADD;
			else if(info[1] == "BUF_ATK_UNABLE")
				_what = BUF_ATK_UNABLE;
			else if(info[1] == "BUF_CURE")
				_what = BUF_CURE;
			else if(info[1] == "BUF_DAMAGE_UNSTOP")
				_what = BUF_DAMAGE_UNSTOP;
			else if(info[1] == "BUF_GUIDE")
				_what = BUF_GUIDE;			
			else if(info[1] == "BUF_HEAL")
				_what = BUF_HEAL;
			else if(info[1] == "BUF_HIDDEN")
				_what = BUF_HIDDEN;
			else if(info[1] == "BUF_HP_WITH_EQUIP")
				_what = BUF_HP_WITH_EQUIP;
			else if(info[1] == "BUF_LATENT")
				_what = BUF_LATENT;
			else if(info[1] == "BUF_SHIELD")
				_what = BUF_SHIELD;	
			else if(info[1] == "BUF_SIDE")
				_what = BUF_SIDE;
			else if(info[1] == "BUF_STRIKE_COST_ADD")
				_what = BUF_STRIKE_COST_ADD;
			else if(info[1] == "BUF_STRIKE_DAMAGE_ADD")
				_what = BUF_STRIKE_DAMAGE_ADD;		
			else if(info[1] == "BUF_POINT_UNABLE")
				_what = BUF_POINT_UNABLE;
			else if(info[1] == "BUF_DEF_UNABLE")
				_what = BUF_DEF_UNABLE;
			else if(info[1] == "DO_ATK_SIDE_ADD")
				_what = DO_ATK_SIDE_ADD;
			else if(info[1] == "DO_BREAK_SKILL")
				_what = DO_BREAK_SKILL;
			else if(info[1] == "DO_DROP_HAND_CARD")
				_what = DO_DROP_HAND_CARD;
			else if(info[1] == "DO_DROP_RES")
				_what = DO_DROP_RES;
			else if(info[1] == "DO_DAMAGE")
				_what = DO_DAMAGE;
			else if(info[1] == "DO_HEAL")
				_what = DO_HEAL;		
			else if(info[1] == "DO_KILL")
				_what = DO_KILL;		
			else if(info[1] == "DO_KILL_COST_UP")
				_what = DO_KILL_COST_UP;	
			else if(info[1] == "DO_KILL_COST_DOWN")
				_what = DO_KILL_COST_DOWN;	
			else if(info[1] == "DO_RESET")
				_what = DO_RESET;
			else if(info[1] == "DO_SIDE")
				_what = DO_SIDE;	
			else if(info[1] == "DO_DRAW_HAND_CARD")
				_what = DO_DRAW_HAND_CARD;
			else		
				_what = BUF_NULL;	 	
		}
		private function parseWhich(info:Array):void{
			if(info[1]=="WHICH_MY")
				_which = WHICH_MY;
			else if(info[1]=="WHICH_MYHERO")
				_which = WHICH_MYHERO;
			else if(info[1]=="WHICH_MYSOLDIER")
				_which = WHICH_MYSOLDIER;	
			else if(info[1]=="WHICH_YOUR")
				_which = WHICH_YOUR;
			else if(info[1]=="WHICH_YOURSOLDIER")
				_which = WHICH_MYSOLDIER;	
			else if(info[1]=="WHICH_YOURHERO")
				_which = WHICH_YOURHERO;
			else
				_which = WHICH_NULL;	
		}
		
		public function get CardID():int{
			return _id/10;
		}
		public function get targetNum():int{
			return _targetNum;
		}
		public function get what():int{
			return _what;
		}
		public function get which():int{
			return _which;
		}
	}
}//package com.assist.data.mission 
