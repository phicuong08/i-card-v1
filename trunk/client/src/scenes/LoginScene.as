/***************************************************************/
// LoginScene 
// 
// This class instantiates the scene where player inputs 
// the nickname and selects the avatar in successful
// connection to SmartFoxServer (handled by the SmartFoxBits Connector 
// in the document class). Once the user is connected and logged,
// dispatch a GOTO_CHAT_SCENE event to the document class.
//  
// (c) 2011 The gotoAndPlay() Team
/***************************************************************/

package sfs2x.games.battlefarm.scenes
{
	// Import Flash classes
	import flash.media.*;
	import fl.controls.*;	
	import flash.events.*;
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import flash.display.MovieClip;
	import flash.display.LoaderInfo;
	import flash.media.SoundChannel;
	import flash.net.LocalConnection;

    // Import SmartFoxServer 2X classes
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.requests.*;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.data.*;

	public class LoginScene extends MovieClip
	{				
		// Keeps the reference to the main document class
		private var refDocument:*;

		// Wnable/disable trace messages for this class
		private var debugLogging: Boolean = false;

		/**
		 * Empty constructor
		 */
		public function LoginScene()
		{
		}
		
		
		/* LOGIN PAGE INITIALIZATIONS ******************************************************************************/
		public function init(refDoc:*):void 
		{
			// Get the reference to the Document Class
			refDocument = refDoc;
		
			d_trace("------------------------------------------------------");
			d_trace("LoginScene - init");
		
			// Prepare avatars for user selection (random by default)
			setAvatarSelector();

			// Apply components skin and fonts
			skinComponents();

			// Load xml configuration
			loadConfig();
		}
		
		/**
		 * Initialize avatars selector
		 */
		private function setAvatarSelector():void
		{
			d_trace("LoginScene - setAvatarSelector");
			
			// Select random avatar
			var avNum:int = Math.floor(Math.random() * refDocument.avatars.length);
			refDocument.myAvatar = refDocument.avatars[avNum];
		
			// Cow avatar button
			avatarSelector.cow.useHandCursor  = true;
			avatarSelector.cow.buttonMode     = true;
			avatarSelector.cow.addEventListener(MouseEvent.CLICK, onChangeAvatar);
			
			// Cat avatar button
			avatarSelector.cat.useHandCursor = true;
			avatarSelector.cat.buttonMode    = true;
			avatarSelector.cat.addEventListener(MouseEvent.CLICK, onChangeAvatar);
			
			// Cock avatar button
			avatarSelector.cock.useHandCursor = true;
			avatarSelector.cock.buttonMode    = true;
			avatarSelector.cock.addEventListener(MouseEvent.CLICK, onChangeAvatar);
			
			// Pig avatar button
			avatarSelector.pig.useHandCursor = true;
			avatarSelector.pig.buttonMode    = true;
			avatarSelector.pig.addEventListener(MouseEvent.CLICK, onChangeAvatar);
		}
		
		private function loadConfig():void
		{
			d_trace("LoginScene - loadConfig");

			// Activate smartfox listeners 
			refDocument.smartFox.addEventListener(SFSEvent.CONFIG_LOAD_FAILURE , onConfigLoadFailure);
			refDocument.smartFox.addEventListener(SFSEvent.CONFIG_LOAD_SUCCESS , onConfigLoadSuccess);
			refDocument.smartFox.addEventListener(SFSEvent.CONNECTION          , onConnection);
			refDocument.smartFox.addEventListener(SFSEvent.CONNECTION_LOST     , onConnectionLost);
			refDocument.smartFox.addEventListener(SFSEvent.LOGIN               , onLogin);
			
			// Load smartfox XML config file
			// A separate config file is loaded in case we need to force the BlueBox usage
			// (a parameter passed by the html page to the swf file url forces this)
			if (root.loaderInfo.parameters.conn == "http")
				refDocument.smartFox.loadConfig("config/sfs-config_http.xml", true);
			else
				refDocument.smartFox.loadConfig("config/sfs-config_socket.xml", true);
		}			
		
			
		/* SMARTFOX CALLBACKS **********************************************************************************/
		private function onConfigLoadFailure(evt:SFSEvent):void
		{
			// Config file load error
			d_trace("LoginScene - Config load failure!");
		}
		
		private function onConfigLoadSuccess(evt:SFSEvent):void
		{
			// Config file loaded
			d_trace("LoginScene - Config loaded successfully!");
		}
				
		private function onConnection(evt:SFSEvent):void
		{
			if (evt.params.success)
			{
				d_trace("LoginScene - Connection successful!");
				avatarSelector.gotoAndStop(refDocument.myAvatar);
			}
			else
				d_trace("LoginScene - Connection failed: " + evt.params.errorMessage);
		}
		
		private function onConnectionLost(evt:SFSEvent):void
		{
			d_trace("LoginScene - Connection was lost. Reason: " + evt.params.reason);
		}
      
	  	private function onLogin(evt:Event):void 
		{
			d_trace("LoginScene - onLogin")

			// After successful login, move to chat scene
			dispatchEvent(new Event("GOTO_CHAT_SCENE"));	
		}


		/* INTERFACE HANDLERS **********************************************************************************/
		private function onChangeAvatar(evt:Event):void 
		{
			d_trace("LoginScene - onChoseAvatar");
			
			// move the selector over the selected avatar and set player's avatar variable
			avatarSelector.gotoAndStop(evt.target.name);
			refDocument.myAvatar = evt.target.name;
		}
		
		
		/* SKIN UTILITIES *****************************************************************************************************/				
		private function skinComponents():void
		{
			d_trace("LoginScene - skinComponents");

			// Large font
			var txtFormatBig:TextFormat   = new TextFormat();
			txtFormatBig.font             = refDocument.txtFont.fontName;
			txtFormatBig.size             = 18;
			txtFormatBig.color            = "0xFFFFFF";

			// Small font
			var txtFormatSmall:TextFormat = new TextFormat();
			txtFormatSmall.font           = refDocument.txtFont.fontName;
			txtFormatSmall.size           = 14;
			txtFormatSmall.color          = "0x6B6B6B";

			// Error font
			var txtFormatError:TextFormat = new TextFormat();
			txtFormatError.font           = refDocument.txtFont.fontName;
			txtFormatError.size           = 11;
			txtFormatError.color          = "0xFF0000";

			// Disabled font
			var txtFormatDisab:TextFormat = new TextFormat();
			txtFormatDisab.font           = refDocument.txtFont.fontName;
			txtFormatDisab.size           = 18;
			txtFormatDisab.color          = "0x909090";

			// Login text
			loginBox_mc.usernameLabelText = "";
			loginBox_mc.usernameTextInput.maxChars = 8;
			loginBox_mc.usernameTextInput.height   = 28;
			loginBox_mc.usernameTextInput.setStyle("embedFonts", true);
			loginBox_mc.usernameTextInput.setStyle("textFormat", txtFormatSmall);
			
			// Login error
			loginBox_mc.errorLabel.setStyle("embedFonts", true);
			loginBox_mc.errorLabel.setStyle("textFormat", txtFormatError);

			// Login button
			loginBox_mc.loginButton.width  = 75;
			loginBox_mc.loginButton.height = 28;
			loginBox_mc.loginButton.height = 28;
			loginBox_mc.loginButton.buttonMode = true;
			loginBox_mc.loginButton.useHandCursor = true;
			loginBox_mc.loginButton.setStyle("embedFonts", true);
			loginBox_mc.loginButton.setStyle("textFormat", txtFormatBig);
			loginBox_mc.loginButton.setStyle("disabledTextFormat", txtFormatDisab);			
		}			
		
		
		/* DEBUG UTILITIES ****************************************************************************************************/		
		private function d_trace(debugMsg:String):void
		{
			if (debugLogging)
				trace(debugMsg);
		}
	}
}