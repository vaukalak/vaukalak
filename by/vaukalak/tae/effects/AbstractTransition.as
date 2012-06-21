package by.vaukalak.tae.effects {
	import by.vaukalak.tae.core.AbstractComponent;
	import by.vaukalak.tae.core.AbstractDecorator;
	import by.vaukalak.tae.core.BaseElement;
	import flash.errors.IllegalOperationError;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class AbstractTransition{
		
		public function AbstractTransition() { }
		
		public function applyToObject(object:AbstractComponent, time:uint):AbstractDecorator {
			return new AbstractDecorator(object);
			//throw new IllegalOperationError();
		}
		
		public function dispose():void { }
		
	}

}
