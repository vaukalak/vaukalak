package by.vaukalak.core.display.array.place {
	import by.vaukalak.core.display.array.DisplayArray;
	import flash.errors.IllegalOperationError;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class VerticalPlaceManager implements IPlaceManager{
		
		private static var _instanse:VerticalPlaceManager;
		private static var _allowed:Boolean = false;
		
		public function VerticalPlaceManager() {
			if (!_allowed) throw new IllegalOperationError();
		}
		
		static public function get instanse():VerticalPlaceManager { 
			if (!_instanse) {
				_allowed = true;
				_instanse = new VerticalPlaceManager();
				_allowed = false;
			}
			return _instanse; 
		}
		
		/* INTERFACE by.vaukalak.display.array.place.IPlaceManager */
		
		public function applyTo(array:DisplayArray):void{
			var lastY:Number = 0;
			for (var i:uint = 0; i < array.length; i++) {
				array.getItemAt(i).y = lastY;
				lastY += array.getItemAt(i).height + array.objectDistance;
			}
		}
		
	}

}