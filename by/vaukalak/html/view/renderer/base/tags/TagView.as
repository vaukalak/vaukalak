package by.vaukalak.html.view.renderer.base.tags {
import by.vaukalak.html.data.ITagData;
import by.vaukalak.html.data.style.IStyle;

import flash.display.Sprite;
	
	/**
	 * ...
	 * @author dsa
	 */
	public class TagView extends Sprite {
		
		private var _tags:Vector.<TagView>;
		protected var _data:ITagData;
		
		public function TagView(data:ITagData = null) {
			super();
			_init(data);
		}
		
		public function get style():IStyle {
			if (!_data) return null;
			return _data.style;
		}
		
		private function _init(data:ITagData):void {
			_data = data;
			_tags = new Vector.<TagView>();
		}
		
		public function addTag(tag:TagView):TagView {
			_tags.push(tag);
			return super.addChild(tag) as TagView;
		}
		
		public function getTagAt(i:uint):TagView {
			return _tags[i];
		}
		
		public function get numTags():uint {
			return _tags.length;
		}
		
		public function get data():ITagData {
			return _data;
		}
		
		
		
	}

}