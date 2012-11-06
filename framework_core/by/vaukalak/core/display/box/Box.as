/**
 * User: Mihas i Valka
 * Date: 15.9.12
 * Time: 7.48
 */
package by.vaukalak.core.display.box {
import by.vaukalak.core.display.array.DisplayArray;

import flash.display.DisplayObject;

[DefaultProperty("children")]
public class Box extends DisplayArray {
    public function Box() {
    }

    override public function set children(value:Array):void {
        for each(var child:DisplayObject in value) {
            push(child);
        }
    }

}
}
