package by.vaukalak.core.controllers {
	import by.vaukalak.core.commands.ICommandDispatcher;
	import flash.display.DisplayObjectContainer;
	import flash.net.Responder;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public interface IBaseController extends IController, ICommandDispatcher{
		function call(commandName:String, responder:Responder, ...args):void;
		function get container():DisplayObjectContainer;
	}
	
}