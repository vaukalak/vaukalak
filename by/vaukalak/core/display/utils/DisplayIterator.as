package by.vaukalak.core.display.utils {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class DisplayIterator{
		
		public function DisplayIterator() {
			
		}
		
		public function getEelementByClass(cl:Class, root:DisplayObjectContainer, strict:Boolean = true):Vector.<DisplayObject> {
			var result:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			for (var i:uint = 0; i < root.numChildren; i++) {
				var child:DisplayObject = root.getChildAt(i);
				//if (strict ? (typeof(child) == cl) : (child is cl)) result.push(child);
				if (child is cl) result.push(child);
				if (child is DisplayObjectContainer) 
					result = result.concat(getEelementByClass(cl, child as DisplayObjectContainer, strict));
			}
			return result;
		}
		
	}

}