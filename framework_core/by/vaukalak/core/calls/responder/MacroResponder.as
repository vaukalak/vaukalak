/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 29.6.12
 * Time: 2.36
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.calls.responder {

public class MacroResponder implements IResponder {

    private var _responders:Vector.<IResponder>;

    public function MacroResponder(responders:Vector.<IResponder>) {
        _responders = responders;
    }

    public function get success():Function {
        return _result;
    }

    private function _result(...params):void {
        for each(var responder:IResponder in _responders) {
            responder.success.apply(null, params)
        }
    }

    public function get fault():Function {
        return _fault;
    }

    private function _fault(...params):void {
        for each(var responder:IResponder in _responders) {
            responder.fault.apply(null, params)
        }
    }
}
}
