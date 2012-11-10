package by.vaukalak.core.net.loading.multy {
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.IEventDispatcher;

/**
 * ...
 * @author Boutylin Mikhail
 */


public class AbstractUploadStrategy implements IEventDispatcher {

    //--------------------------------------------------------------------------
    //
    //  PRORETIES
    //
    //--------------------------------------------------------------------------

    protected var _target:MultyLoader;

    //--------------------------------------------------------------------------
    //
    //  CONSTRUCTOR
    //
    //--------------------------------------------------------------------------

    public function AbstractUploadStrategy(target:MultyLoader) {
        if (!target) throw new ArgumentError('target');
        _target = target;
        if (Object(this).constructor === AbstractUploadStrategy) throw new IllegalOperationError('');//TODO:describe error
    }

    //--------------------------------------------------------------------------
    //
    //  PUBLIC METHODS
    //
    //--------------------------------------------------------------------------

    public virtual function upload():void {

    }

    //--------------------------------------------------------------------------
    //
    //  OVERRIDEN METHODS
    //
    //--------------------------------------------------------------------------

    public function dispatchEvent(event:Event):Boolean {
        return _target.dispatchEvent(event);
    }

    public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        _target.addEventListener.apply(null, arguments);
    }

    public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
        _target.removeEventListener.apply(null, arguments);
    }

    public function hasEventListener(type:String):Boolean {
        return _target.hasEventListener(type);
    }

    public function willTrigger(type:String):Boolean {
        return _target.willTrigger(type);
    }

    //--------------------------------------------------------------------------
    //
    //  PROTECTED ACSESSORS
    //
    //--------------------------------------------------------------------------

    protected function get _data():Object {
        return _target.$data;
    }

    protected function set _data(value:Object) {
        _target.$data = value;
    }

    protected function get _loaders():Vector.<LoaderContainer> {
        return _target.$loaders;
    }

}

}