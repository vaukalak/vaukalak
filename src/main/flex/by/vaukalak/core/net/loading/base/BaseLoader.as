package by.vaukalak.core.net.loading.base {
import by.vaukalak.core.net.loading.LoaderType;

import flash.errors.IOError;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.utils.Dictionary;

/**
 * ...
 * @author Boutylin Mikhail
 */


public class BaseLoader extends EventDispatcher implements ILoader {

    //--------------------------------------------------------------------------
    //
    //  PROPERTIES
    //
    //--------------------------------------------------------------------------

    private var _url:URLRequest;
    private var _ioErrorHandlers:Dictionary = new Dictionary();

    //--------------------------------------------------------------------------
    //
    //  CONSTRUCTOR
    //
    //--------------------------------------------------------------------------

    public function BaseLoader(url:URLRequest = null) {
        super(this);
        _loader.addEventListener(IOErrorEvent.IO_ERROR, _onIOError, false, 0, true);
        if (url) {
            load(url);
        }
    }


    /* INTERFACE by.vaukalak.core.resorse.ILoader */

    public function get progress():Number {
        return _loader.bytesLoaded / _loader.bytesTotal;
    }

    public function load(url:URLRequest = null):void {
        _doUpload(url ? url : this.url);
        this.url = url;
    }

    protected function _doUpload(url:URLRequest):void {
        _loader.load(url);
    }

    public function get bytesTotal():uint {

        return _loader.bytesTotal;
    }

    public function get bytesLoaded():uint {
        return _loader.bytesLoaded;
    }

    public function close():void {
        _loader.close();
    }

    public function set url(url:URLRequest):void {
        _url = url;
    }

    public function get url():URLRequest {
        return _url;
    }


    public function set dataFormat(s:String):void {
        _loader.dataFormat = s;
    }

    public function get dataFormat():String {
        return _loader.dataFormat;
    }

    public function get data():* {
        return _loader.data;
    }

    //--------------------------------------------------------------------------
    //
    //  OVERRIDDEN METHODS
    //
    //--------------------------------------------------------------------------

    override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        if (type == IOErrorEvent.IO_ERROR) {
            _ioErrorHandlers[listener] = true;
        }
        if (_delegatedEvent.indexOf(type) != -1) _addDelegatedEvent(type, useCapture, priority, useWeakReference);
        super.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
        if (type == IOErrorEvent.IO_ERROR && _ioErrorHandlers[listener]) {
            delete _ioErrorHandlers[listener];
        }
        if (_delegatedEvent.indexOf(type) != -1) _removeDelegatedEvent(type);
        super.removeEventListener(type, listener, useCapture);
    }

    override public function hasEventListener(type:String):Boolean {
        if (_delegatedEvent.indexOf(type) != -1) return _loader.hasEventListener(type);
        else return super.hasEventListener(type);
    }

    //--------------------------------------------------------------------------
    //
    //  EVENT HANDLERS
    //
    //--------------------------------------------------------------------------

    private function _onIOError(event:IOErrorEvent):void {
        if (!_hasIOErrorHandlers) {
            throw new IOError("unhandled IOErrorEvent, could not load:\t" + url.url);
        }
    }

    //--------------------------------------------------------------------------
    //
    //  PRIVATE METHODS
    //
    //--------------------------------------------------------------------------

    protected var _delegatedEvent:Vector.<String> = Vector.<String>([IOErrorEvent.IO_ERROR, Event.COMPLETE, Event.OPEN, ProgressEvent.PROGRESS]);

    private function _addDelegatedEvent(type:String, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        _loader.addEventListener(type, dispatchEvent);
    }

    private function _removeDelegatedEvent(type:String):void {
        _loader.removeEventListener(type, dispatchEvent);
    }

    private function get _hasIOErrorHandlers():Boolean {
        for (var i:* in _ioErrorHandlers) {
            return true;
        }
        return false;
    }

    //--------------------------------------------------------------------------
    //
    //  PRIVATE GETTERS
    //
    //--------------------------------------------------------------------------


    private var p_loader:URLLoader;

    private function get _loader():URLLoader {
        if (!p_loader) {
            p_loader = new URLLoader();
        }
        return p_loader;
    }

}

}