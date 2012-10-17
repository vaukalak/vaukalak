/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 26.6.12
 * Time: 3.07
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.list {
import by.vaukalak.core.display.base.NativeView;

import flash.events.Event;

public class BaseRenderer extends NativeView implements IRenderer {
    private var _data:Object;

    public function set data(value:Object):void {
        _data = value;
        dispatchEvent(new Event("dataChange"));
    }

    public function get data():Object {
        return _data;
    }
}
}
