/**
 * User: Mihas i Valka
 * Date: 17.10.12
 * Time: 0.13
 */
package by.vaukalak.core.display.gui.list {
import by.vaukalak.core.data.Data;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;

public class InteractiveList extends BaseList {


    private var _currentItemView:DisplayObject;
    private var _currentItemData:*;

    public function InteractiveList() {
        addEventListener(Event.ADDED, _onChildAdded);
        addEventListener(Event.REMOVED, _onChildRemoved);
    }

    private function _onChildAdded(event:Event):void {
        var displayObject:DisplayObject = (event.target as DisplayObject);
        if (displayObject.parent == this) {
            displayObject.addEventListener(MouseEvent.CLICK, _onClick);
        }
    }

    private function _onChildRemoved(event:Event):void {
        var displayObject:DisplayObject = (event.target as DisplayObject);
        if (displayObject.parent == this) {
            displayObject.removeEventListener(MouseEvent.CLICK, _onClick);
        }
    }

    private function _onClick(event:MouseEvent):void {
        var displayObject:DisplayObject = (event.target as DisplayObject);
        var data:Object = (displayObject as IRenderer).data;
        if (data == _currentItemData && displayObject == _currentItemView) {
            return;
        }
        _currentItemView = displayObject;
        _currentItemData = data;
        dispatchEvent(new Event("currentItemChange"));
    }

    [Bindable("dataRendered")]
    [Bindable("currentItemChange")]
    public function get currentItemView():DisplayObject {
        return _currentItemView || itemViewAt(0) as DisplayObject;
    }

    [Bindable("dataRendered")]
    [Bindable("currentItemChange")]
    public function get currentItemData():* {
        return _currentItemData || itemDataAt(0);
    }

}
}
