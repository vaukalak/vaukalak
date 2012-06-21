package by.vaukalak.core.net.loading.base {
	import by.vaukalak.core.process.IProgressable;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	[Event(name="ioError", type="flash.events.IOErrorEvent")]
	[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
	[Event(name="complete", type="flash.events.Event")]
	[Event(name = "open", type = "flash.events.Event")]
	[Event(name = "progress", type = "flash.events.ProgressEvent")]
	[Event(name = "httpResponseStatus", type = "flash.events.HTTPStatusEvent")]
	[Event(name = "httpStatus", type = "flash.events.HTTPStatusEvent")]
	[Event(name = "process_progress", type = "by.vaukalak.core.events.ProcessProgressEvent")]
	
	public interface ILoader extends IEventDispatcher, IProgressable{
		function load(url:URLRequest = null):void;
		function get bytesTotal():uint;
		function get bytesLoaded():uint;
		function get data():*;
		function set dataFormat(s:String):void;
		function get dataFormat():String;
		function set url(url:URLRequest):void;
		function get url():URLRequest;
		function close():void;
	}
	
}