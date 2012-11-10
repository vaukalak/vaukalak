/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 9.8.12
 * Time: 12.27
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.utils {
public class ProxyValue {


    private var _value:*;
    private var _changed:Boolean;

    public function get changed():Boolean {
        return _changed;
    }

    public function set value(val:*):void {
        _value = val;
        _changed = true;
    }

    public function get value():* {
        return _value;
    }

    public function getAndApproveValue():* {
        _changed = false;
        return _value;
    }

    public function approveValue():void {
        _changed = false;
    }

}
}
