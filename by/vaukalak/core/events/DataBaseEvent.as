package by.vaukalak.core.events {
	/**
	 * ...
	 * @author dsa
	 */
	public class DataBaseEvent extends BaseEvent {
		
		public static const ADDED_TO_DATABASE:String = "addedToDataBase";
		public static const REMOVED_FROM_DATABASE:String = "removedToDataBase";
		public static const CHILD_ADDED:String = "childAdded";
		public static const ADDED:String = "added";
		public static const REMOVED:String = "removed";

		public function DataBaseEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			
		}
		
	}

}