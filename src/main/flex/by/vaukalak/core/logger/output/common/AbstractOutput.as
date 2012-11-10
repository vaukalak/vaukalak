package by.vaukalak.core.logger.output.common {
	import flash.errors.IllegalOperationError;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author vaukalak
	 */
	public class AbstractOutput {
		
		protected var _properties:LoggerProperies;
		
		public function AbstractOutput() {
			if (getQualifiedClassName(this) == "by.vaukalak.core.logger.output.common::AbstractOutput") 
				throw new IllegalOperationError("Abstract class constructor invoked");
			_initProperties();
		}
		
		//--------------------------------------------------
		//
		//	PUBLIC METHODS
		//
		//--------------------------------------------------
		
		public virtual function log(...args):void {
			
		}
		
		//--------------------------------------------------
		//
		//	PROTECTED METHODS
		//
		//--------------------------------------------------
		
		protected function _initProperties():void {
			_properties = new LoggerProperies();
		}
		
		protected function _generateString(...args):String {
			var outputString:String = args.join(", ");
			if (properties.outputTime) outputString = new Date() + ":\t" + outputString;
			return outputString;
		}
		
		//--------------------------------------------------
		//
		//	GETTERS
		//
		//--------------------------------------------------
		
		public function get properties():LoggerProperies {
			return _properties;
		}
		
	}

}