package sfs2x.games.battlefarm.items
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import fl.controls.*;
	
	/**
	 * MapItem class: store map details
	 */
	public class MapItem extends MovieClip 
	{		
		public var mapObj:Object;
	
		public function MapItem() 
		{
		}
		
		public function init(dataObj:Object):void
		{
			mapObj = dataObj;
			
			name_txt.text = mapObj.name;
			loadThumb(mapObj.thumb);
		}
		
		private function loadThumb(thumbUrl:String):void
		{
			var thumbLoader:Loader = new Loader();
			thumbLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onThumbLoaded);
			thumbLoader.load(new URLRequest(thumbUrl));
		}
		
		private function onThumbLoaded(event:Event):void
		{
			event.target.removeEventListener(Event.COMPLETE, onThumbLoaded);
			thumb.addChild(event.target.content);
		}
	}
}