package by.vaukalak.html.view.renderer.base {
	import by.vaukalak.core.data.DataContainer;
import by.vaukalak.html.data.ITagData;
import by.vaukalak.html.view.renderer.IRenderer;
import by.vaukalak.html.view.renderer.base.factory.TagVeiwFactory;
import by.vaukalak.html.view.renderer.base.tags.BaseTagRenderer;
import by.vaukalak.html.view.renderer.base.tags.TagView;

import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class BaseRenderer implements IRenderer{
		
		private var _factory:TagVeiwFactory;
		
		public function BaseRenderer(factory:TagVeiwFactory) {
			_factory = factory;
		}
		
		public function render(data:ITagData, container:TagView):void {
			var tagSprite:TagView = _factory.createTag(data);
			var dataContainer:DataContainer = data as DataContainer;
			for (var i:uint = 0; i < dataContainer.numChildren; i++) {
				render(dataContainer.getChildAt(i) as ITagData, tagSprite);
			}
			container.addTag(_renderTag(data, tagSprite));
		}
		
		private function _renderTag(tag:ITagData, sp:TagView):TagView {
			new BaseTagRenderer().renderTag(tag, sp);
			return sp;
		}
		
		
	}

}