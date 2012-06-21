package by.vaukalak.html.utils {
import by.vaukalak.html.core.styles.CommonStyles;
import by.vaukalak.html.core.styles.StyleType;
import by.vaukalak.html.core.styles.VerticalAlign;

import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author dsa
	 */
	
	public function getDefaultStyleValue(name:String, tagName:String):String {
		switch(name) {
			case StyleType.FLOAT: return CommonStyles.NONE; break;
			case StyleType.COLOR: return "#000000"; break;
			case StyleType.WIDTH: return CommonStyles.AUTO; break;
			case StyleType.HEIGHT: return CommonStyles.AUTO; break;
			case StyleType.TEXT_ALIGN: return TextFormatAlign.LEFT; break;
			case StyleType.VERTICAL_ALIGN: return VerticalAlign.TOP; break;
			case StyleType.FONT_SIZE: return "12"; break;
			default: return CommonStyles.NONE; break;
		}
	}

}