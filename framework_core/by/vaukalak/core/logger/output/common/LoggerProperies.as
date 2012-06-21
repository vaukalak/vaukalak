package by.vaukalak.core.logger.output.common {
	import by.vaukalak.core.logger.Logger;
	/**
	 * ...
	 * @author vaukalak
	 */
	public class LoggerProperies {
		
		//--------------------------------------------------
		//
		//	PROPERTIES
		//
		//--------------------------------------------------
		
		private var _outputTime:* = BooleanProperties.INHERITED;
		private var _inherit:Boolean;
		
		//--------------------------------------------------
		//
		//	CONSTRUCTOR
		//
		//-------------------------------------------------
		
		/**
		 * 
		 * @param	inherit specifice if properties should inherit values from global properies
		 */
		
		public function LoggerProperies(inherit:Boolean = true) {
			super();
			this._inherit = inherit;
			
		}
		
		//--------------------------------------------------
		//
		//	PROPERIE ACSESSORS
		//
		//--------------------------------------------------
		
		public function get outputTime():Boolean {
			if (_outputTime == BooleanProperties.INHERITED && _inherit) return Logger.properties.outputTime;
			if (_outputTime == BooleanProperties.INHERITED) return false;
			return _outputTime;
		}
		
		public function set outputTime(value:Boolean):void {
			_outputTime = value;
		}
		
		
	}

}