package by.vaukalak.core.controllers {
import by.vaukalak.core.calls.responder.IResponder;
import by.vaukalak.core.commands.ICommandDispatcher;

import flash.display.DisplayObjectContainer;
import flash.net.Responder;

/**
 * ...
 * @author Boutylin Mikhail
 */
public interface IBaseController extends IController, ICommandDispatcher {
    function call(commandName:String, args:Array = null):void;

    function get container():DisplayObjectContainer;
}

}