/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 4.7.12
 * Time: 20.21
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.resource {
import by.vaukalak.core.calls.responder.IResponder;
import by.vaukalak.core.calls.responder.IResponder;
import by.vaukalak.core.net.loading.base.BaseLoader;

import flash.events.Event;

import flash.net.URLRequest;

import flash.utils.Dictionary;

public class HTTPGateway implements IResourceProvider {

    private const _linker:Dictionary = new Dictionary();
    private var _basePath:String;


    public function HTTPGateway(basePath:String) {
        _basePath = basePath;
    }

    public function getResource(protocol:String, urn:String, responder:IResponder):void {
        var uri:String = (_basePath ? _basePath : protocol + "://") + urn;
        var loader:BaseLoader = new BaseLoader(new URLRequest(uri));
        _linker[loader] = responder;
        loader.addEventListener(Event.COMPLETE, _onDataLoaded);
    }

    private function _onDataLoaded(event:Event):void {
        var loader:BaseLoader = event.target as BaseLoader;
        IResponder(_linker[loader]).success(event.target.data);
        delete _linker[loader];
    }
}
}
