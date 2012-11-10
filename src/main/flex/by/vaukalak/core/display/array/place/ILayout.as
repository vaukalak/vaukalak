package by.vaukalak.core.display.array.place {
import by.vaukalak.core.display.array.DisplayArray;

/**
 * ...
 * @author Boutylin Mikhail
 */
public interface ILayout {
    [Deprecated] function applyTo(array:DisplayArray):void;


    function set displayArray(array:DisplayArray):void;

    function render():void;
}

}