package by.vaukalak.html.data {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
		import by.vaukalak.core.data.Data;
		import by.vaukalak.core.data.DataContainer;
import by.vaukalak.html.data.style.ElementStyle;
import by.vaukalak.html.data.style.IStyle;


public class Tag extends DataContainer implements ITagData{
		private var _html:XML;
		private var _style:ElementStyle;
		
		public function Tag(html:XML) {
			super();
			name = String(html.name()).toLowerCase();
			_html = html;
		}
		
		/* INTERFACE by.vaukalak.display.html.data.ITagData */
		
		public function get head():IHeadData {
			return ITagData(dataBase).head;
		}
		
		public function get style():IStyle {
			if (!_style) _style = new ElementStyle(this);
			return _style;
		}
		
		
		public function get html():XML{
			return _html;
		}
		
		public function get tagType():String{
			return _html.name();
		}
		
		//-----------------------------------
		//
		//	PRIVATE
		//
		//-----------------------------------
		
	}

}