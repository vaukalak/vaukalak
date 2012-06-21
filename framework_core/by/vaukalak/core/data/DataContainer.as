package by.vaukalak.core.data {
	import by.vaukalak.core.events.DataBaseEvent;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	[Event(name="childAdded", type="by.vaukalak.core.events.DataBaseEvent")]
	public class DataContainer extends Data{
		private var _children:Vector.<Data> = Vector.<Data>([]);
		
		//use namespace $internal;
		
		public function DataContainer() {
			super();
			
		}
		
		public function addChild(child:Data):Data {
			if (child == this) return child;
			var p:DataContainer = parent;
			while (p) {
				if (p == child) return child;
				p = p.parent;
			}
			if (child.parent) child.parent.removeChild(child);
			dispatchEvent(new DataBaseEvent(DataBaseEvent.CHILD_ADDED, true));
			child.setParent(this);
			_children.push(child);
			return child;
		}
		
		public function removeChild(child:Data):Data {
			var i:int = _children.indexOf(child);
			if (i == -1) throw new ArgumentError("not found");
			else _children.splice(i, 1);
			child.setParent(null);
			return child;
		}
		
		public function get numChildren():uint {
			return _children.length;
		}
		
		public function getChildByName(name:String):Data {
			for (var i:uint; i < _children.length; i++) if (_children[i].name == name) return _children[i];
			return null;
		}
		
		public function getChildAt(i:uint):Data {
			return _children[i];
		}
	}

}