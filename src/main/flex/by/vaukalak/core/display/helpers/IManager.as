/**
 * User: Mihas i Valka
 * Date: 23.11.12
 * Time: 15.05
 */
package by.vaukalak.core.display.helpers {
import by.vaukalak.core.calls.responder.IResponder;

public interface IManager {
    function handleCommand(commandName:String, commandInfo:*, responder:IResponder):void;
}
}
