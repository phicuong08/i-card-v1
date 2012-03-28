//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {
    import com.lang.client.com.assist.server.source.*;

    public class SoulType {

        private static const QualityColor:Object = {
            0:2272312,
            1:44783,
            2:0xFF00FF,
            3:0xFFF100,
            4:0xA40000
        };
        private static const jobType:Object = {
            1:[SoulTypeDataLang.Jian],
            2:[SoulTypeDataLang.Gong],
            3:[SoulTypeDataLang.Quan],
            4:[SoulTypeDataLang.ChangBing],
            5:[SoulTypeDataLang.Zhang]
        };
        private static const soulData:Object = {
            1:[{
                min:100,
                max:200
            }, {
                min:205,
                max:500
            }, {
                min:600,
                max:600
            }],
            2:[{
                min:700,
                max:800
            }, {
                min:805,
                max:1000
            }, {
                min:1005,
                max:1200
            }, {
                min:1500,
                max:1500
            }],
            3:[{
                min:1200,
                max:1400
            }, {
                min:1405,
                max:1600
            }, {
                min:1605,
                max:1800
            }, {
                min:1805,
                max:2000
            }, {
                min:2500,
                max:2500
            }]
        };
        private static const soulDataP:Object = {
            1:[{
                min:0.5,
                max:1
            }, {
                min:1.1,
                max:2.5
            }, {
                min:3,
                max:3
            }],
            2:[{
                min:3.5,
                max:4
            }, {
                min:4.1,
                max:4.6
            }, {
                min:4.7,
                max:6
            }, {
                min:8,
                max:8
            }],
            3:[{
                min:6,
                max:7
            }, {
                min:7.1,
                max:8
            }, {
                min:8.1,
                max:9
            }, {
                min:9.1,
                max:10
            }, {
                min:12,
                max:12
            }]
        };
        private static const soulForLife:Object = {
            1:[{
                min:1000,
                max:1500
            }, {
                min:1550,
                max:2500
            }, {
                min:3500,
                max:3500
            }],
            2:[{
                min:3400,
                max:4000
            }, {
                min:4050,
                max:4600
            }, {
                min:4650,
                max:6000
            }, {
                min:8000,
                max:8000
            }],
            3:[{
                min:6000,
                max:7000
            }, {
                min:7050,
                max:8000
            }, {
                min:8050,
                max:9000
            }, {
                min:9050,
                max:10000
            }, {
                min:15000,
                max:15000
            }]
        };
        private static const warAttributeData:Object = {
            1:{
                dataName:SoulTypeDataLang.Life,
                qualityColorData:soulForLife,
                isPercentage:false,
                info:SoulTypeDataLang.LifeInfo
            },
            2:{
                dataName:SoulTypeDataLang.Attack,
                qualityColorData:soulData,
                isPercentage:false,
                info:SoulTypeDataLang.AttackInfo
            },
            3:{
                dataName:SoulTypeDataLang.Defense,
                qualityColorData:soulData,
                isPercentage:false,
                info:SoulTypeDataLang.DefenseInfo
            },
            4:{
                dataName:SoulTypeDataLang.Spell,
                qualityColorData:soulData,
                isPercentage:false,
                info:SoulTypeDataLang.SpellInfo
            },
            5:{
                dataName:SoulTypeDataLang.SpellDef,
                qualityColorData:soulData,
                isPercentage:false,
                info:SoulTypeDataLang.SpellDefInfo
            },
            6:{
                dataName:SoulTypeDataLang.Stunt,
                qualityColorData:soulData,
                isPercentage:false,
                info:SoulTypeDataLang.StuntInfo
            },
            7:{
                dataName:SoulTypeDataLang.StuntDef,
                qualityColorData:soulData,
                isPercentage:false,
                info:SoulTypeDataLang.StuntDefInfo
            },
            8:{
                dataName:SoulTypeDataLang.Hit,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.HitInfo
            },
            9:{
                dataName:SoulTypeDataLang.Block,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.BlockInfo
            },
            10:{
                dataName:SoulTypeDataLang.Dodge,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.DodgeInfo
            },
            11:{
                dataName:SoulTypeDataLang.Crit,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.Crit
            },
            13:{
                dataName:SoulTypeDataLang.Wreck,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.WreckInfo
            },
            14:{
                dataName:SoulTypeDataLang.Toughness,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.ToughnessInfo
            },
            15:{
                dataName:SoulTypeDataLang.Kill,
                qualityColorData:soulDataP,
                isPercentage:true,
                info:SoulTypeDataLang.KillInfo
            }
        };
        private static const Type:Object = {
            1:["剑"],
            2:["弓箭"],
            3:["拳刃"],
            4:["长兵"],
            5:["法杖"]
        };
        private static const Location:Object = {
            1:["灵件1"],
            2:["灵件2"],
            3:["灵件3"],
            4:["灵件4"],
            5:["灵件5"],
            6:["灵件6"]
        };
        private static const AllType:Object = {
            1:[1, 1, "灵件1"],
            2:[1, 2, "灵件2"],
            3:[1, 3, "灵件3"],
            4:[2, 1, "箭头"],
            5:[2, 2, "弓臂"],
            6:[2, 3, "弓弦"],
            7:[3, 1, "拳刃"],
            8:[3, 2, "护手"],
            9:[3, 3, "护臂"],
            10:[4, 1, "锋刃"],
            11:[4, 2, "长柄"],
            12:[4, 3, "柄锥"],
            13:[5, 1, "杖芯"],
            14:[5, 2, "杖杆"],
            15:[5, 3, "杖锥"],
            16:[1, 4, "灵件4"],
            17:[2, 4, "箭头2"],
            18:[3, 4, "拳刃2"],
            19:[4, 4, "锋刃2"],
            20:[5, 4, "杖芯2"],
            21:[1, 5, "灵件5"],
            22:[2, 5, "弓臂2"],
            23:[3, 5, "护手2"],
            24:[4, 5, "长柄2"],
            25:[5, 5, "杖杆2"],
            26:[1, 6, "灵件6"],
            27:[2, 6, "弓弦2"],
            28:[3, 6, "护臂2"],
            29:[4, 6, "柄锥2"],
            30:[5, 6, "杖锥2"]
        };
        private static const Quality:Object = {
            1:["蓝色"],
            2:["紫色"],
            3:["金色"]
        };
        private static const Attribute:Object = {
            1:[1, 1],
            2:[1, 2],
            3:[1, 3],
            4:[2, 1],
            5:[2, 2],
            6:[2, 3],
            7:[3, 1],
            8:[3, 2],
            9:[3, 3],
            10:[4, 1],
            11:[4, 2],
            12:[4, 3],
            13:[5, 1],
            14:[5, 2],
            15:[5, 3],
            16:[6, 1],
            17:[6, 2],
            18:[6, 3],
            19:[7, 1],
            20:[7, 2],
            21:[7, 3],
            22:[8, 1],
            23:[8, 2],
            24:[8, 3],
            25:[9, 1],
            26:[9, 2],
            27:[9, 3],
            28:[10, 1],
            29:[10, 2],
            30:[10, 3],
            31:[11, 1],
            32:[11, 2],
            33:[11, 3],
            34:[13, 1],
            35:[13, 2],
            36:[13, 3],
            37:[14, 1],
            38:[14, 2],
            39:[14, 3],
            40:[15, 1],
            41:[15, 2],
            42:[15, 3]
        };

        private static var _Soul:Object = null;
        public static var ItemToSoul:Object = {
            3:6,
            6:6,
            9:6,
            12:6,
            15:6,
            18:6,
            21:6,
            24:6,
            27:6,
            30:6,
            33:6,
            36:6,
            39:6,
            42:6,
            45:6,
            48:6,
            51:6,
            54:6,
            57:6,
            60:6,
            63:6,
            66:6,
            69:6,
            72:6,
            75:6,
            78:6,
            81:6,
            84:6,
            87:6,
            90:6
        };

        public static function getJobNameToTypeId(_arg1:int):String{
            return (((jobType[_arg1][0]) || ("")));
        }
        public static function getSoulQualityColor(_arg1:int):uint{
            var _local2:int = getSoulQualityId(_arg1);
            return (((QualityColor[_local2]) || (0)));
        }
        public static function getQualityColor(_arg1:int):uint{
            return (((QualityColor[_arg1]) || (0)));
        }
        public static function warAttributeIdToName(_arg1:int):String{
            return (((warAttributeData[_arg1].dataName) || ("")));
        }
        public static function warAttributeIdToInfo(_arg1:int):String{
            return (((warAttributeData[_arg1].info) || ("")));
        }
        public static function warValueChange(_arg1:int, _arg2:Number):String{
            var _local3:String = _arg2.toString();
            var _local4:String = "";
            if (warAttributeData[_arg1].isPercentage){
                _local4 = "%";
                _local3 = (_arg2 + 0.005).toFixed(1);
            };
            return ((_local3 + _local4));
        }
        public static function getDataColor(_arg1:int, _arg2:int, _arg3:Number):Object{
            var _local9:Object;
            var _local4:Object = warAttributeData[_arg1].qualityColorData;
            var _local5:Array = _local4[_arg2];
            var _local6:int = _local5.length;
            var _local7:int = 5;
            var _local8:int;
            while (_local8 < _local6) {
                _local9 = _local5[_local8];
                if ((((_arg3 >= _local9.min)) && ((_arg3 <= _local9.max)))){
                    _local7 = _local8;
                    break;
                };
                _local8++;
            };
            return ((({
                color:QualityColor[_local7],
                colorQuelity:_local7
            }) || ({})));
        }
        public static function getDataRange(_arg1:int, _arg2:int, _arg3:Number):String{
            var _local4:Object = warAttributeData[_arg1].qualityColorData;
            var _local5:Array = _local4[_arg2];
            var _local6:Object = {};
            _local6.min = _local5[0].min;
            _local6.max = _local5[(_local5.length - 1)].max;
            _local6.minInfo = warValueChange(_arg1, _local6.min);
            _local6.maxInfo = warValueChange(_arg1, _local6.max);
            var _local7:String = "";
            if (_arg3 == _local6.max){
                _local7 = SoulTypeDataLang.Full;
            } else {
                _local7 = (((("(" + _local6.minInfo) + "-") + _local6.maxInfo) + ")");
            };
            return (_local7);
        }
        public static function getQualityForIDValue(_arg1:int, _arg2:int, _arg3:int):int{
            var _local9:Object;
            var _local4:Number = (_arg3 / 1000);
            var _local5:Object = warAttributeData[_arg1].qualityColorData;
            var _local6:Array = _local5[_arg2];
            var _local7:int = _local6.length;
            var _local8:int;
            while (_local8 < _local7) {
                _local9 = _local6[_local8];
                if ((((_local9.min <= _local4)) && ((_local4 <= _local9.max)))){
                    return ((_local8 + 1));
                };
                _local8++;
            };
            return (0);
        }
        public static function get Soul():Object{
            if (_Soul == null){
                throw (new Error("还未赋值！"));
            };
            return (_Soul);
        }
        public static function set Soul(_arg1:Object):void{
            if (_Soul != null){
                throw (new Error("非法赋值"));
            };
            _Soul = _arg1;
        }
        public static function getTypeName(_arg1:int):String{
            return ((Type[_arg1]) ? Type[_arg1][0] : "");
        }
        public static function getSoulTypeIdByAllTypeId(_arg1:int):int{
            return ((AllType[_arg1]) ? AllType[_arg1][0] : 0);
        }
        public static function getSubTypeNameByAllTypeId(_arg1:int):String{
            return ((AllType[_arg1]) ? AllType[_arg1][2] : "");
        }
        public static function getSubTypeName(_arg1:int, _arg2:int):String{
            var _local3:String;
            for (_local3 in AllType) {
                if ((((AllType[_local3][0] == _arg1)) && ((AllType[_local3][1] == _arg2)))){
                    return (AllType[_local3][2]);
                };
            };
            return ("");
        }
        public static function getQualityName(_arg1:int):String{
            return ((Quality[_arg1]) ? Quality[_arg1][0] : "");
        }
        public static function getSoulSubTypeId(_arg1:int):int{
            return ((Soul[_arg1]) ? Soul[_arg1][0] : 0);
        }
        public static function getSoulQualityId(_arg1:int):int{
            return ((Soul[_arg1]) ? Soul[_arg1][1] : 0);
        }
        public static function getSoulName(_arg1:int):String{
            var _local2:String = (Soul[_arg1]) ? Soul[_arg1][2] : "";
            _local2 = _local2.split("_")[0];
            return (_local2);
        }
        public static function getSoulContent(_arg1:int):String{
            return ((Soul[_arg1]) ? Soul[_arg1][3] : "");
        }
        public static function getSoulSalePrice(_arg1:int):int{
            return ((Soul[_arg1]) ? Soul[_arg1][4] : 0);
        }
        public static function getWarAttributeTypeId(_arg1:int):int{
            return ((Attribute[_arg1]) ? Attribute[_arg1][0] : 0);
        }
        public static function getAttrQualityId(_arg1:int):int{
            return ((Attribute[_arg1]) ? Attribute[_arg1][1] : 0);
        }
        public static function getSubTypeIdListByLocationId(_arg1:int):Array{
            var _local3:String;
            var _local2:Array = [];
            for (_local3 in AllType) {
                if (AllType[_local3][1] == _arg1){
                    _local2.push(_local3);
                };
            };
            return (_local2);
        }
        public static function getSoulIdList(_arg1:int, _arg2:int):Array{
            var _local6:int;
            var _local7:String;
            var _local3:Array = getSubTypeIdListByLocationId(_arg2);
            var _local4:int = _local3.length;
            var _local5:Array = [];
            for (_local7 in Soul) {
                _local6 = 0;
                while (_local6 < _local4) {
                    if ((((Soul[_local7][0] == _local3[_local6])) && ((Soul[_local7][1] == _arg1)))){
                        _local5.push({
                            soulId:_local7,
                            qualityId:_arg1
                        });
                    };
                    _local6++;
                };
            };
            return (_local5);
        }
        public static function getItemNumBySoulId(_arg1:int):int{
            return (((ItemToSoul[_arg1]) || (0)));
        }

    }
}//package com.assist.server 
