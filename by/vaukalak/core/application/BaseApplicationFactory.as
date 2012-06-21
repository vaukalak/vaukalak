package by.vaukalak.core.application {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	import by.vaukalak.core.events.ProcessProgressEvent;
	import by.vaukalak.core.process.IProgressable
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	
	[Event(name="process_progress", type="by.vaukalak.core.events.ProcessProgressEvent")]
	public class BaseApplicationFactory extends MovieClip implements IProgressable{
		
		private var _baseClassName:String;
		
		public function BaseApplicationFactory(baseClassName:String) {
			super();
			_baseClassName = baseClassName;
			
			super.loaderInfo.addEventListener(Event.COMPLETE, _onApplicationLoaded);
			super.loaderInfo.addEventListener(ProgressEvent.PROGRESS, _onApplicationUploadProgress);
			super.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _onIOError);
		}
		
		//--------------------------------------------------------------------------
		//
		//  PUBLIC METHODS
		//
		//--------------------------------------------------------------------------
		
		
		/* INTERFACE by.vaukalak.core.process.IProgressable */
		
		public function get progress():Number{
			return _bytesLoaded / _bytesTotal;
		}
		
		//--------------------------------------------------------------------------
		//
		//  EVENT HANDLERS
		//
		//--------------------------------------------------------------------------
		
		private function _onApplicationUploadProgress(e:ProgressEvent):void {
			dispatchEvent(new ProcessProgressEvent(ProcessProgressEvent.PROCESS_PROGRESS, false, false, _bytesLoaded / _bytesTotal));
		}
		
		protected function _onIOError(e:IOErrorEvent):void {
			
		}
		
		protected function _onApplicationLoaded(e:Event):void {
			super.nextFrame();
			var cl:Class = getDefinitionByName(_baseClassName) as Class;
			if (DisplayObject.prototype.isPrototypeOf(cl.prototype)) {
				stage.addChild(new cl());
			}else {
				_initController(cl, stage);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  PROTECTED METHODS
		//
		//--------------------------------------------------------------------------
		
		/**
		 * initializate the base application controller
		 * @param	cl
		 * @param	stage
		 */
		
		protected function _initController(cl:Class, stage:Stage):void {
			new cl(stage);
		}
		
		//--------------------------------------------------------------------------
		//
		//  PROPERTY ACSESSORS
		//
		//--------------------------------------------------------------------------
		
		protected final function get _bytesLoaded():uint {
			return super.loaderInfo.bytesLoaded;
		}
		
		protected final function get _bytesTotal():uint{
			return super.loaderInfo.bytesTotal;
		}
		
	}

}