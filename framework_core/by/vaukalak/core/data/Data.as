package by.vaukalak.core.data {
	import by.vaukalak.core.events.BaseEventDispatcher;
	import by.vaukalak.core.events.DataBaseEvent;
	import by.vaukalak.core.events.IBaseEventDispatcher;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	[Event(name="addedToDataBase", type="by.vaukalak.core.events.DataBaseEvent")]
	[Event(name="removedToDataBase", type="by.vaukalak.core.events.DataBaseEvent")]
	public class Data extends BaseEventDispatcher{
		
		//use namespace $internal;
		public var name:String;
		
		public function Data() {
			super(this);
		}
		
		public function get parent():DataContainer {
			return super._parent as DataContainer;
		}
		
		internal function setParent(p:DataContainer):void {
			if (_parent == p) return;
			_parent = p;
            if(parent){
                dispatchEvent(new DataBaseEvent(DataBaseEvent.ADDED, true));
            }else{
                dispatchEvent(new DataBaseEvent(DataBaseEvent.REMOVED, true));
            }
			if (dataBase) {
				dispatchEvent(new DataBaseEvent(DataBaseEvent.ADDED_TO_DATABASE));
			}else {
				if(_parent)
					_parent.addEventListener(DataBaseEvent.ADDED_TO_DATABASE, _onParentAddedToDataBase, false, int.MAX_VALUE);
				else
					dispatchEvent(new DataBaseEvent(DataBaseEvent.REMOVED_FROM_DATABASE));
			}
		}
		
		private function _onParentAddedToDataBase(e:DataBaseEvent):void {
			dispatchEvent(new DataBaseEvent(DataBaseEvent.ADDED_TO_DATABASE));
		}
		
		public function get dataBase():DataBase {
			return this.parent ? this.parent.dataBase : null;
		}
		
		/**
		 * Util function. Returns the deep of the element.
		 */
		
		public function get deep():uint {
			if (!parent) return 0;
			else return parent.deep + 1;
		}
		
	}

}