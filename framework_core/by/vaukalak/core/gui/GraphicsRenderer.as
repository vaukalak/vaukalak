/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 9.8.12
 * Time: 12.41
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.gui {
import flash.display.Graphics;
import flash.utils.Proxy;
import flash.utils.flash_proxy;

use namespace flash_proxy;

public class GraphicsRenderer {

    private var _target:Graphics;
    private var _changed:Boolean;

    private var _alpha:Number = 1;
    private var _color:Number = 0xFFFFFF;
    private var _borderWeight:Number = 1;
    private var _borderColor:Number = 0x000000;
    private var _borderAlpha:Number = 1;
    private var _width:Number;
    private var _height:Number;

    public function GraphicsRenderer(target:Graphics) {
        _target = target;
    }


    public function invalidate():void {
        if (_changed) {
            _target.clear();
            _target.lineStyle(_borderWeight, _borderColor, _borderAlpha);
            _target.beginFill(_color, _alpha);
            _target.drawRect(0, 0, _width || 1, _height || 1);
            _target.endFill();
            _changed = false;
        }
    }

    public function setStyle(name:String, value:uint):void {
        _changed = true;
        this["_" + name] = value;
    }

}
}
