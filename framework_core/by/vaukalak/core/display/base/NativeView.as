/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 21.6.12
 * Time: 4.08
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.base {
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Rectangle;

[DefaultProperty("children")]
public class NativeView extends Sprite {

    private var _verticalCenter:Number = NaN;
    private var _horizontalCenter:Number = NaN;

    public function NativeView() {
        addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage, false, 0, true);
    }

    protected function _onAddedToStage(event:Event):void {
        render();
    }

    public function set children(values:Array):void {
        for (var i:uint = 0; i < values.length; i++) {
            addChild(values[i]);
        }
    }

    public function get verticalCenter():Number {
        return _verticalCenter;
    }

    public function set verticalCenter(value:Number):void {
        _verticalCenter = value;
        render();
    }

    public function get horizontalCenter():Number {
        return _horizontalCenter;
    }

    public function set horizontalCenter(value:Number):void {
        _horizontalCenter = value;
        render();
    }

    public function render():void {

        if (!parent) {
            return;
        }

        var bounds:Rectangle;
        var parentBounds:Rectangle;


        if (width && height) {
            if (!isNaN(_horizontalCenter)) {
                bounds ||= getBounds(parent);
                parentBounds ||= parent.getBounds(parent);
                var leftMargin:Number = bounds.left - parentBounds.left;
                var deltaWidth = parentBounds.width - bounds.width;
                x += (deltaWidth / 2 - leftMargin) + _horizontalCenter;
            }

            if (!isNaN(_verticalCenter)) {
                bounds ||= getBounds(parent);
                parentBounds ||= parent.getBounds(parent);
                var topMargin:Number = bounds.top - parentBounds.top;
                var deltaHeight:Number = parentBounds.height - bounds.height;
                y += deltaHeight / 2 - topMargin + _verticalCenter;
            }
        }


    }

    private var _width:Number;
    private var _height:Number;

    override public function get width():Number {
        return _width || super.width;
    }

    override public function set width(value:Number):void {
        _width = value;
    }

    override public function get height():Number {
        return _height || super.height;
    }

    override public function set height(value:Number):void {
        _height = value;
    }
}
}
