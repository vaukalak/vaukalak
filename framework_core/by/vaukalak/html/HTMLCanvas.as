package by.vaukalak.html {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
		import by.vaukalak.core.utils.string.StringManager;
import by.vaukalak.html.data.DataBuilder;
import by.vaukalak.html.data.HTML;
import by.vaukalak.html.utils.repairHTMLString;
import by.vaukalak.html.view.renderer.IRenderer;
import by.vaukalak.html.view.renderer.base.BaseRenderer;
import by.vaukalak.html.view.renderer.base.factory.TagVeiwFactory;
import by.vaukalak.html.view.renderer.base.tags.TagView;

import flash.display.Sprite;
	

	
	public class HTMLCanvas extends TagView{
		
		//private var _html:HTML;
		private var _builder:DataBuilder;
		private var _tagViewFactory:TagVeiwFactory;
		private var _renderer:IRenderer;
		
		public function HTMLCanvas() {
			super();
			_builder = new DataBuilder();
			_tagViewFactory = new TagVeiwFactory();
			_renderer = new BaseRenderer(_tagViewFactory);
		}
		
		//--------------------------------------------------------------------------
		//
		//  RENDERING THE VISUALIZATION
		//
		//--------------------------------------------------------------------------
		
		public function render():void {
			_renderer.render(HTML(super.data).body, this);
		}
		
		//--------------------------------------------------------------------------
		//
		//  HANDLING THE HTML VALUE
		//
		//--------------------------------------------------------------------------
		
		public function set htmlString(str:String):void {
			trace(str);
			super._data = _builder.buildHTMLPage(XMLList(repairHTMLString(str)));
			//html = XML(StringUtils.repairHTMLString(str));
		}
		
		
		//public function set html(value:XML):void {
			//_html = _builder.buildHTMLPage(value);
		//}
		//
		//public function get html():XML { return HTML(_html).html; }
		
	}

}