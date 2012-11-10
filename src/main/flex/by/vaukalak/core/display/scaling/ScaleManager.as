package by.vaukalak.core.display.scaling {
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class ScaleManager {
		
		//--------------------------------------------------------------------------
		//
		//  PROPERTIES
		//
		//--------------------------------------------------------------------------
		
		public var useStageProperties:Boolean = true;
		private var _refferenseObject:DisplayObjectContainer;
		private var _refferenseRectangle:Rectangle;
		//private var _item:
		//--------------------------------------------------------------------------
		//
		//  CONSTRUCTOR
		//
		//--------------------------------------------------------------------------
		
		public function ScaleManager(refferenseObject:DisplayObjectContainer, refferenseRectangle:Rectangle) {
			_refferenseRectangle = refferenseRectangle;
			_refferenseObject = refferenseObject;
			_refferenseObject.addEventListener(Event.RESIZE, _onContainerResized);
		}
		
		private function _onContainerResized(e:Event):void {
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------
		
		private function get _containerWidth():Number {
			return (_refferenseObject is Stage && useStageProperties) ? Stage(_refferenseObject).stageWidth : _refferenseObject.width;
		}
		
		private function get _containerHeight():Number {
			return (_refferenseObject is Stage && useStageProperties) ? Stage(_refferenseObject).stageHeight : _refferenseObject.height;
		}
		
	}

}