package by.vaukalak.core.commands {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	public interface ICommandDispatcher{
		function dispatchCommand(command:Command):void;
		function addCommandListener(commandName:String, listener:Function, priority:int=0, useWeakReference:Boolean=false):void;
		function removeCommandListener(commandName:String, listener:Function):void;
		function hasCommandListener(commandName:String):Boolean;
	}

}