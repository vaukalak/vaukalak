package by.vaukalak.core.events {
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class ProcessProgressEvent extends BaseEvent{
		
		public static const PROCESS_PROGRESS:String = "process_progress";
		
		private var _progress:Number;
		
		public function ProcessProgressEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, progress:Number = 0) {
			super(type, bubbles, cancelable);
			_progress = progress;
		}
		
		public function get progress():Number { return _progress; }
		
	}

}