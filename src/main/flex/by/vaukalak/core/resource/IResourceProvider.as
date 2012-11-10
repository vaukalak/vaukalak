/**
 * Created by IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 10.4.12
 * Time: 9.14
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.resource {
import by.vaukalak.core.calls.responder.IResponder;

public interface IResourceProvider {
    function getResource(protocol:String, urn:String, responder:IResponder):void;
}
}
