package by.vaukalak.html.data {
import by.vaukalak.html.data.style.IStyle;

/**
	 * ...
	 * @author dsa
	 */
	public interface IHeadData extends ITagData{
		function addTagStyle(tagName:String, style:IStyle):void;
		function getTagStyle(tagName:String):IStyle;
		
	}
	
}