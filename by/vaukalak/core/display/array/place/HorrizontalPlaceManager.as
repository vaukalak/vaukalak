package by.vaukalak.core.display.array.place {
	import by.vaukalak.core.display.array.DisplayArray;
	import flash.errors.IllegalOperationError;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class HorrizontalPlaceManager implements IPlaceManager{
		
		//--------------------------------------------------------------------------
		//
		//  VIRTUAL CONSTRUCTOR
		//
		//--------------------------------------------------------------------------
		
		private static var _instanse:HorrizontalPlaceManager;
		private static var _allowed:Boolean = false;
		
		public function HorrizontalPlaceManager() {
			if (!_allowed) throw new IllegalOperationError();
		}
		
		/**
		 * retruns the instanse to the unique object of this class
		 */
		
		public static function get instanse():HorrizontalPlaceManager { 
			if (!_instanse) {
				_allowed = true;
				_instanse = new HorrizontalPlaceManager();
				_allowed = false;
			}
			return _instanse; 
		}
		
		//--------------------------------------------------------------------------
		//
		//  PUBLIC METHODS
		//
		//--------------------------------------------------------------------------
		
		public function applyTo(array:DisplayArray):void {
			var lastX:Number = 0;
			for (var i:uint = 0; i < array.length; i++) {
				array.getItemAt(i).x = lastX;
				lastX += array.getItemAt(i).width + array.objectDistance;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------
		
	}

}