/**
 * Created by IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 11.4.12
 * Time: 1.01
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.resource {
import by.vaukalak.core.resource.*;

import avmplus.factoryXml;

import by.vaukalak.core.calls.Caller;
import by.vaukalak.core.calls.responder.IResponder;
import by.vaukalak.core.calls.responder.Responder;
import by.vaukalak.core.display.base.NativeView;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.geom.Matrix;

[Event(name="resourceChange", type="flash.events.Event")]

public class ResourceView extends NativeView implements IResourceAware{

    private var _verticalAlign:String;
    private var _resource:DisplayObject;
    private var _matrix:Matrix;
    private var _uri:String;
    public function ResourceView(uri:String = "") {
        if (uri) this.uri = uri;
        addEventListener(Event.ADDED_TO_STAGE, _createResource, false, 0, true);
        addEventListener(Event.REMOVED_FROM_STAGE, _clearCache, false, 0, true);
    }

    private function _clearCache(event:Event):void {
        p_resourceManager = null;
    }


    public function set uri(s:String):void {
        _clearResource();
        _uri = s;
        _createResource();
    }

    private function _createResource(event:Event = null):void {
        if(!(_uri && resourceManager)){
            return;
        }
        var parts:Array = _uri.split("?");
        var matrix:Matrix = new Matrix();
        if (parts.length > 1) {
            var urnArguments:Array = String(parts[1]).split("&");
            for each(var arg:String in urnArguments) {
                var argPair:Array = arg.split("=");
                matrix[argPair[0]] = argPair[1];
            }
        }

        var caller:Caller = new Caller(_onResourseLoaded, matrix);
        caller.constructorArgumentsFirst = false;
        var responder:IResponder = new Responder(caller.call);
        resourceManager.getResource(_uri, responder);
    }

    private function _clearResource():void {
        if (_resource && _resource.parent == this) {
            removeChild(_resource);
        }
    }

    private function _onResourseLoaded(resourse:DisplayObject, matrix:Matrix = null):void {
        _clearResource();
        this._resource = resourse;

        _matrix = matrix;
        addResource(resource);
        _invalidate();
        render();
        dispatchEvent(new Event("resourceChange"));
    }

    protected function addResource(resource:DisplayObject):void {
        addChild(_resource);
    }

    public function get verticalAlign():String {
        return _verticalAlign;
    }

    public function set verticalAlign(value:String):void {
        if (_verticalAlign == value) return;
        _verticalAlign = value;
        _invalidate();
    }

    private function _invalidate():void {
        if (this._resource) {
            switch (verticalAlign) {
                case "top":
                    this._resource.y = 0;
                    break;
                case "bottom":
                    this._resource.y = -this._resource.height;
                    break;
                default:
                    this._resource.x += _matrix ? _matrix.tx : 0;
                    this._resource.y += _matrix ? _matrix.ty : 0;
                    break;
            }
        }
        if (parent && parent is NativeView) {
            (parent as NativeView).render();
        }
    }


    public function get matrix():Matrix {
        return _matrix;
    }

    public function get resource():DisplayObject {
        return _resource;
    }

    private var p_resourceManager:ResourceManager;

    public function get resourceManager():ResourceManager {
        if(p_resourceManager){
            return p_resourceManager;
        }
        var nextParent:DisplayObjectContainer = parent;
        while(nextParent){
            if(nextParent is IResourceAware){
                return p_resourceManager = (nextParent as IResourceAware).resourceManager;
            }
            nextParent = nextParent.parent;
        }
        throw new Error("resource root not found");
    }

}
}
