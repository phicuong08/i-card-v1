//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.map {
    import flash.display.*;
    import ICard.assist.view.interfaces.map.*;
    import flash.filters.*;

    public class MapStatic extends Sprite {

        public static const NPCHitLen:int = 0x1900;
        public static const PortalHitLen:int = 10000;
        public static const MonsterHitLen:int = 2500;
        public static const BuildHitLen:int = 40000;

        public static var upZ:Boolean = false;
        public static var mapInstance:IMapInstance;
        public static var effectLayder:Sprite = new Sprite();
        public static var FolderScreen:String = "assets/roles/screen/";
        public static var FolderRole:String = "assets/roles/";
        public static var FolderDrama:String = "assets/drama/";
        public static var FolderMap:String = "assets/map/";
        public static var FolderItemIcon:String = "assets/icons/goods/";
        public static var FolderNPCIcon:String = "assets/icons/npc/";
        public static var mapStage:Stage;
        public static var minW:int = 600;
        public static var minH:int = 400;
        public static var maxW:int = 1250;
        public static var maxH:int = 650;
        public static var stageW:int = 1250;
        public static var stageH:int = 650;
        public static var offX:int = 500;
        public static var offY:int = 370;
        protected static var cf1:ColorMatrixFilter = new ColorMatrixFilter([0.3, 0.3, 0.3, 0, 0, 0.3, 0.3, 0.3, 0, 0, 0.3, 0.3, 0.3, 0, 0, 0, 0, 0, 1, 0]);
        protected static var cf2:ColorMatrixFilter = new ColorMatrixFilter([1, 0, 0, 0, 45, 0, 1, 0, 0, 45, 0, 0, 1, 0, 45, 0, 0, 0, 1, 0]);
        protected static var gf1:GlowFilter = new GlowFilter(0, 1, 2, 2, 4, 1);
        public static var removeNickNameSuffix:Function;
        public static var getVersion:Function;

        public static function reposition():void{
            if (mapStage == null){
                return;
            };
            stageW = getRange(mapStage.stageWidth, maxW, minW);
            stageH = getRange(mapStage.stageHeight, maxH, minH);
            offX = (stageW >> 1);
            offY = getRange(((stageH >> 1) + 70), 370, 270);
        }
        public static function getRange(_arg1:int, _arg2:int, _arg3:int):int{
            if (_arg1 > _arg2){
                return (_arg2);
            };
            if (_arg1 < _arg3){
                return (_arg3);
            };
            return (_arg1);
        }

    }
}//package com.assist.view.map 
