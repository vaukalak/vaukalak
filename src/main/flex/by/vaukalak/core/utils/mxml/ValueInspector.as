/**
 * User: Mihas i Valka
 * Date: 16.9.12
 * Time: 17.37
 */
package by.vaukalak.core.utils.mxml {
import flash.events.Event;
import flash.events.EventDispatcher;

[Event(name="match", type="flash.events.Event")]
public class ValueInspector extends EventDispatcher {

    private var _matchValue:*;
    private var _currentValue:*;

    public function set matchValue(value:*):void {
        if (_matchValue == value) return;
        _matchValue = value;
        _updateState();
    }

    public function set currentValue(value:*):void {
        if (_currentValue == value) return;
        _currentValue = value;
        _updateState();
    }

    private function _updateState():void {
        if (_currentValue != undefined && _matchValue != undefined) {
            if (_currentValue == _matchValue) {
                dispatchEvent(new Event("match"));
            }
        }
    }

}
}
