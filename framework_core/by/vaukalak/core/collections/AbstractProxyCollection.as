/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 25.6.12
 * Time: 0.29
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections {

import flash.errors.IllegalOperationError;
import flash.utils.Proxy;
import flash.utils.flash_proxy;

public dynamic class AbstractProxyCollection extends Proxy {

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function AbstractProxyCollection(values:Object) {
        this._values = values;
    }

    //--------------------------------------------------------------------------
    //
    //  PROPERTIES
    //
    //--------------------------------------------------------------------------

    private var _values:Object;
    private var _keys:Array;

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    public function get length():uint {
        return this._values.length;
    }

    //--------------------------------------------------------------------------
    //
    //  Overriden methods: Proxy
    //
    //--------------------------------------------------------------------------

    flash_proxy override function callProperty(name:*, ...rest):* {
        if (super.flash_proxy::hasProperty(name)) {
            rest.unshift(name);
            return super.flash_proxy::callProperty(name);
        } else {
            return this._values[name].apply(this._values, rest);
        }
    }

    flash_proxy override function deleteProperty(name:*):Boolean {
        var result:Boolean = delete this._values[name];
        this.change();
        return result;
    }

    flash_proxy override function getProperty(name:*):* {
        if (super.flash_proxy::hasProperty(name)) {
            return super.flash_proxy::getProperty(name);
        } else {
            return this._values[name];
        }
    }

    flash_proxy override function hasProperty(name:*):Boolean {
        return super.flash_proxy::hasProperty(name) || ( name in this._values );
    }

    flash_proxy override function nextName(index:int):String {
        return this.getKeys()[ index - 1 ];
    }

    flash_proxy override function nextNameIndex(index:int):int {
        return ( index < this.getKeys().length ? index + 1 : 0 );
    }

    flash_proxy override function nextValue(index:int):* {
        return this._values[ this.getKeys()[ index - 1 ] ];
    }

    flash_proxy override function setProperty(name:*, value:*):void {
        if (this._values[name] === value) return;
        this._values[name] = value;
        this.change();
    }

    //--------------------------------------------------------------------------
    //
    //  Private methods
    //
    //--------------------------------------------------------------------------

    protected function getKeys():Array {
        if (!this._keys) {
            this._keys = new Array();
            for (var i:Object in this._values) {
                this._keys.push(i);
            }
        }
        return this._keys;
    }

    protected function change():void {
        throw new IllegalOperationError("abstract method invoked");
    }
}
}
