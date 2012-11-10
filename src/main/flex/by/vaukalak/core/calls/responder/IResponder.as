/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 21.4.12
 * Time: 4.10
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.calls.responder {
public interface IResponder {
    function get success():Function;

    function get fault():Function;
}
}
