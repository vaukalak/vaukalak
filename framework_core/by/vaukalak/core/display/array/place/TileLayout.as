/**
 * User: Mihas i Valka
 * Date: 20.9.12
 * Time: 3.48
 */
package by.vaukalak.core.display.array.place {
import by.vaukalak.core.display.array.DisplayArray;

public class TileLayout implements ILayout {

    private var _horizontalGap:Number = 0;
    private var _verticalGap:Number = 0;
    private var _columns:uint = 0;
    private var _displayArray:DisplayArray;

    public function applyTo(array:DisplayArray):void {
        var lastX:Number = 0;
        var lastY:Number = 0;
        for (var i:uint = 0; i < array.length; i++) {
            if (i && !(i % _columns)) {
                lastY += array.getItemAt(i).height + _verticalGap;
                lastX = 0
            }
            array.getItemAt(i).x = lastX;
            array.getItemAt(i).y = lastY;
            lastX += array.getItemAt(i).width + _horizontalGap;
        }
    }

    public function set horizontalGap(value:Number):void {
        _horizontalGap = value;
        commitProperties();
    }

    public function set verticalGap(value:Number):void {
        _verticalGap = value;
        commitProperties();
    }

    public function set columns(value:uint):void {
        _columns = value;
        commitProperties();
    }

    public function set displayArray(array:DisplayArray):void {
        _displayArray = array;

    }

    public function commitProperties():void {
        render();
    }

    public function render():void {
        if (_displayArray) {

            applyTo(_displayArray);
        }
    }

    public function get horizontalGap():Number {
        return _horizontalGap;
    }

    public function get verticalGap():Number {
        return _verticalGap;
    }

    public function get columns():uint {
        return _columns;
    }
}
}
