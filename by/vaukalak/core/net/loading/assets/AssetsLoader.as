package by.vaukalak.core.net.loading.assets {
	import by.vaukalak.core.net.loading.base.BaseLoader;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class AssetsLoader extends BaseLoader{
		
		//--------------------------------------------------------------------------
		//
		//  CONSTRUCTOR
		//
		//--------------------------------------------------------------------------
		
		public function AssetsLoader() {
			super();
			super.dataFormat = URLLoaderDataFormat.BINARY;
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  OVERRIDEN METHODS
		//
		//--------------------------------------------------------------------------
		
		override public function get data():* { return _loader.contentLoaderInfo.content; }
		
		override public function set dataFormat(value:String):void {
			
		}
		
		override public function load(url:URLRequest = null):void {
			super.addEventListener(Event.COMPLETE, _onComplete, false, int.MAX_VALUE, true);
			super.load(url);
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------
		
		private function _onComplete(e:Event):void {
			super.removeEventListener(Event.COMPLETE, _onComplete, false);
			var bArr:ByteArray =  super.data;
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onBytesLoaded);
			_loader.loadBytes(bArr);
			e.stopImmediatePropagation();
			
		}
		
		private function _onBytesLoaded(e:Event):void {
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE GETTERS
		//
		//--------------------------------------------------------------------------
		
		private var p_loader:Loader;
		private var _dataLoaded:Boolean;
		private function get _loader():Loader {
			if (!p_loader) {
				p_loader = new Loader();
			}
			return p_loader;
		}
		
	}

}