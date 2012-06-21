package by.vaukalak.tae.core {
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class BaseElement extends Sprite{
		private var _textField:TextField;
		
		public function BaseElement(textField:TextField) {
			_textField = textField;
			x = _textField.x;
			y = _textField.y;
			_textField.x = _textField.y = 0;
			addChild(_textField);
		}
		
		internal function get textField():TextField {
			return _textField;
		}
		
	}

}