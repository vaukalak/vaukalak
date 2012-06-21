package by.vaukalak.core.logger {
	
	import by.vaukalak.core.logger.output.common.AbstractOutput;
	import by.vaukalak.core.logger.output.common.LoggerProperies;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author vaukalak
	 */
	public class Logger {
		
		//--------------------------------------------------
		//
		//	PROPERTIES
		//
		//--------------------------------------------------
		
		public static const properties:LoggerProperies = new LoggerProperies(false);
		private static const _outputStrategies:Vector.<AbstractOutput> = new Vector.<AbstractOutput>();
		private static const _linker:Dictionary = new Dictionary();
		
		//--------------------------------------------------
		//
		//	PUBLIC METHODS
		//
		//--------------------------------------------------
		
		public static function addOutputStrategy(output:AbstractOutput):void {
			if (!_linker[Object(output).constructor]) {
				_outputStrategies.push(output);
				_linker[Object(output).constructor];
			}
		}
		
		public static function log(...args):void {
			for (var i:int = 0; i < _outputStrategies.length; i++) {
				_outputStrategies[i].log(args);
			}
		}
		
	}

}