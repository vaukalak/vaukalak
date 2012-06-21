package by.vaukalak.core.process {
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	public interface IProgressable extends IEventDispatcher{
		[Event(name = "progress", "by.vaukalak.events.ProgressEvent")];
		
		function get progress():Number;
	}
	
}