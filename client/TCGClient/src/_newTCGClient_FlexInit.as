//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.styles.*;
    
    import flash.system.*;
    import mx.utils.*;
    import mx.collections.*;
    import flash.utils.*;
    import flash.net.*;
    import mx.accessibility.*;
    import spark.accessibility.*;
    import mx.managers.systemClasses.*;
	import mx.effects.EffectManager;
	
    public class _newTCGClient_FlexInit {

        public static function init(_arg1:IFlexModuleFactory):void{
            var styleManager:* = null;
            var fbs:* = _arg1;
            new ChildManager(fbs);
            styleManager = new StyleManagerImpl(fbs);
            var _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("addedEffect", "added");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("completeEffect", "complete");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("creationCompleteEffect", "creationComplete");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("focusInEffect", "focusIn");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("focusOutEffect", "focusOut");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("hideEffect", "hide");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("mouseDownEffect", "mouseDown");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("mouseUpEffect", "mouseUp");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("moveEffect", "move");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("removedEffect", "removed");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("resizeEffect", "resize");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("rollOutEffect", "rollOut");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("rollOverEffect", "rollOver");
            _local3 = EffectManager;
            _local3.mx_internal::registerEffectTrigger("showEffect", "show");
            if (Capabilities.hasAccessibility){
                SliderBaseAccImpl.enableAccessibility();
                ButtonBaseAccImpl.enableAccessibility();
                ToggleButtonAccImpl.enableAccessibility();
                ListBaseAccImpl.enableAccessibility();
                ComboBoxAccImpl.enableAccessibility();
                RichEditableTextAccImpl.enableAccessibility();
                LabelAccImpl.enableAccessibility();
                TextBaseAccImpl.enableAccessibility();
                CheckBoxAccImpl.enableAccessibility();
                ListAccImpl.enableAccessibility();
                DropDownListBaseAccImpl.enableAccessibility();
                ButtonAccImpl.enableAccessibility();
                UIComponentAccProps.enableAccessibility();
            };
            try {
                if (getClassByAlias("flex.messaging.io.ArrayCollection") == null){
                    registerClassAlias("flex.messaging.io.ArrayCollection", ArrayCollection);
                };
            } catch(e:Error) {
                registerClassAlias("flex.messaging.io.ArrayCollection", ArrayCollection);
            };
            try {
                if (getClassByAlias("flex.messaging.io.ArrayList") == null){
                    registerClassAlias("flex.messaging.io.ArrayList", ArrayList);
                };
            } catch(e:Error) {
                registerClassAlias("flex.messaging.io.ArrayList", ArrayList);
            };
            try {
                if (getClassByAlias("flex.messaging.io.ObjectProxy") == null){
                    registerClassAlias("flex.messaging.io.ObjectProxy", ObjectProxy);
                };
            } catch(e:Error) {
                registerClassAlias("flex.messaging.io.ObjectProxy", ObjectProxy);
            };
            var styleNames:* = ["lineHeight", "unfocusedTextSelectionColor", "kerning", "textRollOverColor", "digitCase", "inactiveTextSelectionColor", "textDecoration", "justificationRule", "dominantBaseline", "fontThickness", "trackingRight", "blockProgression", "leadingModel", "textAlignLast", "textAlpha", "letterSpacing", "chromeColor", "rollOverColor", "fontSize", "shadowColor", "baselineShift", "focusedTextSelectionColor", "strokeColor", "paragraphEndIndent", "fontWeight", "breakOpportunity", "leading", "symbolColor", "renderingMode", "barColor", "fontSharpness", "paragraphStartIndent", "justificationStyle", "contentBackgroundColor", "paragraphSpaceAfter", "contentBackgroundAlpha", "fontAntiAliasType", "textRotation", "errorColor", "cffHinting", "direction", "locale", "backgroundDisabledColor", "digitWidth", "ligatureLevel", "firstBaselineOffset", "textIndent", "themeColor", "tabStops", "fontLookup", "paragraphSpaceBefore", "textAlign", "fontFamily", "textSelectedColor", "strokeWidth", "lineThrough", "whiteSpaceCollapse", "fontGridFitType", "alignmentBaseline", "trackingLeft", "fontStyle", "dropShadowColor", "accentColor", "selectionColor", "disabledColor", "focusColor", "textJustify", "color", "alternatingItemColors", "typographicCase"];
            var i:* = 0;
            while (i < styleNames.length) {
                styleManager.registerInheritingStyle(styleNames[i]);
                i = (i + 1);
            };
        }

    }
    var _local1:* = TextFieldFactory;
    return (_local1);
}//package 
