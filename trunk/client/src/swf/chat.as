﻿/***********************************************************************/
// ChatScene 
// 
// This class instantiates the scene that handles the lobby chat, 
// users and rooms lists (using SmartFoxBits) and game creation fields. 
// Game maps are received from the onExtensionResponse method once the  
// player joins the Lobby room. This is performed automatically by the 
// SmartFoxBits RoomList. Once the user creates or joins a game room, this scene
// dispatches a GOTO_GAME_SCENE to the document class.
// 
// (c) 2011 The gotoAndPlay() Team
/***********************************************************************/ 

package
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

  	import ICard.assist.view.interfaces.*;
  	import ICard.assist.*;
	
	// Import custom classes
	import sfs2x.games.ICard.items.MapItem;

	public class Chat extends MovieClip implements IChat
	{
		// Keeps the reference to the main document class
		private var refDocument     : *;
		private var mapMenuItemSize : int = 130;

		// Enable/disable trace messages
		private var debugLogging    : Boolean = false;
		
		/**
 		* Empty constructor
 		*/		
		public function Chat()
		{
		}
		
		
		/* CHAT SCENE INITIALIZATIONS **********************************************************************************/
		public function init(refDoc:*):void 
		{
			// Get the reference to the Document Class
			refDocument = refDoc;

			d_trace("------------------------------------------------------");
			d_trace("ChatScene - init");

			// Apply components skin and font
			skinComponents();

			// Init stuff and SmartFox listeners
			initListeners();
		}
				
		private function initListeners():void
		{
			d_trace("ChatScene - initListeners");

			// Init user interface listeners
			mapSelector.prev_bt.buttonMode    = true;
			mapSelector.prev_bt.useHandCursor = true;
			mapSelector.prev_bt.addEventListener(MouseEvent.CLICK, onPrevMapClick);
			
			mapSelector.next_bt.buttonMode    = true;
			mapSelector.next_bt.useHandCursor = true;
			mapSelector.next_bt.addEventListener(MouseEvent.CLICK, onNextMapClick);

			create_bt.buttonMode    = true;
			create_bt.useHandCursor = true;
			create_bt.addEventListener(MouseEvent.CLICK, createNewGame);
			
			// Init smartfox listeners
			refDocument.smartFox.addEventListener(SFSEvent.CONNECTION_LOST      , onConnectionLost);
			refDocument.smartFox.addEventListener(SFSEvent.EXTENSION_RESPONSE   , onExtensionResponse);
			refDocument.smartFox.addEventListener(SFSEvent.ROOM_JOIN            , onRoomJoined);
			refDocument.smartFox.addEventListener(SFSEvent.ROOM_VARIABLES_UPDATE, onRoomVariablesUpdate);			
			refDocument.smartFox.addEventListener(SFSEvent.USER_VARIABLES_UPDATE, onUserVariablesUpdate);
		}	
						
		public function finalize():void
		{
			d_trace("ChatScene - finalize");

			// Remove interface listeners
			create_bt.removeEventListener(MouseEvent.CLICK          , createNewGame);
			mapSelector.prev_bt.removeEventListener(MouseEvent.CLICK, onPrevMapClick);
			mapSelector.next_bt.removeEventListener(MouseEvent.CLICK, onNextMapClick);

			// Remove smartfox listeners
			refDocument.smartFox.removeEventListener(SFSEvent.CONNECTION_LOST      , onConnectionLost);
			refDocument.smartFox.removeEventListener(SFSEvent.EXTENSION_RESPONSE   , onExtensionResponse);
			refDocument.smartFox.removeEventListener(SFSEvent.ROOM_JOIN            , onRoomJoined);
			refDocument.smartFox.removeEventListener(SFSEvent.ROOM_VARIABLES_UPDATE, onRoomVariablesUpdate);			
			refDocument.smartFox.removeEventListener(SFSEvent.USER_VARIABLES_UPDATE, onUserVariablesUpdate);
		}
		
		/* SMARTFOX CALLBACKS **********************************************************************************/
		private function onConnectionLost(evt:SFSEvent):void
		{
			d_trace("ChatScene - onConnectionLost");
			dispatchEvent(new Event("CONNECTION_LOST"));
		}
		
		private function onExtensionResponse(evt:SFSEvent):void
		{
			d_trace("ChatScene - onExtensionResponse " + evt.params.cmd);
			
			var responseParams:ISFSObject = evt.params.params as SFSObject;
			
			if (evt.params.cmd == "map_list")
			{
				refDocument.selectedMapIndex = 0;
				var mapsData:ISFSArray = responseParams.getSFSArray("list");

				var itemsHolder:MovieClip = new MovieClip();
				mapSelector.addChild(itemsHolder);
				itemsHolder.name = "itemsHolder";
				itemsHolder.mask = mapSelector.itemsHolderMask;

				for (var i:int = 0; i < mapsData.size(); i++)
				{
					var mapData:Object = new Object();
					mapData.id         = mapsData.getElementAt(i).getInt("id");
					mapData.name       = mapsData.getElementAt(i).getUtfString("name");
					mapData.icon       = mapsData.getElementAt(i).getUtfString("icon");
					mapData.thumb      = "thumbnails/" + mapsData.getElementAt(i).getUtfString("thumb") + ".jpg";

					var mapItem:* = new MapItem();					
					mapItem.y = i * mapMenuItemSize;
					itemsHolder.addChild(mapItem);
										
					mapItem.init(mapData);

					refDocument.availableMaps[i]              = mapData;
					refDocument.availableMapsById[mapData.id] = mapData;
				}
												
				// Refresh userlist to show proper label/icon of rooms already existing when joining the lobby
				roomList_mc.roomsList.validateNow();								
			}
		}
		
		private function onRoomJoined(evt:SFSEvent):void
		{
			d_trace("ChatScene - onRoomJoined - " + evt.params.room.name);
			
			var roomJoined:Room = evt.params.room;
			
			// If user joined a game room switch to game scene
			if (roomJoined.isGame)
			{
				// Switch to game scene
				dispatchEvent(new Event("GOTO_GAME_SCENE"));	
			}
			
			// User joined the lobby
			else
			{
				// The first time the user enters the Lobby, his avatar ID is saved in userVariables
				if (refDocument.smartFox.mySelf.getVariable("avatar") == undefined)
				{					
					// Save chosen avatar in user variables
					var uVars:Array = new Array();
			        uVars.push(new SFSUserVariable("avatar", refDocument.myAvatar));
					refDocument.smartFox.send(new SetUserVariablesRequest(uVars));
				}
				
				// Request maps data to server passing an empty params object
				refDocument.smartFox.send(new ExtensionRequest("map_list", new SFSObject()));
			}
		}
				
		private function onRoomVariablesUpdate(evt:SFSEvent):void
		{
			d_trace("ChatScene - onRoomVariablesUpdate");
			
			// Refresh room list to show proper room icon
			roomList_mc.refreshView();
		}
		
		private function onUserVariablesUpdate(evt:SFSEvent):void
		{
			d_trace("ChatScene - onUserVariablesUpdate");
			
			// Refresh user list to show proper user avatar
			userList_mc.refreshList();
		}
		
		
		/* INTERFACE HANDLERS **********************************************************************************/
		private function onPrevMapClick(evt:MouseEvent):void
		{
			if (refDocument.availableMaps.length > 0)
			{
				if (refDocument.selectedMapIndex > 0)
				{
					refDocument.selectedMapIndex--;
					scrollMapsMenu(false);
				}
			}
		}
		
		private function onNextMapClick(evt:MouseEvent):void
		{
			if (refDocument.availableMaps.length > 0)
			{
				if (refDocument.selectedMapIndex < refDocument.availableMaps.length - 1)
				{
					refDocument.selectedMapIndex++;
					scrollMapsMenu(true);
				}
			}
		}
		
		/**
		 * Tween for map selector scrolling
		 */
		private function scrollMapsMenu(scrollUp:Boolean):void
		{
			var itemsHolder:* = mapSelector.getChildAt(3);			
			var tw:Tween = new Tween(itemsHolder, "y", Regular.easeOut, itemsHolder.y, -mapMenuItemSize * refDocument.selectedMapIndex, 0.2, true);
		}
		
		/**
		 * User creates a new room after filling the proper fields
		 */
		private function createNewGame(evt:MouseEvent):void
		{
			d_trace("ChatScene - createNewGame");

			if (name_ti.text != "")
			{				
				var roomFound:Boolean = false;
				
				for (var i:int = 0; i < refDocument.smartFox.roomList.length; i++)
				{
					if ((refDocument.smartFox.roomList[i] as Room).name == name_ti.text)
					{
						roomFound = true;
						break;
					}
				}
				
				if (!roomFound) // Prevent create room errors
				{
					// Create room variable
					var roomVar:SFSRoomVariable = new SFSRoomVariable("map", refDocument.availableMaps[refDocument.selectedMapIndex].id);
					roomVar.isPrivate           = false;
					roomVar.isPersistent        = true;
					
					// Add room variable to an array
					var roomVars:Array          = new Array();
					roomVars.push(roomVar);
				
					// Create room settings
					var roomSettings:RoomSettings = new RoomSettings(name_ti.text);
					roomSettings.password 		  = password_ti.text;
					roomSettings.maxUsers 		  = 2;
					roomSettings.maxSpectators	  = 0;
					roomSettings.isGame 		  = true;
					roomSettings.variables        = roomVars;
					
					// Create new game room with above parameters and join it
					refDocument.smartFox.send(new CreateRoomRequest(roomSettings, true, refDocument.smartFox.lastJoinedRoom));
				}
			}
		}
		
		/* SKIN UTILITIES *****************************************************************************************************/				
		private function skinComponents():void
		{
			d_trace("ChatScene - skinComponents");
						
			// Text Format Big
			var txtFormatBig:TextFormat   = new TextFormat();
			txtFormatBig.font             = refDocument.txtFont.fontName;
			txtFormatBig.size             = 18;
			txtFormatBig.color            = "0xFFFFFF";
			
			// Text Format Small
			var txtFormatSmall:TextFormat = new TextFormat();
			txtFormatSmall.font           = refDocument.txtFont.fontName;
			txtFormatSmall.size           = 14;
			txtFormatSmall.color          = "0x6B6B6B";	

			// Text Format Extra Small
			var txtFormatExSmall:TextFormat = new TextFormat();
			txtFormatExSmall.font           = refDocument.txtFont.fontName;
			txtFormatExSmall.size           = 11;
			txtFormatExSmall.color          = "0x006600";	

			// Error font
			var txtFormatError:TextFormat = new TextFormat();
			txtFormatError.font           = refDocument.txtFont.fontName;
			txtFormatError.size           = 12;
			txtFormatError.color          = "0xFF0000";

			// Disabled font
			var txtFormatDisab:TextFormat = new TextFormat();
			txtFormatDisab.font           = refDocument.txtFont.fontName;
			txtFormatDisab.size           = 18;
			txtFormatDisab.color          = "0x909090";

			// Create Game Button
			create_bt.buttonMode = true;
			create_bt.useHandCursor = true;
			create_bt.setStyle("embedFonts", true);
			create_bt.setStyle("textFormat", txtFormatBig);			
			
			// Send Public Msg Button
			chatBox_mc.sendButton.width  = 75;
			chatBox_mc.sendButton.height = 28;
			chatBox_mc.sendButton.buttonMode = true;
			chatBox_mc.sendButton.useHandCursor = true;
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
			
			// Match Name
			name_ti.setStyle("embedFonts", true);
			name_ti.setStyle("textFormat", txtFormatSmall);

			// Match Password
			password_ti.setStyle("embedFonts", true);
			password_ti.setStyle("textFormat", txtFormatSmall);
																								
			// Users List 
			userList_mc.usersList.setRendererStyle("embedFonts", true);
			userList_mc.usersList.setRendererStyle("textFormat", txtFormatSmall);
																								
			// Users List Kick Button
			userList_mc.kickButton.width  = 75;
			userList_mc.kickButton.height = 28;
			userList_mc.kickButton.buttonMode = true;
			userList_mc.kickButton.useHandCursor = true;
			userList_mc.kickButton.setStyle("embedFonts", true);
			userList_mc.kickButton.setStyle("textFormat", txtFormatBig);

			// Users List Ban Button
			userList_mc.banButton.width   = 75;
			userList_mc.banButton.height  = 28;
			userList_mc.banButton.buttonMode = true;
			userList_mc.banButton.useHandCursor = true;
			userList_mc.banButton.setStyle("embedFonts", true);
			userList_mc.banButton.setStyle("textFormat", txtFormatBig);
			
			// Private Chat Box
			userList_mc.privateChat.systemAlertsColor         = 0x83C11E;
			userList_mc.privateChat.colorPicker.selectedColor = 0x6B6B6B;
			userList_mc.privateChat.sendButton.width          = 75;
			userList_mc.privateChat.sendButton.height         = 28;
			userList_mc.privateChat.sendButton.buttonMode     = true;
			userList_mc.privateChat.sendButton.useHandCursor  = true;
			userList_mc.privateChat.messageTextInput.height   = 28;
			userList_mc.privateChat.clearButton.width         = 26;
			userList_mc.privateChat.clearButton.height        = 26;	
			userList_mc.newPrivateMsgLabelColor               = 0x83C11E;
			userList_mc.privateChat.systemAlertsColor         = 0x83C11E;
			userList_mc.privateChat.chatTextArea.setStyle("embedFonts"    , true);
			userList_mc.privateChat.chatTextArea.setStyle("textFormat"    , txtFormatSmall);
			userList_mc.privateChat.sendButton.setStyle("embedFonts"      , true);
			userList_mc.privateChat.sendButton.setStyle("textFormat"      , txtFormatBig);
			userList_mc.privateChat.sendButton.setStyle("disabledTextFormat", txtFormatDisab);			
			userList_mc.privateChat.messageTextInput.setStyle("embedFonts", true);
			userList_mc.privateChat.messageTextInput.setStyle("textFormat", txtFormatSmall);
			userList_mc.privateChatLabel.setStyle("embedFonts"            , true);
			userList_mc.privateChatLabel.setStyle("textFormat"            , txtFormatExSmall);			
			
			// Rooms List 
			roomList_mc.roomsList.setRendererStyle("embedFonts", true);
			roomList_mc.roomsList.setRendererStyle("textFormat", txtFormatSmall);
			
			// Rooms List other controls
			roomList_mc.joinButton.width  = 75;
			roomList_mc.joinButton.height = 28;
			roomList_mc.joinButton.buttonMode = true;
			roomList_mc.joinButton.useHandCursor = true;
			roomList_mc.joinButton.setStyle("embedFonts", true);
			roomList_mc.joinButton.setStyle("textFormat", txtFormatBig);
			roomList_mc.passwordTextInput.height   = 28;
			roomList_mc.passwordTextInput.setStyle("embedFonts", true);
			roomList_mc.passwordTextInput.setStyle("textFormat", txtFormatSmall);
			roomList_mc.passwordLabel.setStyle("embedFonts", true);
			roomList_mc.passwordLabel.setStyle("textFormat", txtFormatSmall);
			roomList_mc.errorLabel.setStyle("embedFonts", true);
			roomList_mc.errorLabel.setStyle("textFormat", txtFormatError);
			roomList_mc.cancelButton.width  = 26;
			roomList_mc.cancelButton.height = 26;
			
			// SFS Bits custom icons & label renderers
			roomList_mc.labelFunction = setCustomRoomLabel;
			roomList_mc.iconFunction  = setCustomRoomIcon;
			userList_mc.labelFunction = setCustomUserLabel;
			userList_mc.iconFunction  = setCustomUserIcon;
		}		
		
		/**
		 * Custom function to set room label in SmartFoxBits' RoomList
		 */
		private function setCustomRoomLabel(item:Object):String
		{
			d_trace("ChatScene - setCustomRoomLabel");
			
			var label  :String;
			var room   :SFSRoom = item.roomData;
			var roomVar:RoomVariable = room.getVariable("idMap");
						
			label = room.name;			
			
			if (roomVar)
			{
				var mapId  :int  = roomVar.getIntValue();
				
				if (refDocument.availableMapsById[mapId])
				{
					var mapName:String  = refDocument.availableMapsById[mapId].name;
					
					if ((room.isGame == true) && (mapName != null) && (mapName != ""))
						label += "<br><font size='12' color='#83C11E'>(" + mapName + ")</font>";
				}
			}
			
			return label
		}
		
		/**
		 * Custom function to set room icon in SmartFoxBits' RoomList
		 */
		private function setCustomRoomIcon(item:Object):String
		{
			d_trace("ChatScene - setCustomRoomIcon");
			
			var icon   :String       = "";
			var room   :SFSRoom      = item.roomData;
			var roomVar:RoomVariable = room.getVariable("idMap"); // Created serverside for global access
		
			if (roomVar)
			{
				var mapId  :int = roomVar.getIntValue();
				
				if (refDocument.availableMapsById[mapId])
				{
					var mapIcon:String = refDocument.availableMapsById[mapId].icon;
					
					if (room.isGame)
					{
						icon = "icon" + mapIcon;
						
						if (room.userCount >= room.maxUsers)
							icon += "_full";
						else					
						if (room.isPasswordProtected)
							icon += "_priv";
					}
				}
			}

			return icon;
		}
		
		/**
		 * Custom function to set user label in SmartFoxBits' UserList
		 */
		private function setCustomUserLabel(item:Object):String
		{			
			d_trace("ChatScene - setCustomUserLabel");

			var user :SFSUser = item.userData;
			var label:String  = "<font";
			
			if (item.newMsgCount > 0)
				label += " color='#" + userList_mc.newPrivateMsgLabelColor.toString(16) + "'";
			
			label += ">" + user.name + "</font>";
			
			if (item.newMsgCount > 0)
				label += "<br><font size='12' color='#CCCCCC'>" + item.newMsgCount.toString() + " message" + (item.newMsgCount > 1 ? "s" : "") + " to read</font>";
			
			return label;
		}
		
		/**
		 * Custom function to set user icon in SmartFoxBits' UserList
		 */
		private function setCustomUserIcon(item:Object):String
		{
			d_trace("ChatScene - setCustomUserIcon");
			
			var icon:String  = "";
			var user:SFSUser = item.userData;			
			var userAvatar:UserVariable = user.getVariable("avatar");
			
			if (userAvatar)
				icon = "userIcon_" + userAvatar.getStringValue();
			
			return icon;
		}	
		
		
		/* DEBUG UTILITIES ****************************************************************************************************/		
		private function d_trace(debugMsg:String):void
		{
			if (debugLogging)
				trace(debugMsg);
		}		
	}
}