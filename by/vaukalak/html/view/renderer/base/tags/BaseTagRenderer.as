package by.vaukalak.html.view.renderer.base.tags {
	import by.vaukalak.core.data.DataContainer;
import by.vaukalak.html.core.styles.CommonStyles;
import by.vaukalak.html.core.styles.Float;
import by.vaukalak.html.core.styles.VerticalAlign;
import by.vaukalak.html.data.ITagData;

import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class BaseTagRenderer{
		
		public function BaseTagRenderer() {
			
		}
		
		public function renderTag(data:ITagData, view:TagView):void {
			_drawWireframe(data, view);
			_renderView(data, view);
			_renderPositions(data, view);
		}
		
		private function _drawWireframe(data:ITagData, view:TagView):void {
			var g:Graphics = view.graphics;
			g.beginFill(0, 0);
			g.drawRect(0, 0, uint(view.style.width), uint(view.style.height));
		}
		
		private function _renderView(data:ITagData, view:TagView):void {
			if (String(data.html)) {
				var tf:TextField = new TextField();
				tf.htmlText = data.html;
				tf.textColor = uint(view.style.color);
				var format:TextFormat = new TextFormat();
				//trace(StringManager.clearWhiteSpaces(view.style.textAlign));
				//format.align = view.style.textAlign;
				format.size = uint(view.style.fontSize);
				tf.setTextFormat(format);
				
				if (view.style.width == CommonStyles.AUTO) {
					//TODO: add multiline control
					tf.width = tf.getCharBoundaries(tf.length - 1).right + 3;
				}else {
					tf.width = uint(view.style.width);
				}
				
				//if (view.style.height == CommonStyles.AUTO) {
					tf.height = tf.getCharBoundaries(tf.length - 1).bottom + 3;
				//}else {
					//tf.height = uint(view.style.height);
				//}
				
				
				//trace((view.style.verticalAlign));
				switch(view.style.verticalAlign) {
					case VerticalAlign.TOP:
					break;
					case VerticalAlign.MIDDLE:
						//trace((uint(view.style.height) - tf.te) / 2);
						tf.y = (uint(view.style.height) - tf.height) / 2;
					break;
					case VerticalAlign.BOTTOM:
						tf.y = uint(view.style.height) - tf.height;
					break;
				}
				
				tf.background = true;
				tf.backgroundColor = 0x00ff00;
				view.addChild(tf);
			}
		}
		
		private function _renderPositions(data:ITagData, view:TagView):void {
			var nextPosition:Point = new Point(0, 0);
			
			for (var i:uint = 0; i < view.numTags; i++) {
				var tag:TagView = view.getTagAt(i);
				tag.x = nextPosition.x;
				tag.y = nextPosition.y;
				
				if (tag.style.float != Float.LEFT) {
					//nextPosition.y += tag.height;
					nextPosition.y += (tag.style.height == CommonStyles.AUTO) ? tag.height : tag.style.height;
				}else {
					//nextPosition.x += tag.width;
					nextPosition.x += (tag.style.width == CommonStyles.AUTO) ? tag.width : tag.style.width;
				}
			}
		}
		
	}

}