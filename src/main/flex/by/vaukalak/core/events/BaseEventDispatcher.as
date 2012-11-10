package by.vaukalak.core.events {
import flash.events.Event;
import flash.events.EventDispatcher;

/**
 * ...
 * @author Boutylin Mikhail
 */
public class BaseEventDispatcher implements IBaseEventDispatcher {

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    private var _subPriority:uint = 0;
    private var _target:IBaseEventDispatcher;
    private const _listeners:Vector.<EventListener> = new Vector.<EventListener>([]);
    protected var _parent:BaseEventDispatcher;

    private var _nativeDispatcher:EventDispatcher;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function BaseEventDispatcher(target:IBaseEventDispatcher = null) {
        _target = target ? target : this;
        _nativeDispatcher = new EventDispatcher(_target);
    }

    //--------------------------------------------------------------------------
    //
    //  PUBLIC METHODS
    //
    //--------------------------------------------------------------------------

    public function dispatchEvent(event:Event):Boolean {
        if (event is BaseEvent) {
            BaseEvent(event).$target = _target;
            _broadcastEvent(BaseEvent(event));
            return !event.isDefaultPrevented();
        } else {
            return _nativeDispatcher.dispatchEvent(event);
        }
    }

    public function hasEventListener(type:String):Boolean {
        for (var i:uint = 0; i < _listeners.length; i++) if (_listeners[i].type == type) return true;
        return _nativeDispatcher.hasEventListener(type);
    }

    public function willTrigger(type:String):Boolean {
        return false;
    }

    public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
        for (var i:uint = 0; i < _listeners.length; i++) {
            var eListener:EventListener = _listeners[i];
            if ((eListener.type == type) &&
                    (eListener.listener == listener) &&
                    (eListener.useCapture == useCapture)) {
                _listeners.splice(i, 1);
                i--;
            }
        }
        _nativeDispatcher.removeEventListener(type, listener, useCapture);
    }

    public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        for (var i:uint = 0; i < _listeners.length; i++) {
            var eListener:EventListener = _listeners[i];
            if ((eListener.type == type) &&
                    (eListener.listener == listener) &&
                    (eListener.useCapture == useCapture))
                return;
        }
        var eventListener:EventListener = new EventListener(type, listener, useCapture, priority, useWeakReference);
        eventListener.subPriority = _subPriority++;
        _listeners.push(eventListener);
        _nativeDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    //-----------------------------------
    //
    //	PRIVATE METHODS
    //
    //-----------------------------------

    private function _broadcastEvent(e:BaseEvent):void {
        e.$currentTarget = this;
        var listeners:Vector.<EventListener> = _getListenersOrderedByPriority(e.type);
        for (var i:uint = 0; i < listeners.length; i++) {
            var eListener:EventListener = listeners[i];
            if (eListener.type == e.type && !e.$stopImmediately) {
                eListener.handler(e);
            }
        }
        if (e.bubbles && _parent && !e.$stopped) {
            _parent._broadcastEvent(e);
        }
    }

    private function _getListenersOrderedByPriority(type:String):Vector.<EventListener> {
        //TODO: add cash
        var listeners:Vector.<EventListener> = new Vector.<EventListener>();
        for (var i:uint = 0; i < this._listeners.length; i++)
            if (this._listeners[i].type == type)
                listeners.push(this._listeners[i]);
        for (var j:uint = 0; j < listeners.length - 1; j++) {
            for (var k:int = j; k < listeners.length; k++) {
                var swapListeners:Boolean = listeners[j].priority < listeners[k].priority;
                swapListeners = swapListeners || (listeners[j].priority == listeners[k].priority && listeners[j].subPriority > listeners[k].subPriority);
                if (swapListeners) {
                    var temp:EventListener = listeners[j];
                    listeners[j] = listeners[k];
                    listeners[k] = temp;
                }
            }
        }
        return listeners;
    }

}

}

import flash.events.Event;

class EventListener {

    public function EventListener(type:String, listener:Function, useCapture:Boolean, priority:int, useWeakReference:Boolean) {
        super();
        this.type = type;
        this.listener = listener;
        this.useCapture = useCapture;
        this.priority = priority;
        this.useWeakReference = useWeakReference;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    public var type:String;
    public var listener:Function;
    public var useCapture:Boolean;
    public var priority:int;
    public var useWeakReference:Boolean;
    public var subPriority:uint; //used to detect when event was added

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    public function handler(event:Event):void {
        this.listener.call(null, event);
    }

}