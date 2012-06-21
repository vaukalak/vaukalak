package by.vaukalak.tae.order {
	import by.vaukalak.tae.core.BaseElement;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class RandomOrder extends AbstractOrder{
		
		public function RandomOrder(textFields:Vector.<BaseElement>) {
			super(textFields);
		}
		
		override public function get nextElement():BaseElement { 
			var i:uint = Math.random() * (_textFields.length - 1);
			return super._textFields.splice(i, 1)[0];
		}
		
	}

}