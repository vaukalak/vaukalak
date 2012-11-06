package by.vaukalak.core.display.array {
import by.vaukalak.core.display.array.place.HorrizontalLayout;
import by.vaukalak.core.display.array.place.ILayout;
import by.vaukalak.core.display.array.place.VerticalLayout;

import flash.display.DisplayObject;

/**
 * ...
 * @author Boutylin Mikhail
 */

public class DisplayArray extends NativeDisplayArray {

    protected var _items:Vector.<DisplayObject> = Vector.<DisplayObject>([]);
    protected var _managerType:uint = 0;
    private var _layout:ILayout;
    private var _standartManagers:Vector.<ILayout> = Vector.<ILayout>([new HorrizontalLayout(),
        new VerticalLayout()]);
    private var _objectDistance:Number = 0;

    public function DisplayArray() {
        super();
        managerType = PlaceManagerType.HORIZONTAL;
    }

    //--------------------------------------------------------------------------
    //
    //  PUBLIC METHODS
    //
    //--------------------------------------------------------------------------

    public function push(object:DisplayObject):DisplayObject {
        _items.push(object);
        super._addChild(object);
        update();
        return object;
    }

    public function splice(startIndex:int, length:int):void {
        for (var i:int = startIndex; i < startIndex + length; i++) {
            super._removeChildAt(i);
        }
        _items.splice(startIndex, length)
        update();
    }

    public function getItemAt(i:uint):DisplayObject {
        return _items[i];
    }

    public function getItemIndex(item:DisplayObject):int {
        for (var i:int = 0; i < _items.length; i++) {
            if (item = _items[i]) {
                return i;
            }
        }
        return -1;
    }

    public function clear():void {
        for (var i:int = 0; i < _items.length; i++) {
            super._removeChild(_items[i]);
        }
        _items = Vector.<DisplayObject>([]);
    }

    //--------------------------------------------------------------------------
    //
    //  GETTERS & SETTERS
    //
    //--------------------------------------------------------------------------

    /**
     * Type of the place manager.
     */

    public function get managerType():uint {
        return _managerType;
    }

    public function set managerType(value:uint):void {
        _managerType = value;
        if (value >= _standartManagers.length) throw new ArgumentError();
        else layout = _standartManagers[value];
    }

    /**
     * The place objects manager.
     */

    public function get layout():ILayout {
        return _layout;
    }

    public function set layout(value:ILayout):void {
        _layout = value;
        _layout.displayArray = this;
        update();
    }

    /**
     * The length of the display array
     */

    public function get length():uint {
        return _items.length;
    }

    public function set length(value:uint):void {
        if (_items.length == value) return;
        _items.length = value;
    }

    /**
     * the distance among the displayed objects
     */

    [Deprecated]
    public function get objectDistance():Number {
        return _objectDistance;
    }

    [Deprecated]
    public function set objectDistance(value:Number):void {
        if (_objectDistance == value) return;
        _objectDistance = value;
        update();
    }

    /**
     * return an item in the specific posiotion
     * @param    i the index of the item to return
     * @return
     */


    public function update():void {
        _layout.render();

    }
}

}