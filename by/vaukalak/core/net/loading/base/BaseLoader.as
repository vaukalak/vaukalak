package by.vaukalak.core.net.loading.base {
	import by.vaukalak.core.net.loading.LoaderType;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class BaseLoader extends EventDispatcher implements ILoader{
		
		//--------------------------------------------------------------------------
		//
		//  PROPERTIES
		//
		//--------------------------------------------------------------------------
		
		private var _url:URLRequest;
		
		//--------------------------------------------------------------------------
		//
		//  CONSTRUCTOR
		//
		//--------------------------------------------------------------------------
		
		public function BaseLoader() {
			super(this);
		}
		
		/* INTERFACE by.vaukalak.core.resorse.ILoader */
		
		public function get progress():Number{
			return _baseLoader.bytesLoaded / _baseLoader.bytesTotal;
		}
		
		public function load(url:URLRequest = null):void{
			_baseLoader.load(url ? url : this.url);
		}
		
		public function get bytesTotal():uint{
			
			return _baseLoader.bytesTotal;
		}
		
		public function get bytesLoaded():uint {
			return _baseLoader.bytesLoaded;
		}
		
		public function close():void{
			_baseLoader.close();
		}
		
		//--------------------------------------------------------------------------
		//
		//  OVERRIDDEN METHODS
		//
		//--------------------------------------------------------------------------
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			if (_delegatedEvent.indexOf(type) != -1) _addDelegatedEvent(type);
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			if (_delegatedEvent.indexOf(type) != -1) _removeDelegatedEvent(type);
			super.removeEventListener(type, listener, useCapture);
		}
		
		override public function hasEventListener(type:String):Boolean {
			if (_delegatedEvent.indexOf(type) != -1) return _baseLoader.hasEventListener(type);
			else return super.hasEventListener(type);
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------
		
		protected var _delegatedEvent:Vector.<String> = Vector.<String>([IOErrorEvent.IO_ERROR, Event.COMPLETE, Event.OPEN, ProgressEvent.PROGRESS]);
		
		private function _addDelegatedEvent(type:String):void {
			_baseLoader.addEventListener(type, dispatchEvent);
		}
		
		private function _removeDelegatedEvent(type:String):void {
			_baseLoader.removeEventListener(type, dispatchEvent);
		}
		
		public function set url(url:URLRequest):void {
			_url = url;
		}
		
		public function get url():URLRequest {
			return _url;
		}
		
		
		public function set dataFormat(s:String):void{
			_baseLoader.dataFormat = s;
		}
		
		public function get dataFormat():String{
			return _baseLoader.dataFormat;
		}
		
		public function get data():*{
			return _baseLoader.data;
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE GETTERS
		//
		//--------------------------------------------------------------------------
		
		
		private var p_loader:URLLoader;
		private function get _baseLoader():URLLoader {
			if (!p_loader) {
				p_loader = new URLLoader();
			}
			return p_loader;
		}
		
	}

}