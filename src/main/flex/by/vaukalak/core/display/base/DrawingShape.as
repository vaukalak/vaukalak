/**
 * User: Mihas i Valka
 * Date: 9.9.12
 * Time: 2.25
 */
package by.vaukalak.core.display.base {
public class DrawingShape extends NativeView {

    private var _color:uint;

    public function DrawingShape() {

    }

    public function set color(value:uint):void {
        _color = value;
        _render();
    }

    override public function set width(value:Number):void {
        _width = value;
        _render();
    }

    override public function set height(value:Number):void {
        _height = value;
        _render();
    }

    private function _render():void {
        if (_height && _width) {
            graphics.clear();
            graphics.beginFill(_color);
            graphics.drawRect(0, 0, _width, _height);
        }
    }

}
}
