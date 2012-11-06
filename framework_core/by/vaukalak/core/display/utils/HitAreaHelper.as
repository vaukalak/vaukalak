/**
 * User: Mihas i Valka
 * Date: 1.10.12
 * Time: 23.35
 */
package by.vaukalak.core.display.utils {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.IBitmapDrawable;
import flash.display.Sprite;
import flash.geom.Matrix;

public class HitAreaHelper {

    public static function createHitArea(bitmapDrawable:IBitmapDrawable, precision:uint = 5):Sprite {
        var hitArea:Sprite = new Sprite();
        var bitmapData:BitmapData = bitmapDrawable as BitmapData || _createBitmapData(bitmapDrawable);
        hitArea.graphics.beginFill(0);
        for (var x:uint = 0; x < bitmapData.width; x += precision) {
            for (var y:uint = 0; y < bitmapData.height; y += precision) {
                if (bitmapData.getPixel32(x, y)) {

                    hitArea.graphics.drawRect(x, y, precision, precision);


                }
            }
        }

        hitArea.graphics.endFill();
        hitArea.mouseEnabled = false;
        hitArea.visible = false;
        return hitArea;
    }

    private static function _createBitmapData(bitmapDrawable:IBitmapDrawable):BitmapData {
        var bitmapData:BitmapData = new BitmapData(Object(bitmapDrawable).width, Object(bitmapDrawable).height, true, 0x00000000);
        bitmapData.draw(bitmapDrawable);
        return bitmapData;
    }

}
}
