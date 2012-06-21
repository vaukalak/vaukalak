package by.vaukalak.tae.split {
	import by.vaukalak.tae.core.BaseElement;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class BaseSplitPattern{
		
		public function BaseSplitPattern() {
			
		}
		
		public function split(textField:TextField):Vector.<BaseElement> {
			textField.autoSize=TextFieldAutoSize.LEFT;
			textField.selectable=false;
			return Vector.<BaseElement>([textField]);
		}
		
	}

}