package by.vaukalak.html.data {
import by.vaukalak.html.data.style.IStyle;

/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public interface ITagData {
		function get tagType():String;
		function get html():XML;
		function get style():IStyle;
		function get head():IHeadData;
	}
	
}