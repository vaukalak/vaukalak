/**
 * Created by IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 10.4.12
 * Time: 9.12
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.resource {
import by.vaukalak.core.calls.responder.IResponder;

import flash.errors.IllegalOperationError;

public class ResourceManager {

    private const _register:Object = {};
    public function getResource(uri:*, responder:IResponder):void {
        var qName:QName = uri as QName;
        if (qName) {
            getProviderByNamespace(qName.uri).getResource(qName.uri, qName.localName, responder);
        } else {
            var parts:Array = String(uri).split("://");
            var provider:IResourceProvider = getProviderByNamespace(parts[0]);
            provider.getResource(parts[0], parts[1], responder);
        }
    }

    public function getProviderByNamespace(ns:String):IResourceProvider {
        return _register[ns];
    }

    public function registerProvider(ns:String, target:IResourceProvider):void {
        _register[ns] = target;
    }
}
}
