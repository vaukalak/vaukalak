/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 9.8.12
 * Time: 12.14
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.gui {
import by.vaukalak.core.display.base.NativeView;

import flash.profiler.profile;

import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class Text extends NativeView {

    private var _textField:TextField;
    ;

    public function Text() {
        addChild(_textField = new TextField());
        _textField.autoSize = TextFieldAutoSize.LEFT;
        super.render();
    }

    public function set textColor(value:uint):void {
        _textField.textColor = value;
    }

    public function set autoSize(value:String):void {
        if (value == _textField.autoSize) {
            _textField.autoSize = value;
            super.render();
        }
    }

    public function set text(value:String):void {
        var nextText:String = value || "";
        if (_textField.text != nextText) {
            _textField.text = nextText;
            super.render();
        }
    }

    public function set textFormat(value:TextFormat):void {
        if (value) {
            _textField.setTextFormat(value);
        } else {
//            throw new Error("text format can not be null", 2009);
        }
    }

}
}
