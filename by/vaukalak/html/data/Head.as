package by.vaukalak.html.data {
import by.vaukalak.html.core.TagType;
import by.vaukalak.html.core.styles.StyleType;
import by.vaukalak.html.data.style.IStyle;
import by.vaukalak.html.data.style.NullStyle;
import by.vaukalak.html.data.style.TagStyle;

/**
	 * ...
	 * @author dsa
	 */
	public class Head extends Tag implements IHeadData {
		
		private var _styles:Object;
		
		public function Head(html:XML) {
			super(html);
			_styles = { };
			
			var h1:Object = { };
			h1[StyleType.FONT_SIZE] = 38;
			_styles[TagType.H1] = new TagStyle(h1);
			
			var h2:Object = { };
			h2[StyleType.FONT_SIZE] = 22;
			_styles[TagType.H2] = new TagStyle(h2);
			
			var h3:Object = { };
			h3[StyleType.FONT_SIZE] = 18;
			_styles[TagType.H3] = new TagStyle(h3);
		}
		
		/* INTERFACE by.vaukalak.display.html.data.IHeadData */
		
		public function addTagStyle(tagName:String, style:IStyle):void {
			_styles[tagName] = style;
		}
		
		public function getTagStyle(tagName:String):IStyle {
			return _styles[tagName] ? _styles[tagName] : new NullStyle();
		}
		
	}

}