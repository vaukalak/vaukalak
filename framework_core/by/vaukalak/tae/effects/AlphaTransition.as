package by.vaukalak.tae.effects {
	import by.vaukalak.tae.core.AbstractComponent;
	import by.vaukalak.tae.core.AbstractDecorator;
	import by.vaukalak.tae.core.BaseElement;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class AlphaTransition extends AbstractTransition{
		
		public function AlphaTransition() {
			super();
		}
		
		override public function applyToObject(object:AbstractComponent, time:uint):AbstractDecorator {
			var decorator:AbstractDecorator = super.applyToObject(object, time);
			object.target.alpha = 0;
			TweenMax.to(object.target, time / 1000, { alpha:1 } );
			return decorator;
		}
		
	}

}