package by.vaukalak.core.net.loading.assets {
import by.vaukalak.core.net.loading.base.BaseLoader;
import by.vaukalak.core.net.loading.base.ILoader;

import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.utils.ByteArray;

/**
 * ...
 * @author Boutylin Mikhail
 */


public class AssetsLoader extends EventDispatcher implements ILoader {

    //**********************************************
    //
    //   PROPERTIES
    //
    //**********************************************

    public var context:LoaderContext;
    //--------------------------------------------------------------------------
    //
    //  CONSTRUCTOR
    //
    //--------------------------------------------------------------------------

    public function AssetsLoader() {
        super();

    }

    //--------------------------------------------------------------------------
    //
    //  OVERRIDEN METHODS
    //
    //--------------------------------------------------------------------------

    public function get data():* {
        try {
            return _loader.contentLoaderInfo.content;
        } catch (err:Error) {
            return _loader;
        }

    }

    public function set dataFormat(value:String):void {

    }

    public function load(url:URLRequest = null):void {
        _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onComplete, false, int.MAX_VALUE);
        _loader.load(url, context);
    }

    //--------------------------------------------------------------------------
    //
    //  PRIVATE METHODS
    //
    //--------------------------------------------------------------------------

    private function _onComplete(e:Event):void {
//        super.removeEventListener(Event.COMPLETE, _onComplete, false);
//        var bArr:ByteArray = super.data;
//        _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onBytesLoaded);
//        _loader.loadBytes(bArr, context);
//        e.stopImmediatePropagation();
//
//    }
//
//    private function _onBytesLoaded(e:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    //--------------------------------------------------------------------------
    //
    //  PRIVATE GETTERS
    //
    //--------------------------------------------------------------------------

    private var p_loader:Loader;
    private var _dataLoaded:Boolean;

    private function get _loader():Loader {
        return p_loader ||= new Loader();
    }

    public function get bytesTotal():uint {
        return 0;
    }

    public function get bytesLoaded():uint {
        return 0;
    }

    public function get dataFormat():String {
        return "";
    }

    public function set url(url:URLRequest):void {
    }

    public function get url():URLRequest {
        return null;
    }

    public function close():void {
    }

    public function get progress():Number {
        return 0;
    }
}

}