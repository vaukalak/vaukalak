/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 29.6.12
 * Time: 2.47
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.calls {
public class Caller {

    private var _callback:Function;
    private var _pararms:Array;

    public var constructorArgumentsFirst:Boolean = true;

    public function Caller(callback:Function, ...pararms) {
        _callback = callback;
        _pararms = pararms;
    }

    public function call(...params):* {
        return _callback.apply(null, constructorArgumentsFirst ? _pararms.concat(params) : params.concat(_pararms));
    }

}
}
