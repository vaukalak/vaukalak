package by.vaukalak.html.view.renderer.base.factory {
import by.vaukalak.html.core.TagType;
import by.vaukalak.html.data.ITagData;
import by.vaukalak.html.view.renderer.base.tags.TagView;
import by.vaukalak.html.view.renderer.base.tags.TextTagView;

/**
	 * ...
	 * @author dsa
	 */
	public class TagVeiwFactory {
		
		public function TagVeiwFactory() {
			
		}
		
		public function createTag(data:ITagData):TagView {
			switch(data.tagType) {
				case TagType.DIV:
				case TagType.BODY:
					return new TextTagView(data);
				break;
				default:
					return new TextTagView(data);
				break;
			}
			
		}
		
	}

}