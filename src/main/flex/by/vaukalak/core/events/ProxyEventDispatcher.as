//ORIGINAL: http://code.google.com/p/blooddy/source/browse/trunk/blooddy_core/src/by/blooddy/core/utils/proxy/ProxyEventDispatcher.as?r=218
package by.vaukalak.core.events {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.utils.Proxy;

//--------------------------------------
//  Events
//--------------------------------------

/**
 * @copy                flash.events.EventDispatcher#activate
 */
[Event(name="activate", type="flash.events.Event")]

/**
 * @copy                flash.events.EventDispatcher#deactivate
 */
[Event(name="deactivate", type="flash.events.Event")]

public dynamic class ProxyEventDispatcher extends Proxy implements IEventDispatcher {

    //--------------------------------------------------------------------------
    //
    //  CONSTRUCTOR
    //
    //--------------------------------------------------------------------------

    public function ProxyEventDispatcher(target:IEventDispatcher = null) {
        super();
        this._dispatcher = new EventDispatcher(target || this);
    }

    //--------------------------------------------------------------------------
    //
    //  PROPERTIES
    //
    //--------------------------------------------------------------------------

    private var _dispatcher:EventDispatcher;

    //--------------------------------------------------------------------------
    //
    //  Implements methods: IEventDispatcher
    //
    //--------------------------------------------------------------------------

    public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        this._dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
        this._dispatcher.removeEventListener(type, listener, useCapture);
    }

    public function dispatchEvent(event:Event):Boolean {
        return this._dispatcher.dispatchEvent(event);
    }

    public function hasEventListener(type:String):Boolean {
        return this._dispatcher.hasEventListener(type);
    }

    public function willTrigger(type:String):Boolean {
        return this._dispatcher.willTrigger(type);
    }

}

}