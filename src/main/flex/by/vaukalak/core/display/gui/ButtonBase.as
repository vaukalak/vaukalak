/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 9.8.12
 * Time: 11.07
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.gui {

import by.vaukalak.core.display.base.NativeView;
import by.vaukalak.core.display.resource.ResourceView;

import flash.display.DisplayObject;
import flash.text.TextFormat;

public class ButtonBase extends ResourceView {


    private var _skinURI:String;
    private var _overSkinURI:String;
    private var _downSkinURI:String;
    private var _disabledSkinURI:String;

    [Bindable]
    public var label:String;

    [Bindable]
    public var textFormat:TextFormat;

    [Exclude(kind="property", name="uri")]

    public function ButtonBase() {
        buttonMode = true;
        mouseChildren = false;
    }

    override protected function addResource(resource:DisplayObject):void {
        addChildAt(resource, 0);

    }

    private var _currentSkinURI:String;
    protected function set currentSkinURI(uri:String):void {
        if (_currentSkinURI == uri) {
            return;
        }
        _currentSkinURI = uri;
        super.uri = uri;
    }

    public function get skinURI():String {
        return _skinURI;
    }

    public function set skinURI(value:String):void {
        if (_currentSkinURI == _skinURI) {
            currentSkinURI = value;
        }
        _skinURI = value;
    }

    public function get overSkinURI():String {
        return _overSkinURI || _skinURI;
    }

    public function set overSkinURI(value:String):void {
        _overSkinURI = value;
    }

    public function get downSkinURI():String {
        return _downSkinURI || overSkinURI;
    }

    public function set downSkinURI(value:String):void {
        _downSkinURI = value;
    }

    public function get disabledSkinURI():String {
        return _disabledSkinURI || _skinURI;
    }

    public function set disabledSkinURI(value:String):void {
        _disabledSkinURI = value;
    }
}
}
