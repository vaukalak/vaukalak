package by.vaukalak.html.data.style {
import by.vaukalak.html.core.styles.StyleType;

/**
	 * ...
	 * @author dsa
	 */
	public class TagStyle implements IStyle {
		private var _hash:Object;
		
		public function TagStyle(hash:Object) {
			_hash = hash;
		}
		
		/* INTERFACE by.vaukalak.display.html.data.style.IStyle */
		
		public function get float():String {
			return _hash[StyleType.FLOAT];
		}
		
		public function get color():String {
			return _hash[StyleType.COLOR];
		}
		
		public function get width():String {
			return _hash[StyleType.WIDTH];
		}
		
		public function get height():String {
			return _hash[StyleType.HEIGHT];
		}
		
		public function get textAlign():String {
			return _hash[StyleType.TEXT_ALIGN];
		}
		
		public function get verticalAlign():String {
			return _hash[StyleType.VERTICAL_ALIGN];
		}
		
		public function get fontSize():String {
			return _hash[StyleType.FONT_SIZE];
		}
		
	}

}