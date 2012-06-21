package by.vaukalak.tae.split {
	import by.vaukalak.tae.SplitMode;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class SplitModeFactory{
		
		private var _type:String;
		
		public function SplitModeFactory() { }
		
		public function createSplitPattern():BaseSplitPattern {
			switch(_type) {
				case SplitMode.ALL:
					return new BaseSplitPattern();
				break;
				case SplitMode.CHAR:
					return new CharSplitPattern();
				break;
				case SplitMode.WORD:
					return new CharSplitPattern();
				break;
				case SplitMode.LINE:
					return new CharSplitPattern();
				break;
				default:
					throw new ArgumentError("incorrect order type");
			}
		}
		
		public function get type():String { return _type; }
		
		public function set type(value:String):void {
			_type = value;
		}
		
	}

}