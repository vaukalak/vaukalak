package by.vaukalak.html.data {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
		import by.vaukalak.core.data.DataBase;
		import by.vaukalak.html.data.ITagData;
		import by.vaukalak.html.data.style.IStyle;
		import by.vaukalak.html.data.style.ElementStyle;
import by.vaukalak.html.data.style.ElementStyle;
import by.vaukalak.html.data.style.IStyle;


public class HTML extends DataBase implements ITagData{
		private var _html:XML;
		private var _style:ElementStyle;
		
		public function HTML(html:XML) {
			super();
			_html = html;
			name = "html";
		}
		
		
		/* INTERFACE by.vaukalak.display.html.data.ITagData */
		
		public function get style():IStyle {
			if (!_style) _style = new ElementStyle(this);
			return _style;
		}
		
		public function get body():ITagData {
			return getChildByName("body") as ITagData;
		}
		
		public function get head():IHeadData {
			return getChildByName("head") as IHeadData;
		}
		
		public function get html():XML{
			return _html;
		}
		
		public function get tagType():String{
			return _html.name();
		}
		
	}

}