﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class ResearchType {

        public static const All:int = 0;
        public static const Magic:int = 1;
        public static const Deploy:int = 2;

        private static var List:Object = {
            1:["生命值", 1, 1, "每级增加生命值20"],
            2:["攻击力", 1, 15, "每级增加攻击能力10"],
            3:["天阵", 2, 1, "增加队伍挡格能力"],
            4:["地阵", 2, 1, "增加队伍普通攻击伤害"],
            5:["防御力", 1, 25, "每级增加防御能力7"],
            6:["法术攻击", 1, 40, "每级增加法术攻击力12"],
            7:["法术防御", 1, 45, "每级增加法术防御力8"],
            8:["绝技攻击", 1, 30, "每级增加绝技攻击力15"],
            9:["绝技防御", 1, 35, "每级增加绝技防御力12"],
            10:["水阵", 2, 20, "增加队伍绝技攻击伤害"],
            11:["火阵", 2, 25, "增加队伍暴击能力"],
            12:["风阵", 2, 30, "增加队伍闪避能力"],
            13:["雷阵", 2, 35, "增加队伍命中能力"],
            14:["山阵", 2, 40, "增加普通防御能力"],
            15:["泽阵", 2, 45, "增加法术攻击伤害"],
            16:["生命值2", 1, 65, "每级增加生命值50"],
            17:["攻击力2", 1, 65, "每级增加攻击力15"],
            18:["防御力2", 1, 65, "每级增加防御能力10"],
            19:["绝技攻击2", 1, 75, "每级增加绝技攻击力30"],
            20:["绝技防御2", 1, 75, "每级增加绝技防御力25"],
            21:["法术攻击2", 1, 75, "每级增加法术攻击力20"],
            22:["法术防御2", 1, 75, "每级增加法术防御力15"],
            23:["暴击", 1, 85, "每级增加暴击概率0.1%"],
            24:["韧性", 1, 85, "每级降低被暴击概率0.1%"],
            25:["格挡", 1, 85, "每级增加格挡概率0.1%"],
            26:["破击", 1, 85, "每级降低被挡格概率0.1%"],
            27:["闪避", 1, 95, "每级增加闪避概率0.1%"],
            28:["命中", 1, 95, "每级增加命中概率0.1%"],
            30:["阵形", 2, 55, "每级增加先攻值4000"]
        };

        public static function getName(_arg1:int):String{
            return ((List[_arg1]) ? List[_arg1][0] : "");
        }
        public static function getContent(_arg1:int):String{
            return ((List[_arg1]) ? List[_arg1][3] : "");
        }

    }
}//package com.assist.server 