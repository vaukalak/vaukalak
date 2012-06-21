package by.vaukalak.html.view.renderer {
import by.vaukalak.html.data.ITagData;
import by.vaukalak.html.view.renderer.base.tags.TagView;

import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public interface IRenderer {
		function render(data:ITagData, container:TagView):void;
	}
	
}