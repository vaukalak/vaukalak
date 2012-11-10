package by.vaukalak.core.logger.output.console
{
	import by.vaukalak.core.logger.output.common.AbstractOutput;
	
	/**
	 * ...
	 * @author vaukalak
	 */
	public class ConsoleOutput extends AbstractOutput
	{
		
		public function ConsoleOutput() {
			super();
		
		}
		
		//--------------------------------------------------
		//
		//	OVERRIDEN METHODS
		//
		//--------------------------------------------------
		
		override public function log(... args):void {
			var s:String = _generateString.apply(null, args);
			trace(s);
		}
	
	}

}