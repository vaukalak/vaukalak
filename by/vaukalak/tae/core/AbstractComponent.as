package by.vaukalak.tae.core {
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class AbstractComponent extends EventDispatcher{
		
		protected var _target:BaseElement;
		
		public function AbstractComponent() {
			super(this);
			//_target = target;
			
		}
		
		public function get target():BaseElement { return _target; }
		
	}

}