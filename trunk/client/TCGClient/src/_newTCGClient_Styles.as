//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import mx.core.*;
    import mx.styles.*;
    import mx.utils.*;
    import spark.components.supportClasses.*;
    import spark.skins.spark.*;
    import mx.skins.spark.*;
    import mx.skins.halo.*;

    public class _newTCGClient_Styles {

        private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_796535663:Class = _newTCGClient_Styles__embed_css_Assets_swf_mx_skins_cursor_DragReject_796535663;
        private static var _embed_css_Assets_swf_mx_skins_cursor_BusyCursor_452229285:Class = _newTCGClient_Styles__embed_css_Assets_swf_mx_skins_cursor_BusyCursor_452229285;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_804225227:Class = _newTCGClient_Styles__embed_css_Assets_swf_mx_skins_cursor_DragCopy_804225227;
        private static var _embed_css_Assets_swf___brokenImage_685444021:Class = _newTCGClient_Styles__embed_css_Assets_swf___brokenImage_685444021;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_804487494:Class = _newTCGClient_Styles__embed_css_Assets_swf_mx_skins_cursor_DragLink_804487494;
        private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_804513135:Class = _newTCGClient_Styles__embed_css_Assets_swf_mx_skins_cursor_DragMove_804513135;

        public static function init(_arg1:IFlexModuleFactory):void{
            var style:* = null;
            var effects:* = null;
            var mergedStyle:* = null;
            var fbs:* = _arg1;
            var styleManager:* = (fbs.getImplementation("mx.styles::IStyleManager2") as IStyleManager2);
            var conditions:* = null;
            var condition:* = null;
            var selector:* = null;
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("global", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("global");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.lineHeight = "120%";
                    this.unfocusedTextSelectionColor = 0xE8E8E8;
                    this.kerning = "default";
                    this.iconColor = 0x111111;
                    this.verticalScrollPolicy = "auto";
                    this.horizontalAlign = "left";
                    this.filled = true;
                    this.textDecoration = "none";
                    this.columnCount = "auto";
                    this.liveDragging = true;
                    this.dominantBaseline = "auto";
                    this.fontThickness = 0;
                    this.focusBlendMode = "normal";
                    this.blockProgression = "tb";
                    this.buttonColor = 7305079;
                    this.indentation = 17;
                    this.autoThumbVisibility = true;
                    this.textAlignLast = "start";
                    this.paddingTop = 0;
                    this.textAlpha = 1;
                    this.chromeColor = 0xCCCCCC;
                    this.rollOverColor = 13556719;
                    this.bevel = true;
                    this.fontSize = 12;
                    this.shadowColor = 0xEEEEEE;
                    this.columnGap = 20;
                    this.paddingLeft = 0;
                    this.paragraphEndIndent = 0;
                    this.fontWeight = "normal";
                    this.indicatorGap = 14;
                    this.focusSkin = HaloFocusRect;
                    this.breakOpportunity = "auto";
                    this.leading = 2;
                    this.symbolColor = 0;
                    this.renderingMode = "cff";
                    this.borderThickness = 1;
                    this.paragraphStartIndent = 0;
                    this.contentBackgroundColor = 0xFFFFFF;
                    this.backgroundSize = "auto";
                    this.paragraphSpaceAfter = 0;
                    this.borderColor = 0x696969;
                    this.shadowDistance = 2;
                    this.stroked = false;
                    this.digitWidth = "default";
                    this.verticalAlign = "top";
                    this.ligatureLevel = "common";
                    this.firstBaselineOffset = "auto";
                    this.fillAlphas = [0.6, 0.4, 0.75, 0.65];
                    this.version = "4.0.0";
                    this.shadowDirection = "center";
                    this.fontLookup = "embeddedCFF";
                    this.lineBreak = "toFit";
                    this.openDuration = 0;
                    this.repeatInterval = 35;
                    this.paragraphSpaceBefore = 0;
                    this.fontFamily = "Arial";
                    this.paddingBottom = 0;
                    this.strokeWidth = 1;
                    this.lineThrough = false;
                    this.textFieldClass = UITextField;
                    this.alignmentBaseline = "useDominantBaseline";
                    this.trackingLeft = 0;
                    this.verticalGridLines = true;
                    this.fontStyle = "normal";
                    this.dropShadowColor = 0;
                    this.accentColor = 39423;
                    this.backgroundImageFillMode = "scale";
                    this.selectionColor = 11060974;
                    this.borderWeight = 1;
                    this.focusRoundedCorners = "tl tr bl br";
                    this.paddingRight = 0;
                    this.borderSides = "left top right bottom";
                    this.disabledIconColor = 0x999999;
                    this.textJustify = "interWord";
                    this.focusColor = 7385838;
                    this.borderVisible = true;
                    this.selectionDuration = 250;
                    this.typographicCase = "default";
                    this.highlightAlphas = [0.3, 0];
                    this.fillColor = 0xFFFFFF;
                    this.textRollOverColor = 0;
                    this.rollOverOpenDelay = 200;
                    this.digitCase = "default";
                    this.shadowCapColor = 14015965;
                    this.inactiveTextSelectionColor = 0xE8E8E8;
                    this.backgroundAlpha = 1;
                    this.justificationRule = "auto";
                    this.roundedBottomCorners = true;
                    this.dropShadowVisible = false;
                    this.trackingRight = 0;
                    this.fillColors = [0xFFFFFF, 0xCCCCCC, 0xFFFFFF, 0xEEEEEE];
                    this.horizontalGap = 8;
                    this.borderCapColor = 9542041;
                    this.leadingModel = "auto";
                    this.selectionDisabledColor = 0xDDDDDD;
                    this.closeDuration = 50;
                    this.embedFonts = false;
                    this.letterSpacing = 0;
                    this.focusAlpha = 0.55;
                    this.borderAlpha = 1;
                    this.baselineShift = 0;
                    this.focusedTextSelectionColor = 11060974;
                    this.borderSkin = BorderSkin;
                    this.fontSharpness = 0;
                    this.modalTransparencyDuration = 100;
                    this.justificationStyle = "auto";
                    this.borderStyle = "inset";
                    this.contentBackgroundAlpha = 1;
                    this.textRotation = "auto";
                    this.fontAntiAliasType = "advanced";
                    this.errorColor = 0xFE0000;
                    this.direction = "ltr";
                    this.cffHinting = "horizontalStem";
                    this.horizontalGridLineColor = 0xF7F7F7;
                    this.locale = "en";
                    this.cornerRadius = 2;
                    this.modalTransparencyColor = 0xDDDDDD;
                    this.disabledAlpha = 0.5;
                    this.textIndent = 0;
                    this.verticalGridLineColor = 14015965;
                    this.themeColor = 7385838;
                    this.tabStops = null;
                    this.modalTransparency = 0.5;
                    this.smoothScrolling = true;
                    this.columnWidth = "auto";
                    this.textAlign = "start";
                    this.horizontalScrollPolicy = "auto";
                    this.textSelectedColor = 0;
                    this.whiteSpaceCollapse = "collapse";
                    this.fontGridFitType = "pixel";
                    this.horizontalGridLines = false;
                    this.fullScreenHideControlsDelay = 3000;
                    this.useRollOver = true;
                    this.repeatDelay = 500;
                    this.focusThickness = 2;
                    this.verticalGap = 6;
                    this.disabledColor = 11187123;
                    this.modalTransparencyBlur = 3;
                    this.slideDuration = 300;
                    this.color = 0;
                    this.fixedThumbSize = false;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "dateFieldPopup");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".dateFieldPopup");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.backgroundColor = 0xFFFFFF;
                    this.dropShadowVisible = true;
                    this.borderThickness = 1;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "errorTip");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".errorTip");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.fontWeight = "bold";
                    this.borderStyle = "errorTipRight";
                    this.paddingTop = 4;
                    this.borderColor = 13510953;
                    this.color = 0xFFFFFF;
                    this.fontSize = 10;
                    this.shadowColor = 0;
                    this.paddingLeft = 4;
                    this.paddingBottom = 4;
                    this.paddingRight = 4;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "headerDragProxyStyle");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".headerDragProxyStyle");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.fontWeight = "bold";
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "swatchPanelTextField");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".swatchPanelTextField");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.borderStyle = "inset";
                    this.borderColor = 14015965;
                    this.highlightColor = 12897484;
                    this.backgroundColor = 0xFFFFFF;
                    this.shadowCapColor = 14015965;
                    this.shadowColor = 14015965;
                    this.paddingLeft = 5;
                    this.buttonColor = 7305079;
                    this.borderCapColor = 9542041;
                    this.paddingRight = 5;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "todayStyle");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".todayStyle");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.color = 0;
                    this.textAlign = "center";
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "weekDayStyle");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".weekDayStyle");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.fontWeight = "bold";
                    this.textAlign = "center";
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "windowStatus");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".windowStatus");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.color = 0x666666;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "windowStyles");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".windowStyles");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.fontWeight = "bold";
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.controls.Button", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.Button");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.textAlign = "center";
                    this.labelVerticalOffset = 1;
                    this.emphasizedSkin = DefaultButtonSkin;
                    this.verticalGap = 2;
                    this.horizontalGap = 2;
                    this.skin = ButtonSkin;
                    this.paddingLeft = 6;
                    this.paddingRight = 6;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.core.Container", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.core.Container");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.borderStyle = "none";
                    this.borderSkin = ContainerBorderSkin;
                    this.cornerRadius = 0;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.managers.CursorManager", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.managers.CursorManager");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.busyCursor = BusyCursor;
                    this.busyCursorBackground = _embed_css_Assets_swf_mx_skins_cursor_BusyCursor_452229285;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.managers.DragManager", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.managers.DragManager");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_804225227;
                    this.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_804513135;
                    this.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_796535663;
                    this.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_804487494;
                    this.defaultDragImageSkin = DefaultDragImage;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.controls.HRule", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.HRule");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.strokeColor = 12897484;
                    this.strokeWidth = 2;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.controls.scrollClasses.ScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.scrollClasses.ScrollBar");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.thumbOffset = 0;
                    this.paddingTop = 0;
                    this.trackSkin = ScrollBarTrackSkin;
                    this.downArrowSkin = ScrollBarDownButtonSkin;
                    this.upArrowSkin = ScrollBarUpButtonSkin;
                    this.paddingLeft = 0;
                    this.paddingBottom = 0;
                    this.thumbSkin = ScrollBarThumbSkin;
                    this.paddingRight = 0;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.controls.SWFLoader", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.SWFLoader");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.brokenImageSkin = _embed_css_Assets_swf___brokenImage_685444021;
                    this.brokenImageBorderSkin = BrokenImageBorderSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "textAreaVScrollBarStyle");
            conditions.push(condition);
            selector = new CSSSelector("mx.controls.HScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.HScrollBar.textAreaVScrollBarStyle");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "textAreaHScrollBarStyle");
            conditions.push(condition);
            selector = new CSSSelector("mx.controls.VScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.VScrollBar.textAreaHScrollBarStyle");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("mx.controls.ToolTip", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.ToolTip");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.borderStyle = "toolTip";
                    this.paddingTop = 2;
                    this.borderColor = 9542041;
                    this.backgroundColor = 16777164;
                    this.borderSkin = ToolTipBorder;
                    this.cornerRadius = 2;
                    this.fontSize = 10;
                    this.paddingLeft = 4;
                    this.paddingBottom = 2;
                    this.backgroundAlpha = 0.95;
                    this.paddingRight = 4;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.Application", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Application");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.backgroundColor = 0xFFFFFF;
                    this.skinClass = ApplicationSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.Button", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Button");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = ButtonSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = [];
            condition = new CSSCondition("class", "emphasized");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.Button", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Button.emphasized");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = DefaultButtonSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.CheckBox", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.CheckBox");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = CheckBoxSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.ComboBox", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.ComboBox");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.paddingTop = 5;
                    this.skinClass = ComboBoxSkin;
                    this.dropShadowVisible = true;
                    this.paddingLeft = 3;
                    this.paddingBottom = 3;
                    this.paddingRight = 3;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.HScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.HScrollBar");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = HScrollBarSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.HSlider", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.HSlider");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = HSliderSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.List", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.List");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.dragIndicatorClass = ListItemDragProxy;
                    this.skinClass = ListSkin;
                    this.dropIndicatorSkin = ListDropIndicator;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.Scroller", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Scroller");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = ScrollerSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.SkinnableDataContainer", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.SkinnableDataContainer");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = SkinnableDataContainerSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.supportClasses.SkinnableComponent", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableComponent");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.focusSkin = FocusSkin;
                    this.errorSkin = ErrorSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.SkinnableContainer", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.SkinnableContainer");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = SkinnableContainerSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.TextArea", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TextArea");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.paddingTop = 5;
                    this.skinClass = TextAreaSkin;
                    this.paddingLeft = 3;
                    this.paddingBottom = 3;
                    this.paddingRight = 3;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.TextInput", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TextInput");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.paddingTop = 5;
                    this.skinClass = TextInputSkin;
                    this.paddingLeft = 3;
                    this.paddingBottom = 3;
                    this.paddingRight = 3;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.VScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.VScrollBar");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = VScrollBarSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
            selector = null;
            conditions = null;
            conditions = null;
            selector = new CSSSelector("spark.components.VSlider", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.VSlider");
            style = new CSSStyleDeclaration(selector, styleManager, (mergedStyle == null));
            if (style.defaultFactory == null){
                style.defaultFactory = function ():void{
                    this.skinClass = VSliderSkin;
                };
            };
            if (((!((mergedStyle == null))) && ((((mergedStyle.defaultFactory == null)) || (ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))))){
                styleManager.setStyleDeclaration(style.mx_internal::selectorString, style, false);
            };
        }

    }
}//package 
