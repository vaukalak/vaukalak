package by.vaukalak.core.display.array.place {
import avmplus.factoryXml;

import by.vaukalak.core.display.array.DisplayArray;

import flash.errors.IllegalOperationError;

/**
 * ...
 * @author Boutylin Mikhail
 */
public class VerticalLayout implements ILayout {
    private var _displayArray:DisplayArray;

    /* INTERFACE by.vaukalak.display.array.place.IPlaceManager */

    public function applyTo(array:DisplayArray):void {
        var lastY:Number = 0;
        for (var i:uint = 0; i < array.length; i++) {
            array.getItemAt(i).y = lastY;
            lastY += array.getItemAt(i).height + array.objectDistance;
        }
    }

    public function set displayArray(array:DisplayArray):void {
        _displayArray = array;
    }

    public function render():void {
        applyTo(_displayArray);
    }

}

}