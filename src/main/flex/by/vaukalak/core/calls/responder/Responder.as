/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 21.4.12
 * Time: 4.10
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.calls.responder {
public class Responder implements IResponder {
    private var _result:Function;
    private var _fault:Function;

    public function Responder(result:Function, fault:Function = null) {
        _result = result;
        _fault = fault;
    }

    public function get success():Function {
        return _result;
    }

    public function get fault():Function {
        return _fault;
    }
}
}
