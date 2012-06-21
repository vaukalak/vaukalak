package by.vaukalak.tae.order {
	import by.vaukalak.tae.core.BaseElement;
	import flash.errors.IllegalOperationError;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class AbstractOrder{
		
		protected var _textFields:Vector.<BaseElement> = Vector.<BaseElement>([]);
		
		public function AbstractOrder(textFields:Vector.<BaseElement>) {
			for (var i:uint = 0; i < textFields.length; i++) {
				_textFields.push(textFields[i]);
			}
		}
		
		public function get nextElement():BaseElement {
			throw new IllegalOperationError("attempt to call a virtual method");
		}
		
		
	}

}