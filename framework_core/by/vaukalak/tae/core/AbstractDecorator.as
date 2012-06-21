package by.vaukalak.tae.core {
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class AbstractDecorator extends AbstractComponent{
		private var _component:AbstractComponent;
		
		//private var __target:BaseElement;
		
		public function AbstractDecorator (component:AbstractComponent) {
			super();
			_component = component;
			
		}
		
		override public function get target():BaseElement { return _component.target; }
		
	}

}