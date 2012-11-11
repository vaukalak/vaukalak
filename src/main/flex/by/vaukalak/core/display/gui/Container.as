/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 9.8.12
 * Time: 12.27
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.gui {
import by.vaukalak.core.display.base.NativeView;

import flash.display.Graphics;
import flash.events.Event;

public class Container extends NativeView {

    private var _graphicsRenderer:GraphicsRenderer;

    public function Container() {
        _graphicsRenderer = new GraphicsRenderer(this.graphics);
        addEventListener(Event.ENTER_FRAME, _onStageRender);
    }


    private function _onStageRender(event:Event):void {
        _graphicsRenderer.invalidate();
    }

    public function set borderWeight(value:uint):void {
        _graphicsRenderer.setStyle("borderWeight", value);
    }

    public function set borderColor(value:uint):void {
        _graphicsRenderer.setStyle("borderColor", value);
    }

    override public function set width(value:Number):void {
        _graphicsRenderer.setStyle("width", value);
    }

    override public function set height(value:Number):void {
        _graphicsRenderer.setStyle("height", value);
    }

}
}
