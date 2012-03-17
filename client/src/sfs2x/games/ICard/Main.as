/****************************************************************************/
// Main
// 
// This is the ICard document class that handles the states of the game. 
// It instantiate the LoginScene, ChatScene and GameScene according to the 
// SmartFoxServer states.   
// On the stage there is the SmartFoxBits Connector which handles SmartFoxServer 
// events and show the connection status to the user by means of a green/red led.
// 
// This class also contains global variables and act just like a singleton 
// for other classes.  
//
// (c) 2011 The gotoAndPlay() Team
/****************************************************************************/

package sfs2x.games.ICard
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
	
	// Import custom ICard classes
	import sfs2x.games.ICard.scenes.*;
	
	/**
	 * Main document class
	 */
	public class Main extends MovieClip 
	{
		// SmartFox main instance
		public var smartFox          : SmartFox;
		
		// Login scene reference
		public var loginScene        : LoginScene;
		
		// Chat scene reference
		public var chatScene         : ChatScene;
		
		// Game scene reference
		public var gameScene         : GameScene;
				
		// Player's avatar type
		public var myAvatar          : String = "";
		
		// Available avatars
		public var avatars           : Array  = ["cow", "cat", "cock", "pig"];
		
		// Map handler variables
		public var availableMaps     : Array = null;
		public var availableMapsById : Array = null;
		
		public var selectedMapIndex  : int    = 0;
	 	
		// Global sound handler
		public var soundEnabled      : Boolean = true;
		
		// Enable/disable trace messages
		private var debugLogging     : Boolean = false;
		
		// Sound handling
		private var sndTrack         : Sound;
		private var soundChannel     : SoundChannel;
		private var soundVolume      : Number = 1;
		
		// Embed custom font for skinning
		public var txtFont           : BerlinSansFBDemi = new BerlinSansFBDemi();
		
		/**
		 * Constructor
		 */
		public function Main():void 
		{			
			trace("come here");
			this.stop();
			preloader.addEventListener(Event.COMPLETE, initICard);
		}
		
		/**
		 * When loading is complete, initialize ICard
		 */
		private function initICard(evt:Event):void 
		{
			d_trace("Main - initICard");
			
			// Remove the preloader
			preloader.removeEventListener(Event.COMPLETE , initICard);
			removeChild(preloader);
			
			sndTrack = new SoundTrack();
			
			btnSoundOff.visible       = false;
			btnSoundOff.buttonMode    = true;
			btnSoundOff.useHandCursor = true;
			btnSoundOff.addEventListener(MouseEvent.CLICK, onSoundOffClick);
			
			btnSoundOn.visible        = true;
			btnSoundOn.buttonMode     = true;
			btnSoundOn.useHandCursor  = true;
			btnSoundOn.addEventListener(MouseEvent.CLICK, onSoundOnClick);
			
			// Start the soundtrack
			playSoundtrack(soundVolume);
						
			// Apply skin
			skinComponents();
			
			// Show login page
			showLoginScene();
		}
		
		/**
		 * Turn on game sound
		 */	
		private function onSoundOffClick(evt:MouseEvent):void
		{
			d_trace("Main - onSoundOffClick");
			
			soundEnabled        = true;
			btnSoundOn.visible  = true;
			btnSoundOff.visible = false;
			
			playSoundtrack(soundVolume);
		}
		
		/**
		 * Turn off game sound
		 */
		private function onSoundOnClick(evt:MouseEvent):void
		{
			d_trace("Main - onSoundOnClick");
			
			soundEnabled        = false;
			btnSoundOn.visible  = false;
			btnSoundOff.visible = true;
			
			stopSoundTrack();
		}

		/**
		 * Show the avatar selection and login form
		 */
		private function showLoginScene():void
		{			
			d_trace("Main - showLoginScene");

			connector_mc.visible  = true;
			connector_mc.x =690;
			connector_mc.y =740;
			
			
			if (!loginScene)
			{
				smartFox = connector_mc.connection;
				
				loginScene = new LoginScene();
				loginScene.addEventListener("GOTO_CHAT_SCENE", onGotoChat);
				addChildAt(loginScene, numChildren-3);
				
				loginScene.init(this);
			}
			else
				loginScene.visible = true;
		}
		
		/**
		 * After login show the lobby/chat scene
		 */
		private function onGotoChat(evt:Event):void 
		{
			loginScene.visible = false;
			showChatScene();
		}
		
		private function showChatScene():void
		{
			d_trace("Main - showChatScene");

			soundVolume = 0.2;
			playSoundtrack(soundVolume);
			
			btnSoundOn.visible    = soundEnabled;
			btnSoundOff.visible   = !soundEnabled;			
			
			
			// reset maps
			availableMaps     = new Array();
			availableMapsById = new Array();
			
			chatScene = new ChatScene();
			addChildAt(chatScene, numChildren-3);
			
			chatScene.init(this);
			chatScene.addEventListener("GOTO_GAME_SCENE" , onGotoGame);
			chatScene.addEventListener("CONNECTION_LOST", onConnectionLost);
		}		
		
		/**
		 * Show the main game scene
		 */
		private function onGotoGame(evt:Event):void 
		{
			chatScene.finalize();
			chatScene.removeEventListener("GOTO_GAME_SCENE" , onGotoGame);
			chatScene.removeEventListener("CONNECTION_LOST", onConnectionLost);
			removeChild(chatScene);
			chatScene = null;
			
			showGameScene();
		}
		
		private function showGameScene():void
		{
			d_trace("Main - showGameScene");

			btnSoundOn.visible    = false;
			btnSoundOff.visible   = false;			
		
			
			gameScene = new GameScene();
			addChildAt(gameScene, numChildren-3);						
			
			gameScene.init(this);
			gameScene.addEventListener("EXIT_GAME", onExitGame);
			gameScene.addEventListener("CONNECTION_LOST", onConnectionLost);
		}
		
		/**
		 * When the game is over, remove game scene and show chat scene
		 */
		private function onExitGame(evt:Event):void
		{			
			d_trace("Main - onExitGame");

			gameScene.finalize();
			gameScene.removeEventListener("EXIT_GAME"      , onExitGame);
			gameScene.removeEventListener("CONNECTION_LOST", onConnectionLost);
			removeChild(gameScene);
			gameScene = null;
			
			showChatScene();
		}
		
		/**
		 * Handle connection lost event
		 */
		private function onConnectionLost(evt:Event):void
		{
			d_trace("Main - onConnectionLost");
				
			// If current scene is lobby
			if (chatScene != null)
			{
				d_trace("Main - onConnectionLost - remove chat scene");
				
				chatScene.finalize();
				chatScene.removeEventListener("GOTO_GAME_SCENE" , onGotoGame);
				chatScene.removeEventListener("CONNECTION_LOST", onConnectionLost);
				removeChild(chatScene);
				chatScene = null;
			}
			
			// If current scene is game
			if (gameScene != null)
			{
				d_trace("Main - onConnectionLost - remove game scene");
				
				gameScene.finalize();
				gameScene.removeEventListener("EXIT_GAME"      , onExitGame);
				gameScene.removeEventListener("CONNECTION_LOST", onConnectionLost);
				removeChild(gameScene);
				gameScene = null;
			}
			
			showLoginScene();
		}
		
		
		/* SKIN UTILITIES *****************************************************************************************************/		
		private function skinComponents():void
		{
			d_trace("Main - skinComponents");
			
			// Small font
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.font           = txtFont.fontName;
			txtFormat.size           = 14;
			txtFormat.color          = "0x350000";
			
			// Connector label
			(connector_mc.statusLabel as Label).setStyle("embedFonts", true);
			(connector_mc.statusLabel as Label).setStyle("textFormat", txtFormat);
		}
		
		
		/* SOUND UTILITIES ****************************************************************************************************/		
		private function playSoundtrack(vol:Number):void
		{
			d_trace("Main - playSoundtrack - " + vol);

			var sndTransform:SoundTransform = new SoundTransform();
			sndTransform.volume = vol;

			if (soundEnabled)
			{
				if (soundChannel)
					soundChannel.stop();
					
				soundChannel = sndTrack.play(0, 999999);
				soundChannel.soundTransform = sndTransform;
			}
		}
		
		private function stopSoundTrack():void
		{
			d_trace("Main - stopSoundTrack");
			soundChannel.stop();
		}
		
		
		/* DEBUG UTILITIES ****************************************************************************************************/		
		private function d_trace(debugMsg:String):void
		{
			if (debugLogging)
				trace(debugMsg);
		}
	}
}