/***********************************************************************/
// GameScene 
// 
// This class is responsible of all the game logic. It activates as
// a player joins a game room and stays alive until the player manually 
// exits or disconnects. All the game functions are handled by the
// onGameExtensionResponse method.
// 
// (c) 2011 The gotoAndPlay() Team
/***********************************************************************/

package sfs2x.games.ICard.scenes
{
	// Import Flash classes
	import flash.media.*;
	import fl.controls.*;	
	import flash.events.*;
	import flash.utils.Timer;
	import flash.ui.Keyboard;
	import flash.display.Sprite;
	import flash.utils.getTimer;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.text.TextFormat;
	import flash.display.MovieClip;
	import flash.display.LoaderInfo;
	import flash.net.LocalConnection;
	import flash.utils.getDefinitionByName;

    // Import SmartFoxServer 2X classes
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.requests.*;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.data.*;
	
	public class GameScene extends MovieClip
	{
		// Keeps the reference to the main document class
		private var refDocument         : *;
				
		// Map constants
		private const mapW              : int = 20;
		private const mapH              : int = 16;
		private const tileSize          : int = 32;

		// Popup constants 
		private const POPUP_NONE        : String = "popup_none";
		private const POPUP_WAITING     : String = "popup_waiting";
		private const POPUP_READY       : String = "popup_ready";
		private const POPUP_PLAYER_LOST : String = "popup_playerLost";
		private const POPUP_MATCH_END   : String = "popup_matchEnd";
		
		private var popup               : MovieClip	= null;
		
		// Input variables 
		private var KEY_UP_PRESSED      : Boolean = false;
		private var KEY_DOWN_PRESSED    : Boolean = false;
		private var KEY_LEFT_PRESSED    : Boolean = false;
		private var KEY_RIGHT_PRESSED   : Boolean = false;		
		private var KEY_SPACE_PRESSED   : Boolean = false;
		
		// Game variables
		private var chatFocus           : Boolean   = false;
		private var gameStarted         : Boolean   = false;
		private var collectibles        : String    = "";
		private var opponentName        : String    = "";
		private var opponentAvatar      : String    = "";
		private var gameMap             : Array	    = null;
		private var pickupItems         : Array	    = null;
		private var myBombsArr          : Array		= null;		
		private var myPlayer            : Object    = null;
		private var opPlayer            : Object    = null;
		private var currentMapData      : Object    = null;
		private var myPlayerId          : int       = -1;			
		private var gameDuration        : int       = 60;
		private var startTime           : int		= 0;
		private var oppPlayerId         : int       = -1;
		private var myMatches           : int		= 0;
		private var opMatches           : int		= 0;	
		private var averagePing         : int       = 0;
		private var pingCount           : int       = 0;
		private var playerSpeed         : int		= 180;
		private var player1Id           : int       = -1;
		private var player2Id           : int       = -1;
		private var itemTax             : int		= 3;
		private var lastKeyPress        : Number	= getTimer();
		private var keySpaceDelay       : Number	= 100;
		private var bombMax             : int       = 3;

		private var arrTaunts           : Array     = ["Ouch!", "Aaargh!", "Son of a ...", "Damn!", "Go to hell", "WTF!", "!?$@#!!"];
		private var dirs                : Array	    = [{ax:-1, ay:0}, {ax:1, ay:0},	{ax:0, ay:-1}, {ax:0, ay:1}]; // Left, Right, Up, Down

		private var gameTimer           : Timer;						
								
		// Lose collectible tweens
		private var collTweenX          : Tween;
		private var collTweenY          : Tween;			
								
		// Init game sounds from library
		private var bombDrop_snd        : BombDrop    = new BombDrop();
		private var bombExplode_snd     : BombExplode = new BombExplode();
		private var matchStart_snd      : MatchStart  = new MatchStart();
		private var matchEnd_snd        : MatchEnd    = new MatchEnd();
		private var doorOpen_snd        : DoorOpen    = new DoorOpen();
		private var fruitPick_snd       : FruitPick   = new FruitPick();
		
		// Snable/disable trace messages
		private var debugLogging        : Boolean = false;			
		
		/**
 		* Empty constructor
 		*/
		public function GameScene()
		{
		}
		
		/* GAME SCENE INITIALIZATIONS ******************************************************************************/
		public function init(refDoc:*):void 
		{			
			// Get the references to the Document Class
			refDocument = refDoc;
			
			d_trace("------------------------------------------------------");
			d_trace("GameScene - init");
			
			// Apply components skin and font
			skinComponents();			
			
			// Init stuff and SmartFox listeners
			initListeners();
		}
						
		private function initListeners():void
		{
			d_trace("GameScene - initListeners");
			
			myPlayerId = refDocument.smartFox.mySelf.id;
			
			// Set exit button 
			exit_bt.buttonMode    = true;
			exit_bt.useHandCursor = true;
			exit_bt.addEventListener(MouseEvent.CLICK, exitGame);
			
			// Handle player keys event
			stage.addEventListener(KeyboardEvent.KEY_UP  , onGameKeyUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onGameKeyDown);
			chatBox_mc.setFocus();
			
			popup = showPopup(POPUP_WAITING);
			
			// Activate SmartFox listeners
			refDocument.smartFox.addEventListener(SFSEvent.CONNECTION_LOST      , onConnectionLost);
			refDocument.smartFox.addEventListener(SFSEvent.EXTENSION_RESPONSE   , onGameExtensionResponse);
			
			// Tell the server that player is ready to start the game
			refDocument.smartFox.send(new ExtensionRequest("ready", new SFSObject()));
		}			

		private function removeListeners():void
		{
			d_trace("GameScene - removeListeners");
			
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onGameKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP  , onGameKeyUp);

			exit_bt.removeEventListener(MouseEvent.CLICK, exitGame);
			
			// Deactivate smartfox listeners
			refDocument.smartFox.removeEventListener(SFSEvent.CONNECTION_LOST     , onConnectionLost);
			refDocument.smartFox.removeEventListener(SFSEvent.EXTENSION_RESPONSE  , onGameExtensionResponse);
		}			
		
		public function finalize():void
		{
			d_trace("GameScene - finalize");
			
			if (gameTimer)
			{
				if (gameTimer.running)
					gameTimer.stop();
					
				if (gameTimer.hasEventListener(TimerEvent.TIMER))
					gameTimer.removeEventListener(TimerEvent.TIMER, updateTimer);
				
				gameTimer = null;
			}				
						
			gameStarted = false;
			removeListeners();
		}		
		
		/**
		 * Shows a popup window and disables all other controls
		 */
		function showPopup(popupKind:String):MovieClip
		{
			d_trace("GameScene - showPopup " + popupKind);

			// remove previous popup, if any
			if (popup != null)
			{
				removeChild(popup);
				popup = null;
			}
			
			var popupWin:* = null;
			
			switch(popupKind)
			{
				case POPUP_NONE        : break;
				
				case POPUP_WAITING     : popupWin = new PopupWaiting();
										 break;
										 
				case POPUP_READY       : popupWin = new PopupReady();
										 break;
										 
				case POPUP_PLAYER_LOST : popupWin = new PopupPlayerLost();
										 break;
										 
				case POPUP_MATCH_END   : popupWin = new PopupMatchEnd();
										 break;
										 
				default                : break;
			}
			
			if (popupWin != null)
			{
				popupWin.x = (this.width / 2)  - (popupWin.width / 2);
				popupWin.y = (this.height / 2) - (popupWin.height / 2) - 60;
				addChild(popupWin);
			}
			
			return popupWin;
		}
		
		
		/* SMARTFOX CALLBACKS **********************************************************************************/
		private function onConnectionLost(evt:SFSEvent):void
		{
			d_trace("GameScene - onConnectionLost");
			dispatchEvent(new Event("CONNECTION_LOST"));
		}
				
		private function onGameExtensionResponse(evt:SFSEvent):void
		{
			d_trace("GameScene - onGameExtensionResponse " + evt.params.cmd);
			
			var extParams:SFSObject = evt.params.params;
			
			switch(evt.params.cmd)
			{
				case "map"  : initGameMap(extParams);
							  break;
								
				case "go"   : startGame();
							  break;
				
				case "mv"   : handleOpponentMove(extParams.getInt("px"), extParams.getInt("py"));
							  break;
								
				case "bb"   : handleOpponentBomb(extParams.getInt("bId"), extParams.getInt("bx"), extParams.getInt("by"));
							  break;

				case "gi"   : handlePickItem(extParams.getInt("px"), extParams.getInt("py"), extParams.getInt("who"), extParams.getInt("sc"));
							  break;

				case "xp"   : handleExplosion(extParams.getInt("bb"), extParams.getInt("uid"), extParams.getInt("bx"), extParams.getInt("by"), extParams.getInt("kp1"), extParams.getUtfString("it1"), extParams.getInt("kp2"), extParams.getUtfString("it2"), extParams.getInt("sc1"), extParams.getInt("sc2"));
							  break;
				
				case "od"   : handleOpenDoor(extParams.getInt("px"), extParams.getInt("py"));
							  break;
				
				case "win"  : handleWinner(extParams.getInt("id"));
							  break;
				
				case "stop" : handleStopGame();
							  break;

				default		: break;
			}
		}


		/* GAME FUNCTIONS **************************************************************************************/

		/**
		 * Init game map
		 */
		private function initGameMap(gameParams:SFSObject):void
		{
			d_trace("GameScene - initGameMap - " + gameParams);

			player1Id = gameParams.getInt("pId1");
			player2Id = gameParams.getInt("pId2");
			
			// Extend current map data with extension's parameters 
			currentMapData            = refDocument.availableMaps[refDocument.selectedMapIndex];
			currentMapData.background = gameParams.getUtfString("bg");
			currentMapData.foreground = gameParams.getUtfString("fg");
			currentMapData.duration   = gameParams.getInt("dur");
			currentMapData.p1x        = gameParams.getInt("p1x");
			currentMapData.p1y        = gameParams.getInt("p1y");
			currentMapData.p2x        = gameParams.getInt("p2x");
			currentMapData.p2y        = gameParams.getInt("p2y");
			currentMapData.rowTiles   = new Array();
			
			for (var i:int = 0; i < mapH; i++)
				currentMapData.rowTiles[i] = gameParams.getUtfString(i.toString());
			
			collectibles       = gameParams.getUtfString("coll");
			gameDuration       = currentMapData.duration;
						
			timer_bg.gotoAndStop(1);
			showTime(gameDuration);
						
			// Clear the gameClip in case of restart
			if(gameClip.numChildren != 0)
			{
				var n:int = gameClip.numChildren;
				while(n--)
					  gameClip.removeChildAt(n);
			}			
						
			// Create the game map
			setupMap();
									
			// Init players
			initPlayers();

			// Show "ready" message
			popup = showPopup(POPUP_READY);
		}
	
		private function setupMap():void
		{
			d_trace("GameScene - setupMap");
			
			gameMap = new Array();
			
			// Set background
			var bgClass:* = getDefinitionByName("bg_" + currentMapData.background);
			gameClip.addChild(new bgClass());
						
			// Set tiles
			var itemId:Number = 0;
			pickupItems = new Array();
			
			for (var i:int = 0; i < mapH; i++)
			{
				var line:String = currentMapData.rowTiles[i];
				
				gameMap[i] = new Array();
				
				for (var j:int = 0; j < line.length; j++)
				{
					var brick:MovieClip;
					var brickClass:*;
					var c:String = line.charAt(j);
										
					gameMap[i][j] = c;
					
					if (c.charCodeAt(0) >= 65 && c.charCodeAt(0) <= 90)
					{
						// Create obstacle
						brickClass = getDefinitionByName("brick_" + c);
						brick      = new brickClass();
						brick.name = "brick_" + j + "_" + i;
					}
					else if (c.charCodeAt(0) >= 97 && c.charCodeAt(0) <= 122)
					{
						// Create collectible item
						brickClass = getDefinitionByName("coll_" + c);
						brick      = new brickClass();
						brick.name = "brick_" + j + "_" + i;
						
						// Store the collectible item
						pickupItems[itemId] = brick;
					}
					else
					{
						// Empty tile
						brickClass = getDefinitionByName("empty");
						brick      = new brickClass();
					}
					
					gameClip.addChild(brick);

					brick.x = tileSize * j;
					brick.y = tileSize * i;
				}
			}
			
			// Set foreground
			if (currentMapData.foreground != "")
			{
				var fgClass:* = getDefinitionByName("fg_" + currentMapData.foreground);
				gameClip.addChild(new fgClass());
			}
		}
		
		private function initPlayers():void
		{			
			d_trace("GameScene - initPlayers");
		
			// Retrieve my opponent avatar
			var room :SFSRoom = refDocument.smartFox.lastJoinedRoom;
			var users:Array   = room.userList;
			
			for (var u:int = 0; u<users.length; u++)
			{	
				if (!users[u].isItMe)				
				{
					oppPlayerId    = users[u].id;
					opponentAvatar = users[u].getVariable("avatar").getStringValue();
					opponentName   = users[u].name;
					
					break;
				}
			}

			// Display players' avatars
			var player1AvatarClass :* = getDefinitionByName(((myPlayerId == player1Id) ? "userIcon_" + refDocument.myAvatar : "userIcon_" + opponentAvatar));
			var player2AvatarClass :* = getDefinitionByName(((myPlayerId == player2Id) ? "userIcon_" + refDocument.myAvatar : "userIcon_" + opponentAvatar));			
			head_player1.avPlaceHolder.addChild(new player1AvatarClass());
			head_player2.avPlaceHolder.addChild(new player2AvatarClass());
		
			// Create player 1
			var p1Class:*    = getDefinitionByName("player_" + ((myPlayerId == player1Id) ? refDocument.myAvatar : opponentAvatar));
			var p1:MovieClip = new p1Class();
			p1.name          = "player"+player1Id.toString();
			p1.x 	         = currentMapData.p1x * tileSize;
			p1.y             = currentMapData.p1y * tileSize;
			p1.cacheAsBitmap = true;
			gameClip.addChild(p1);
			
			// Create player 1 bubble
			var bubble1Class:*    = getDefinitionByName("bubble");
			var bubble1:MovieClip = new bubble1Class();
			bubble1.name          = "bubble";
			bubble1.x             = 25;
			bubble1.y             = -bubble1.height;
			bubble1.visible       = false;
			p1.addChild(bubble1);
			
			// Create player 2
			var p2Class:*    = getDefinitionByName("player_" + ((myPlayerId == player2Id) ? refDocument.myAvatar : opponentAvatar));
			var p2:MovieClip = new p2Class();
			p2.name          = "player"+player2Id;
			p2.x 	         = currentMapData.p2x * tileSize;
			p2.y             = currentMapData.p2y * tileSize;
			p2.cacheAsBitmap = true;
			gameClip.addChild(p2);
																								
			// Create player 1 bubble
			var bubble2Class:*    = getDefinitionByName("bubble");
			var bubble2:MovieClip = new bubble2Class();
			bubble2.name          = "bubble";
			bubble2.x             = 25;
			bubble2.y             = -bubble2.height;
			bubble2.visible       = false;
			p2.addChild(bubble2);																								
																								
			// Show characters front position
			p1.gotoAndStop(4);
			p2.gotoAndStop(4);

			// Create my player object
			myPlayer             = new Object();
			myPlayer.movie       = ((myPlayerId == player1Id) ? p1 : p2);
			myPlayer.bubble      = ((myPlayerId == player1Id) ? bubble1 : bubble2);
			myPlayer.px 	     = myPlayer.movie.x / tileSize;
			myPlayer.py 	     = myPlayer.movie.y / tileSize;
			myPlayer.score       = 0;
			myPlayer.moves       = new Array();
			myPlayer.moving      = false;
			myPlayer.bubbleTimer = 0;

			// Create opponent player object
			opPlayer             = new Object(); 
			opPlayer.movie       = ((myPlayerId == player2Id) ? p1 : p2);
			opPlayer.bubble      = ((myPlayerId == player2Id) ? bubble1 : bubble2);
			opPlayer.px 	     = opPlayer.movie.x / tileSize;
			opPlayer.py 	     = opPlayer.movie.y / tileSize;
			opPlayer.score       = 0;
			opPlayer.moves       = new Array();
			opPlayer.moving      = false;
			opPlayer.bubbleTimer = 0;
								
			// Show player highlighter
			var highlighter_mc:MovieClip = new highlighter();
			gameClip.addChild(highlighter_mc);
			highlighter_mc.x = myPlayer.movie.x + tileSize / 2;
			highlighter_mc.y = myPlayer.movie.y + tileSize / 2;
			highlighter_mc.gotoAndPlay(2);
						
			// Set bombs array
			myBombsArr = new Array(bombMax);
			for (var i:int=0; i<bombMax; i++)
				 myBombsArr[i] = true;						
						
			// Update scores
			updateScores();
		}
		
		/**
		 * Set the labels in the upper screen
		 */
		private function updateScores():void
		{
			d_trace("GameScene - updateScores");
			
			var myScoreTxt :String = refDocument.smartFox.mySelf.name + " > Score: " + myPlayer.score + " | Matches: " + myMatches;
			var oppScoreTxt:String = opponentName + " > Score: " + opPlayer.score + " | Matches: " + opMatches;
			
			head_player1.name_txt.text = (myPlayerId == player1Id) ? myScoreTxt : oppScoreTxt;
			head_player2.name_txt.text = (myPlayerId == player2Id) ? myScoreTxt : oppScoreTxt;
		}
		
		/**
		 * The server tells player to start the game
		 */
		private function startGame():void
		{
			d_trace("GameScene - startGame");

			playSoundFx(matchStart_snd);
			
			// Remove "ready" message
			showPopup(POPUP_NONE);
			
			startTime = gameDuration;
			
			gameStarted = true;
			gameClip.cacheAsBitmap = true;
			gameClip.addEventListener(Event.ENTER_FRAME, mainThread); 
			
			timer_bg.gotoAndStop(1);
			showTime(startTime);
			
			// Remove old timer if any
			if (gameTimer)
			{
				if (gameTimer.running)
					gameTimer.stop();
					
				if (gameTimer.hasEventListener(TimerEvent.TIMER))
					gameTimer.removeEventListener(TimerEvent.TIMER, updateTimer);
				
				gameTimer = null;
			}				
				
			gameTimer = new Timer(1000);
			gameTimer.addEventListener(TimerEvent.TIMER, updateTimer);
			gameTimer.start();
		}
		
		/**
		 * The game main loop
		 */
		private function mainThread(evt:Event):void
		{
			//d_trace("GameScene - mainThread");

			if (gameStarted)
			{
				if(!myPlayer.moving)
				{
					// Move player's character
					if(KEY_LEFT_PRESSED && (gameMap[myPlayer.py][myPlayer.px - 1].charCodeAt(0) < 65 || gameMap[myPlayer.py][myPlayer.px - 1].charCodeAt(0) > 90))
					{
						sendMyMove(myPlayer.px - 1, myPlayer.py);
						moveByTime(myPlayer, myPlayer.px - 1, myPlayer.py, playerSpeed);
					}
					else if(KEY_RIGHT_PRESSED && (gameMap[myPlayer.py][myPlayer.px + 1].charCodeAt(0) < 65 || gameMap[myPlayer.py][myPlayer.px + 1].charCodeAt(0) > 90))
					{
						sendMyMove(myPlayer.px + 1, myPlayer.py);
						moveByTime(myPlayer, myPlayer.px + 1, myPlayer.py, playerSpeed);
					}
					else if(KEY_UP_PRESSED && (gameMap[myPlayer.py - 1][myPlayer.px].charCodeAt(0) < 65 || gameMap[myPlayer.py - 1][myPlayer.px].charCodeAt(0) > 90))
					{
						sendMyMove(myPlayer.px, myPlayer.py - 1);														
						moveByTime(myPlayer, myPlayer.px, myPlayer.py - 1, playerSpeed);
					}
					else if(KEY_DOWN_PRESSED && (gameMap[myPlayer.py + 1][myPlayer.px].charCodeAt(0) < 65 || gameMap[myPlayer.py + 1][myPlayer.px].charCodeAt(0) > 90))
					{
						sendMyMove(myPlayer.px, myPlayer.py + 1);
						moveByTime(myPlayer, myPlayer.px, myPlayer.py + 1, playerSpeed);
					}
				}
				else
					animateByTime(myPlayer);
				
				
				// Move opponent's character
				if (!opPlayer.moving)
				{
					if (opPlayer.moves.length > 0)
						moveByTime(opPlayer, opPlayer.moves[0].px, opPlayer.moves[0].py, playerSpeed);
				}
				else				
					animateByTime(opPlayer);

				// Update player 1 bubble if any
				if (myPlayer.bubbleTimer > 0)
					myPlayer.bubbleTimer--;
				else
					myPlayer.bubble.visible = false;
					
				// Update player 2 bubble if any
				if (opPlayer.bubbleTimer > 0)
					opPlayer.bubbleTimer--;
				else
					opPlayer.bubble.visible = false;
					
				if (!chatFocus)
				{
					// Place player's bomb
					if (KEY_SPACE_PRESSED)
					{
						if (getTimer() > lastKeyPress + keySpaceDelay)
						{							
							lastKeyPress = getTimer();
							
							var px:Number = myPlayer.px;
							var py:Number = myPlayer.py;
							
							if (gameMap[py][px] != "X")
							{
								for (var i:int = 0; i < myBombsArr.length; i++)
								{
									if (myBombsArr[i])
									{
										myBombsArr[i] = false;
																				
										var bombClass:*    = getDefinitionByName("bomb");
										var bomb:MovieClip = new bombClass();
										bomb.name          = "bomb_" + myPlayerId.toString() + "_" + i.toString();
										bomb.x             = px * tileSize;
										bomb.y             = py * tileSize;
										gameClip.addChildAt(bomb, Math.min(gameClip.getChildIndex(myPlayer.movie), gameClip.getChildIndex(opPlayer.movie))-1);
										
										gameMap[py][px] = "X";
																				
										// Play sound
										playSoundFx(bombDrop_snd);
										
										// Send bomb to server
										var paramsObj:SFSObject = new SFSObject();
										paramsObj.putInt("bId", i);
										paramsObj.putInt("bx", px);
										paramsObj.putInt("by", py);
										
										refDocument.smartFox.send(new ExtensionRequest("bb", paramsObj));
										break;
									}
								}
							}
						}
					}
				}
			}
		}
		
		/**
		 * Initialize animation by time
		 */
		private function moveByTime(player:Object, px:int, py:int, duration:int):void
		{
			//d_trace("GameScene - moveByTime - " + player.movie.name);
			
			player.moving = true;

			if (player.moves.length > 1)
			{
				player.movie.x = player.moves[player.moves.length - 2].px * tileSize;
				player.movie.y = player.moves[player.moves.length - 2].py * tileSize;
				px = player.moves[player.moves.length - 1].px;
				py = player.moves[player.moves.length - 1].py;
			}
			
			player.moves = new Array();
				
			var sx:int = player.movie.x;
			var sy:int = player.movie.y;
			var ex:int = px * tileSize;
			var ey:int = py * tileSize;
			
			switch (ex - sx)
			{
				case -tileSize:	player.movie.gotoAndStop(1);
								break;
				
				case tileSize :	player.movie.gotoAndStop(2);
								break;
			}
						
			switch (ey - sy)
			{
				case -tileSize:	player.movie.gotoAndStop(3);
								break;
	
				case tileSize : player.movie.gotoAndStop(4);
								break;
			}
			
			player.ani_startTime = getTimer();
			player.ani_endTime   = player.ani_startTime + duration;
			player.duration      = duration;

			player.sx = sx;
			player.sy = sy;
			player.dx = ex - sx;
			player.dy = ey - sy;
		}
		
		/**
		 * Play player animation by time
		 */
		private function animateByTime(player:Object):void
		{
			//d_trace("GameScene - animateByTime - " + player.movie.name);

			var currTime:Number = getTimer();
			
			if (currTime > player.ani_endTime)
			{						
				player.movie.x = player.sx + player.dx;
				player.movie.y = player.sy + player.dy;
				
				player.px = player.movie.x / tileSize;
				player.py = player.movie.y / tileSize;
				
				player.moving = false;
				player.movie.avatar.gotoAndStop(1);
			}
			else
			{						
				if (player.movie.avatar.currentFrame == 1)
					player.movie.avatar.gotoAndPlay("run");
				
				var now:Number      = currTime - player.ani_startTime;
				var whereNow:Number = now / player.duration;
				
				player.movie.x = player.sx + player.dx * whereNow;
				player.movie.y = player.sy + player.dy * whereNow;
			}			
		}
						
		/**
		 * Send my move to the opponent
		 */
		private function sendMyMove(px:int, py:int):void
		{
			var paramsObj:SFSObject = new SFSObject();
	        paramsObj.putInt("px", px);
    	    paramsObj.putInt("py", py);
			
			refDocument.smartFox.send(new ExtensionRequest("mv", paramsObj));
		}

		private function attachBubble(playerObj:Object):void
		{
			d_trace("GameScene - attachBubble " + playerObj.bubble);
			
			var n:int = Math.floor(Math.random() * arrTaunts.length);
			playerObj.bubble.message_txt.text = arrTaunts[n];
			playerObj.bubble.visible = true;
			
			playerObj.bubbleTimer = 60;
		}

		private function handleOpponentMove(posX:int, posY:int):void
		{
			//d_trace("GameScene - handleOpponentMove");			
			opPlayer.moves.push({px:posX, py:posY});
		}
		
		private function handleOpponentBomb(bId:int, bx:int, by:int):void
		{
			d_trace("GameScene - handleOpponentBomb - " + bId + " - " + bx + " - " + by);

			var bombClass:*    = getDefinitionByName("bomb");
			var bomb:MovieClip = new bombClass();
			bomb.name          = "opBomb_" + bId;
			bomb.x             = bx * tileSize;
			bomb.y             = by * tileSize;
			gameClip.addChildAt(bomb, Math.min(gameClip.getChildIndex(myPlayer.movie), gameClip.getChildIndex(opPlayer.movie))-1);
			
			gameMap[by][bx] = "X";
		}
		
		private function handleExplosion(bid:int, uid:int, px:int, py:int, die1:int, newItems1:String, die2:int, newItems2:String, score1:int, score2:int):void
		{
			d_trace("GameScene - handleExplosion - " + bid + " - " + uid);
			
			var bomb_mc:MovieClip = null; 
			if (uid == refDocument.smartFox.mySelf.id) // Bomb is mine
			{
				bomb_mc = gameClip.getChildByName("bomb_" + refDocument.smartFox.mySelf.id.toString() + "_" + bid.toString()) as MovieClip;
				myBombsArr[bid] = true; // Bomb is available again
			}
			else // Opponent bomb
				bomb_mc = gameClip.getChildByName("opBomb_" + bid.toString()) as MovieClip;
			
			if (bomb_mc != null)
			{
				gameClip.removeChild(bomb_mc);
				playSoundFx(bombExplode_snd);
			}
			
			gameMap[py][px] = ".";			
			renderExplosion(px, py);
			
			var player1Obj:Object = (myPlayerId == player1Id) ? myPlayer:opPlayer;
			var player2Obj:Object = (myPlayerId == player2Id) ? myPlayer:opPlayer;
			
			var lost:int = 0;
			
			if (die1)
			{
				player1Obj.movie.square.gotoAndPlay(2);
				attachBubble(player1Obj)
				
				player1Obj.score = score1;	
				looseCollectibles(player1Obj, newItems1);
			}
			
			if (die2)
			{
				player2Obj.movie.square.gotoAndPlay(2);
				attachBubble(player2Obj);
				
				player2Obj.score = score2;
				looseCollectibles(player2Obj, newItems2);
			}
						
			updateScores();
		}
		
		/**
		 * Render the bomb explosion
		 */
		private function renderExplosion(px:int, py:int):void
		{
			d_trace("GameScene - renderExplosion");
			
			// Temp position vars
			var tx:int = 0;
			var ty:int = 0;
			
			var ax:int = 0;
			var ay:int = 0;
			
			var c:String = null;
			
			for (var i:Number = 0; i < 4; i++)
			{
				// Get direction addition values
				ax = dirs[i].ax;
				ay = dirs[i].ay;
				
				// Get starting postion
				tx = px;
				ty = py;
				
				// Move in the current direction until an obstacle is found
				while (true)
				{
					tx += ax;
					ty += ay;
					
					c = gameMap[ty][tx];
					
					// Check map bounds && obstacles
					if (tx < 0 || tx > (mapW - 1) || ty < 0 || ty > (mapH - 1) || (c.charCodeAt(0) >= 65 && c.charCodeAt(0) <= 90))
						break;
					else
					{							
						var exploClass:* = getDefinitionByName("boom");
						var eplo:MovieClip  = new exploClass();
						eplo.x = tileSize * tx;
						eplo.y = tileSize * ty;
						gameClip.addChild(eplo);
					}
				}
			}
		}
		
		/**
		 * Animate the lost items
		 */
		private function looseCollectibles(playerObj:Object, newItems:String):void
		{
			d_trace("GameScene - looseCollectibles");
			
			if (newItems.length >= 4)
			{
				var numItems:int = Math.floor(newItems.length/4);
				
				for (var i:int = 0; i < numItems; i++)
				{
					var s :String = newItems.substr(0, 4);
					var dx:int    = parseInt(s.substr(0,2));
					var dy:int    = parseInt(s.substr(2,2));

					newItems      = newItems.slice(4);

					// Get random collectible and attach to screen
					var c:String = collectibles.charAt(Math.floor(Math.random() * collectibles.length));
					
					var collClass:*       = getDefinitionByName("coll_" + c);
					var newColl:MovieClip = new collClass();
					newColl.name          = "brick_" + dx + "_" + dy;
					newColl.x             = tileSize * playerObj.px;
					newColl.y             = tileSize * playerObj.py;
					gameClip.addChildAt(newColl, Math.min(gameClip.getChildIndex(myPlayer.movie), gameClip.getChildIndex(opPlayer.movie))-1);
					
					collTweenX = new Tween(newColl, "x", Regular.easeOut, newColl.x, tileSize * dx, 20, false);
					collTweenY = new Tween(newColl, "y", Regular.easeOut, newColl.y, tileSize * dy, 20, false);
				}
			}
		}		

		private function handlePickItem(itemPx:int, itemPy:int, playerId:int, newScore:int):void
		{
			d_trace("GameScene - handlePickItem: px=" + itemPx + " py=" + itemPy + " playerId=" + playerId);
			
			if (playerId == myPlayerId) // I picked up an item
			{
				// Increase score and play sound
				myPlayer.score = newScore;
				playSoundFx(fruitPick_snd);
			}
			else // Opponent picked up an item
				opPlayer.score = newScore;
			
			updateScores();
						
			// Update logic map
			gameMap[itemPy][itemPx] = "."; 
			
			// Hide the collectible item
			var collItem:MovieClip = gameClip.getChildByName("brick_" + itemPx + "_" + itemPy) as MovieClip;
			if (collItem)
			{
				gameClip.removeChild(collItem);
				collItem.name = "";
				collItem      = null;
			}
		}
		
		private function handleOpenDoor(px:int, py:int):void
		{
			d_trace("GameScene - handleOpenDoor at: " + px + "," + py);
			
			var doorClass:*       = getDefinitionByName("door");
			var door_mc:MovieClip = new doorClass();
			door_mc.name          = "exit";
			door_mc.x 	          = tileSize * px;
			door_mc.y             = tileSize * py;
			gameClip.addChildAt(door_mc, Math.min(gameClip.getChildIndex(myPlayer.movie), gameClip.getChildIndex(opPlayer.movie))-1);
			
			// Play sound
			playSoundFx(doorOpen_snd);
		}

		private function handleWinner(winnerId:int):void
		{
			d_trace("GameScene - handleWinner");

			gameStarted = false;
			gameClip.removeEventListener(Event.ENTER_FRAME, mainThread); 

			if (gameTimer)
			{
				if (gameTimer.running)
					gameTimer.stop();
					
				if (gameTimer.hasEventListener(TimerEvent.TIMER))
					gameTimer.removeEventListener(TimerEvent.TIMER, updateTimer);
				
				gameTimer = null;
			}				

			// Play sound
			playSoundFx(matchEnd_snd);
						
			popup = showPopup(POPUP_MATCH_END);
			
			myPlayer.movie.avatar.moving = false;
			myPlayer.movie.avatar.gotoAndStop(1);
			opPlayer.movie.avatar.moving = false;
			opPlayer.movie.avatar.gotoAndStop(1);
			
			if (myPlayerId == winnerId)
			{
				popup.message_txt.text = "Well done! You WON!\n Play again?";
				myMatches++;
			}
			else
			{
				popup.message_txt.text = "Ouch! You LOST!\n Play again?";
				opMatches++;
			}
			
			popup.score_txt.text = myMatches + " - " + opMatches;
			popup.restart_bt.addEventListener(MouseEvent.CLICK, restartGame);
			
			updateScores();
		}
		
		/**
		 * Stop the game
		 */
		private function handleStopGame():void
		{
			d_trace("GameScene - handleStopGame");
			
			gameStarted = false;
			
			myMatches = 0;
			opMatches = 0;

			gameClip.removeChild(myPlayer.movie);
			gameClip.removeChild(opPlayer.movie);
			gameClip.removeEventListener(Event.ENTER_FRAME, mainThread); 
			
			if (gameTimer)
			{
				if (gameTimer.running)
					gameTimer.stop();
					
				if (gameTimer.hasEventListener(TimerEvent.TIMER))
					gameTimer.removeEventListener(TimerEvent.TIMER, updateTimer);
				
				gameTimer = null;
			}				
			
			// Play sound
			playSoundFx(matchEnd_snd);
			
			// Show "player gone" message
			popup = showPopup(POPUP_PLAYER_LOST);
		}
		
		/**
		 * Update the game timer
		 */
		private function updateTimer(evt:TimerEvent):void
		{
			//d_trace("GameScene - updateTimer");

			if (startTime > 0)
				startTime--;
			
			if ((startTime < 20) && (startTime > 10))
				timer_bg.gotoAndStop(2);
			else 
			if (startTime < 10)
				timer_bg.gotoAndStop(3);
						
			showTime(startTime);
		}		
		
		/**
		 * Format time on the game timer 
		 */
		private function showTime(t:int):void
		{
			//d_trace("GameScene - showTime");
			
			var minutes = "" + Math.floor(t / 60);
			if (minutes.length < 2)
				minutes = "0" + minutes;
				
			var seconds = ""+ (t % 60);
			if (seconds.length < 2)
				seconds = "0" + seconds;
			
			timer_txt.text = minutes + ":" + seconds;
		}	


		/* INTERFACE HANDLERS **********************************************************************************/
		private function onGameKeyDown(evt:KeyboardEvent):void
		{
			switch(evt.keyCode)
			{
				case Keyboard.UP   : KEY_UP_PRESSED    = true;
									 break;
									 
				case Keyboard.DOWN : KEY_DOWN_PRESSED  = true;
									 break;
									 
				case Keyboard.LEFT : KEY_LEFT_PRESSED  = true;
									 break;
									 
				case Keyboard.RIGHT: KEY_RIGHT_PRESSED = true;
									 break;
									 
				case Keyboard.SPACE: KEY_SPACE_PRESSED = true;
									 break;
			}
		}

		private function onGameKeyUp(evt:KeyboardEvent):void
		{
			switch(evt.keyCode)
			{
				case Keyboard.UP   : KEY_UP_PRESSED    = false;
									 break;
									 
				case Keyboard.DOWN : KEY_DOWN_PRESSED  = false;
									 break;
									 
				case Keyboard.LEFT : KEY_LEFT_PRESSED  = false;
									 break;
									 
				case Keyboard.RIGHT: KEY_RIGHT_PRESSED = false;
									 break;

				case Keyboard.SPACE: KEY_SPACE_PRESSED = false;
									 break;
			}
		}
		
		private function restartGame(evt:MouseEvent):void
		{
			d_trace("GameScene - restartGame");
			refDocument.smartFox.send(new ExtensionRequest("restart", new SFSObject()));
		}
		
		private function exitGame(evt:MouseEvent):void
		{
			d_trace("GameScene - exitGame");
			dispatchEvent(new Event("EXIT_GAME"));	
		}
		
		
		/* SKIN UTILITIES *****************************************************************************************************/				
		private function skinComponents():void
		{
			d_trace("GameScene - skinComponents");

			// Text Format Big
			var txtFormatBig:TextFormat = new TextFormat();
			txtFormatBig.font           = refDocument.txtFont.fontName;
			txtFormatBig.size           = 18;
			txtFormatBig.color          = "0xFFFFFF";
			
			// Text Format Small
			var txtFormatSmall:TextFormat = new TextFormat();
			txtFormatSmall.font           = refDocument.txtFont.fontName;
			txtFormatSmall.size           = 14;
			txtFormatSmall.color          = "0x6B6B6B";	
			
			// Exit button
			var exit_bt:Button = exit_bt;
			exit_bt.setStyle("embedFonts", true);
			exit_bt.setStyle("textFormat", txtFormatBig);
						
			// Send Game Msg Button
			chatBox_mc.sendButton.width  = 75;
			chatBox_mc.sendButton.height = 28;
			chatBox_mc.sendButton.setStyle("embedFonts", true);
			chatBox_mc.sendButton.setStyle("textFormat", txtFormatBig);
								
			// Public Chat Box
			chatBox_mc.colorPicker.width         = 28;
			chatBox_mc.colorPicker.height        = 28;
			chatBox_mc.messageTextInput.height   = 28;
			chatBox_mc.systemAlertsColor         = 0x83C11E;
			chatBox_mc.colorPicker.selectedColor = 0x6B6B6B;
			chatBox_mc.chatTextArea.setStyle("embedFonts", true);
			chatBox_mc.chatTextArea.setStyle("textFormat", txtFormatSmall);
			chatBox_mc.messageTextInput.setStyle("embedFonts", true);
			chatBox_mc.messageTextInput.setStyle("textFormat", txtFormatSmall);
			
			// Change focus while chatting
			chatBox_mc.messageTextInput.addEventListener(MouseEvent.CLICK     , onChatFocusIn);
			chatBox_mc.messageTextInput.addEventListener(FocusEvent.FOCUS_OUT , onChatFocusOut);			
		}					
		
		function onChatFocusIn(evt:MouseEvent):void
		{
			d_trace("GameScene - onChatFocusIn");
			chatFocus = true;
		}
		
		function onChatFocusOut(evt:FocusEvent):void
		{
			d_trace("GameScene - onChatFocusOut");
			chatFocus = false;
		}
		
		function onChatEnter(evt:MouseEvent):void
		{
			d_trace("GameScene - onChatEnter");
			chatBox_mc.sendButton.setFocus();
		}
		
		
		/* SOUND UTILITIES **********************************************************************************************************/
		function playSoundFx(snd:Sound):void
		{
			d_trace("GameScene - playSoundFx");
			
			if (refDocument.soundEnabled)
				snd.play();
		}
		
		
		/* DEBUG UTILITIES ****************************************************************************************************/		
		private function d_trace(debugMsg:String):void
		{
			if (debugLogging)
				trace(debugMsg);
		}		
	}
}