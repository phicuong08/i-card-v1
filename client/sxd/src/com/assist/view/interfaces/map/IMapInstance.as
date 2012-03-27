//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.interfaces.map {
    import flash.display.*;
    import com.assist.view.interfaces.factionWar.*;

    public interface IMapInstance {

        function get town():ITownMap;
        function get mission():IMissionMap;
        function get boss():IWorldBossMap;
        function get drama():IDramaManage;
        function get frame():IFrameSprite;
        function get worldFrame():IWorldFrame;
        function get faction():IFactionWarMap;
        function get boxObj():MovieClip;
        function get boxStar():MovieClip;
        function get soulBox():MovieClip;

    }
}//package com.assist.view.interfaces.map 
