package by.vaukalak.tae.order {
	import by.vaukalak.tae.core.BaseElement;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class SequentialOrder extends AbstractOrder{
		
		public function SequentialOrder(textFields:Vector.<BaseElement>) {
			super(textFields);
			
		}
		
		override public function get nextElement():BaseElement { return super._textFields.shift(); }
		
	}

}