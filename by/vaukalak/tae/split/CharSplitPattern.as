package by.vaukalak.tae.split {
	import by.vaukalak.tae.core.BaseElement;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class CharSplitPattern extends BaseSplitPattern{
		
		public function CharSplitPattern() {
			super();
			
		}
		
		override public function split(textField:TextField):Vector.<BaseElement> {
			var i:uint = textField.length;
			var result:Vector.<BaseElement> = Vector.<BaseElement>([]);
			while (i--) {
				if (textField.text.charAt(i) != "") {
					var tf:TextField = new TextField();
					tf.text = textField.text.charAt(i);
					tf.setTextFormat(textField.getTextFormat(i, i + 1));
					tf.embedFonts = true;
					tf.autoSize=TextFieldAutoSize.LEFT;
					tf.selectable = false;
					var item:BaseElement = new BaseElement(tf);
					item.x = textField.getCharBoundaries(i).x;
					item.y = textField.getCharBoundaries(i).y;
					result.unshift(item);
				}
			}
			return result;
		}
		
	}

}