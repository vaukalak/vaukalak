package by.vaukalak.core.events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class BaseEvent extends Event {
		
		internal var $stopped:Boolean;
		internal var $stopImmediately:Boolean;
		internal var $target:Object;
		internal var $currentTarget:Object;
		
		public function BaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event { 
			return new BaseEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("BaseEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		override public function get target():Object { return $target || super.target; }
		
		override public function stopImmediatePropagation():void {
			$stopImmediately = true;
			$stopped = true;
		}
		
		override public function get currentTarget():Object {
			return $currentTarget;
		}
		
		override public function stopPropagation():void {
			$stopped = true;
		}
		
	}
	
}