//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas.card {

	import ICard.assist.server.CardType;

	public class CardAbility {
	
		public static const  WHICH_NULL:int                 =0;  
		public static const  WHICH_MY:int                   =1;  //我方
		public static const  WHICH_MYHERO:int               =2;  //我方英雄
		public static const  WHICH_MYSOLDIER:int            =3;  //我方盟军 
		public static const  WHICH_MYWEAPON:int             =4;  //我方武器
		public static const  WHICH_YOUR:int                 =5;  //敌方
		public static const  WHICH_YOURHERO:int             =6;  //敌方英雄
		public static const  WHICH_YOURSOLDIER:int          =7;  //敌方盟军
		public static const  WHICH_YOURWEAPON:int           =8;  //敌方武器
		public static const  WHICH_SKILL:int                =9;  //技能 
		public static const  WHICH_DES:int                  =10; //目标
		public static const  WHICH_SRC:int                  =11; //源
		public static const  WHICH_I:int                    =12; //自己
		public static const  WHICH_SOLDIER:int              =13; //
		public static const  WHICH_IU:int                   =14; //双方
		public static const  WHICH_HERO:int                 =15; //
		
		
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
		public static	const BUF_UNABLE_ATKED:int      =19;   //无法攻击
		
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
				parseWhich(info[1]);
				parseWhat(info[2]);
				_targetNum = info[7];
			}
		}
		
		public function IsBuf():Boolean{
			return (_what >=BUF_ATK_DIST && _what <BUF_MAX);
		}
		
		private function parseWhat(info:String):void{
			if(info == "BUF_ATK_DIST")
				_what = BUF_ATK_DIST;
			else if(info == "BUF_ATK_WITH_EQUIP")
				_what = BUF_ATK_WITH_EQUIP;
			else if(info == "BUF_ATK_ADD")
				_what = BUF_ATK_ADD;
			else if(info == "BUF_ATK_UNABLE")
				_what = BUF_ATK_UNABLE;
			else if(info =="BUF_UNABLE_ATKED")
				_what = BUF_UNABLE_ATKED;
			else if(info == "BUF_CURE")
				_what = BUF_CURE;
			else if(info == "BUF_DAMAGE_UNSTOP")
				_what = BUF_DAMAGE_UNSTOP;
			else if(info == "BUF_GUIDE")
				_what = BUF_GUIDE;			
			else if(info == "BUF_HEAL")
				_what = BUF_HEAL;
			else if(info == "BUF_HIDDEN")
				_what = BUF_HIDDEN;
			else if(info == "BUF_HP_WITH_EQUIP")
				_what = BUF_HP_WITH_EQUIP;
			else if(info == "BUF_LATENT")
				_what = BUF_LATENT;
			else if(info == "BUF_SHIELD")
				_what = BUF_SHIELD;	
			else if(info == "BUF_SIDE")
				_what = BUF_SIDE;
			else if(info == "BUF_STRIKE_COST_ADD")
				_what = BUF_STRIKE_COST_ADD;
			else if(info == "BUF_STRIKE_DAMAGE_ADD")
				_what = BUF_STRIKE_DAMAGE_ADD;		
			else if(info == "BUF_POINT_UNABLE")
				_what = BUF_POINT_UNABLE;
			else if(info == "BUF_DEF_UNABLE")
				_what = BUF_DEF_UNABLE;
			else if(info == "DO_ATK_SIDE_ADD")
				_what = DO_ATK_SIDE_ADD;
			else if(info == "DO_BREAK_SKILL")
				_what = DO_BREAK_SKILL;
			else if(info == "DO_DROP_HAND_CARD")
				_what = DO_DROP_HAND_CARD;
			else if(info == "DO_DROP_RES")
				_what = DO_DROP_RES;
			else if(info == "DO_DAMAGE")
				_what = DO_DAMAGE;
			else if(info == "DO_HEAL")
				_what = DO_HEAL;		
			else if(info == "DO_KILL")
				_what = DO_KILL;		
			else if(info == "DO_KILL_COST_UP")
				_what = DO_KILL_COST_UP;	
			else if(info == "DO_KILL_COST_DOWN")
				_what = DO_KILL_COST_DOWN;	
			else if(info == "DO_RESET")
				_what = DO_RESET;
			else if(info == "DO_SIDE")
				_what = DO_SIDE;	
			else if(info == "DO_DRAW_HAND_CARD")
				_what = DO_DRAW_HAND_CARD;
			else		
				_what = BUF_NULL;	 	
		}
		private function parseWhich(which:String):void{
			if(which=="WHICH_MY")
				_which = WHICH_MY;
			else if(which=="WHICH_MYHERO")
				_which=WHICH_MYHERO;
			else if(which=="WHICH_MYSOLDIER")
				_which=WHICH_MYSOLDIER;
			else if(which=="WHICH_MYWEAPON")
				_which=WHICH_MYWEAPON;
			else if(which=="WHICH_YOUR")
				_which=WHICH_YOUR;
			else if(which=="WHICH_YOURHERO")
				_which=WHICH_YOURHERO;
			else if(which=="WHICH_YOURSOLDIER")
				_which=WHICH_YOURSOLDIER;
			else if(which=="WHICH_YOURWEAPON")
				_which=WHICH_YOURWEAPON;
			else if(which=="WHICH_SKILL")
				_which=WHICH_SKILL;
			else if(which=="WHICH_DES")
				_which=WHICH_DES;
			else if(which=="WHICH_SRC")
				_which=WHICH_SRC;
			else if(which=="WHICH_I")
				_which=WHICH_I;
			else if(which=="WHICH_SOLDIER")
				_which= WHICH_SOLDIER;
			else if(which=="WHICH_IU")
				_which=WHICH_IU;
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
		public function IsWhichMatch(which:int):Boolean{
			if(_which==which)
				return true;
			var ret:Boolean = false;
			switch(which){
				case WHICH_MYHERO:
					if(_which == WHICH_HERO||_which == WHICH_MY)
						ret = true;
					break;
				case WHICH_MYSOLDIER:
					if(_which == WHICH_SOLDIER|| _which==WHICH_MY)
						ret = true;
					break;
				case WHICH_YOURHERO:
					if(_which == WHICH_HERO||_which==WHICH_YOUR)
						ret = true;
					break;
				case WHICH_YOURSOLDIER:
					if(_which == WHICH_SOLDIER ||_which==WHICH_YOUR)
						ret = true;
					break;
			}
			return ret;
		}
	}
}//package com.assist.data.mission 
