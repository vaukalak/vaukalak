package by.vaukalak.core.display.array.place {
import by.vaukalak.core.display.array.DisplayArray;

import flash.errors.IllegalOperationError;

/**
 * ...
 * @author Boutylin Mikhail
 */
public class HorrizontalLayout implements ILayout {
    private var _displayArray:DisplayArray;


    //--------------------------------------------------------------------------
    //
    //  PUBLIC METHODS
    //
    //--------------------------------------------------------------------------

    public function applyTo(array:DisplayArray):void {
        var lastX:Number = 0;
        for (var i:uint = 0; i < array.length; i++) {
            array.getItemAt(i).x = lastX;
            lastX += array.getItemAt(i).width + array.objectDistance;
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