package by.vaukalak.html.data {
	import by.vaukalak.core.data.DataContainer;
import by.vaukalak.html.utils.lowTagName;

/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class DataBuilder{
		
		public function DataBuilder() {
			
		}
		
		public function buildHTMLPage(html:*):HTML {
			html = _repairHTML(html);
			var result:HTML = new HTML(html);
			var subtags:Vector.<Tag> = buildHTML(html);
			result.addChild(subtags[0]);
			result.addChild(subtags[1]);
			
			return result;
		}
		
		public function buildHTML(html:XML):Vector.<Tag> {
			
			var v:Vector.<Tag> = new Vector.<Tag>();
			for each(var tag:XML in html.*) {
				
				var subTags:Vector.<Tag> = Vector.<Tag>([]);
				if (!tag.hasSimpleContent()) {
					subTags = buildHTML(tag);	
				}
				for each(var subTag:XML in tag.*) {
					delete tag[subTag.name()][0];
				}
				
				var element:Tag = tag.name() == "head" ? new Head(tag) : new Tag(tag);
				for (var i:uint = 0; i < (subTags ? subTags.length : 0); i++) {
					element.addChild(subTags[i]);
				}
				v.push(element);
			}
			return v;
		}
		
		private function _constructHead(html:HTML):void {
			
		}
		
		private function _repairHTML(html:*):XML {
			var htmlPage:* = html;
			if (html.length != 1 || lowTagName(html.name()) != "html") {
				if (html.length != 1 || lowTagName(html.name()) != "body") {
					html = _putInTag(html, "body");
				}
				htmlPage = _putInTag(html, "html");
				htmlPage.insertChildBefore(html, XML("<head></head>"));
			}
			return htmlPage;
		}
		
		private function _putInTag(data:*, name:String):XML {
			return XML("<" + name + "></" + name + ">").appendChild(data);
		}
		
	}

}