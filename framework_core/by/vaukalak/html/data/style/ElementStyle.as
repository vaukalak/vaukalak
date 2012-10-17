package by.vaukalak.html.data.style {
import by.vaukalak.core.data.Data;
import by.vaukalak.core.data.DataBase;
import by.vaukalak.core.utils.string.StringHelper;
import by.vaukalak.html.core.styles.CommonStyles;
import by.vaukalak.html.core.styles.StyleType;
import by.vaukalak.html.data.ITagData;
import by.vaukalak.html.utils.getDefaultStyleValue;
import by.vaukalak.html.utils.getStyleCanBeInherited;

import flash.utils.flash_proxy;
import flash.utils.Proxy;

/**
 * ...
 * @author dsa
 */
public dynamic class ElementStyle implements IStyle {
    private var _target:ITagData;

    public function ElementStyle(target:ITagData) {
        super();
        _target = target;
        textAlign;
        this[StyleType.TEXT_ALIGN] = _getTextAlign;
        this[StyleType.VERTICAL_ALIGN] = _getVerticalAlign;
        this[StyleType.FONT_SIZE] = _getFontSize;
    }

    protected function _getProperty(name:*):* {

        //recive the style value and return it not null or 'inherit'

        var s:* = _getStyle(name);
        if (s && s != CommonStyles.INHERIT) {
            //trace(0, name);
            return s;
        }

        var repName:String = name;
        if (repName == "text-align") repName = "textAlign";
        if (repName == "vertical-align") repName = "verticalAlign";
        if (repName == "font-size") repName = "fontSize";

        var tagStyle:IStyle = _target.head.getTagStyle(_target.tagType);
        if (tagStyle[repName] != null) return tagStyle[repName];
        //if the target is data it can't have parent nodes

        if (_target is DataBase) {
            //trace(1, name);
            return getDefaultStyleValue(name, _target.tagType);
        }

        //return the parent style, if the style can be inherided

        else if (getStyleCanBeInherited(name)) {
            //trace(2, name);
            var parentValue:* = ITagData(Data(_target).parent).style[name];
            if (parentValue is Function) return parentValue();
            else return parentValue;
        }

        //othewise returns the default value

        else {
            //trace(3, name);
            return getDefaultStyleValue(name, _target.tagType);
        }
    }

    private function _getStyle(name:String):* {
        if (!_target.html["@style"]) return null;
        var styles:Array = String(_target.html["@style"]).split(/[:;]/);
        var i:uint = styles.indexOf(name);
        if (i == -1 || i == styles.length) null;
        return styles[i + 1];
    }


    /* INTERFACE by.vaukalak.display.html.data.style.IStyle */

    public function get textAlign():String {
        return _formatStyleValue(_getTextAlign());
    }

    protected function _getTextAlign():String {
        var s:String = _getProperty(StyleType.TEXT_ALIGN);
        return s;
    }

    public function get verticalAlign():String {
        return _formatStyleValue(_getVerticalAlign());
    }

    protected function _getVerticalAlign():String {
        return _formatStyleValue(_getProperty(StyleType.VERTICAL_ALIGN));
    }

    public function get width():String {
        var s:String = _getProperty(StyleType.WIDTH);
        s = s.replace("px", "");
        return _formatStyleValue(s);
    }

    public function get height():String {
        var s:String = _getProperty(StyleType.HEIGHT);
        s = s.replace("px", "");
        return _formatStyleValue(s);
    }

    public function get fontSize():String {
        var s:String = _getFontSize();
        s = s.replace("px", "");
        return _formatStyleValue(s);
    }

    protected function _getFontSize():String {
        return _formatStyleValue(_getProperty(StyleType.FONT_SIZE));
    }

    public function get color():String {
        var col:String = _getProperty(StyleType.COLOR);
        if (col == CommonStyles.NONE) {
            // the standart color is black
            col = "0";
        } else {
            if (col.charAt(0) == "#") {
                col = col.substr(1);
                if (col.length == 3) { //if color is written in short notation, we duplicate all characters
                    var temp:String = col;
                    col = "";
                    for (var i:uint = 0; i < temp.length; i++) col += temp.charAt(i) + temp.charAt(i);
                }
                col = "0x" + col;
            }
        }
        return _formatStyleValue(col);
    }

    private function _formatStyleValue(s:String):String {
        return StringHelper.clearWhiteSpaces(s);
    }

    public function get float():String {
        return _getProperty(StyleType.FLOAT);
    }

}

}