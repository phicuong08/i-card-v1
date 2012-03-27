//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.map {
    import flash.display.*;
    import com.assist.view.interfaces.map.*;

    public class MapStatic extends Sprite {

        public static var upZ:Boolean = false;
        public static var mapInstance:IMapInstance;
        public static var effectLayder:Sprite = new Sprite();
        public static var FolderScreen:String = "assets/roles/screen/";
        public static var FolderRole:String = "assets/roles/";
        public static var FolderEffects:String = "assets/roles/effects/";
        public static var FolderDrama:String = "assets/drama/";
        public static var FolderMap:String = "assets/map/";
        public static var FolderItemIcon:String = "assets/icons/goods/";
        public static var FolderNPCIcon:String = "assets/icons/npc/";
        public static var mapStage:Stage;
        public static var stageW:int = 1250;
        public static var stageH:int = 650;
        public static var removeNickNameSuffix:Function;
        public static var getRoleName:Function;
        public static var getRoleSign:Function;

    }
}//package com.assist.view.map 
