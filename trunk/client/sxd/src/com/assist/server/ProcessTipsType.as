//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.lang.client.com.assist.server.*;

    public class ProcessTipsType {

        public static const PartnersCount:int = 1;
        public static const Research:int = 2;
        public static const Partners:int = 3;
        public static const Gift:int = 6;
        public static const Equipment:int = 7;
        public static const Deplay:int = 8;
        public static const Practice:int = 9;
        public static const CoinsInsufficient:int = 10;
        public static const LuckyShop:int = 11;
        public static const SuperDeploy:int = 12;
        public static const StudyStunt:int = 13;

        private static var _tips:Object = {};

        public static function getTip(_arg1:int):Object{
            var _local2:Object = ((_tips[_arg1]) || ({}));
            return ({
                type:_arg1,
                icon:((_local2["icon"]) || ("")),
                title:((_local2["title"]) || ("")),
                content:((_local2["content"]) || ("")),
                action:((_local2["action"]) || ("")),
                prior:((_local2["prior"]) || (0))
            });
        }
        public static function init():void{
            addTip(PartnersCount, "PartnersCount.swf", ProcessTipsTypeLang.PartnersCountTitle, ProcessTipsTypeLang.PartnersCountContent, ProcessTipsTypeLang.PartnersCountAction, 4);
            addTip(Research, "Research.swf", ProcessTipsTypeLang.ResearchTitle, ProcessTipsTypeLang.ResearchContent, ProcessTipsTypeLang.ResearchAction, 5);
            addTip(Partners, "Partners.swf", ProcessTipsTypeLang.PartnersTitle, ProcessTipsTypeLang.PartnersContent, ProcessTipsTypeLang.PartnersAction, 3);
            addTip(Gift, "Gift.swf", ProcessTipsTypeLang.GiftTitle, ProcessTipsTypeLang.GiftContent, ProcessTipsTypeLang.GiftAction, 2);
            addTip(Equipment, "Equipment.swf", ProcessTipsTypeLang.EquipmentTitle, ProcessTipsTypeLang.EquipmentContent, ProcessTipsTypeLang.EquipmentAction, 6);
            addTip(Deplay, "Deplay.swf", ProcessTipsTypeLang.DeplayTitle, ProcessTipsTypeLang.DeplayContent, ProcessTipsTypeLang.DeplayAction, 7);
            addTip(Practice, "Practice.swf", ProcessTipsTypeLang.PracticeTitle, ProcessTipsTypeLang.PracticeContent, ProcessTipsTypeLang.PracticeAction, 8);
            addTip(CoinsInsufficient, "Rune.swf", ProcessTipsTypeLang.RuneTitle, ProcessTipsTypeLang.RuneContent, ProcessTipsTypeLang.RuneAction, 9);
            addTip(LuckyShop, "LuckyShop.swf", ProcessTipsTypeLang.LuckyShopTitle, ProcessTipsTypeLang.LuckyShopContent, ProcessTipsTypeLang.LuckyShopAction, 10);
            addTip(SuperDeploy, "SuperDeploy.swf", ProcessTipsTypeLang.SuperDeployTitle, ProcessTipsTypeLang.SuperDeployContent, ProcessTipsTypeLang.SuperDeployAction, 11);
            addTip(StudyStunt, "StudyStunt.swf", ProcessTipsTypeLang.StudyStuntTitle, ProcessTipsTypeLang.StudyStuntContent, ProcessTipsTypeLang.StudyStuntAction, 12);
        }
        private static function addTip(_arg1:int, _arg2:String, _arg3:String, _arg4:String, _arg5:String, _arg6:Number):void{
            _tips[_arg1] = {
                icon:_arg2,
                title:_arg3,
                content:_arg4,
                action:_arg5,
                prior:_arg6
            };
        }

    }
//    var _local1:* = ProcessTipsType.init();
//    return (_local1);
}//package com.assist.server 
