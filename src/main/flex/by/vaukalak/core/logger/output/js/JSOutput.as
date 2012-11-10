package by.vaukalak.core.logger.output.js {
	import by.vaukalak.core.logger.output.common.AbstractOutput;
	import flash.external.ExternalInterface;
	
	/**
	 * ...
	 * @author vaukalak
	 */
	public class JSOutput extends AbstractOutput {
		
		public function JSOutput() {
			super();
			
		}
		
		//--------------------------------------------------
		//
		//	OVERRIDEN METHODS
		//
		//--------------------------------------------------
		
		override public function log(...args):void {
			super.log();
			var s:String = _generateString.apply(null, args);
			if(ExternalInterface.available)
				ExternalInterface.call("log", s);
		}
		
	}

}