package by.vaukalak.core.collections  {
import flash.errors.IllegalOperationError;
import flash.utils.Proxy;
import flash.utils.flash_proxy;

use namespace flash_proxy;

public dynamic class TwoKeyHash extends Proxy{

    private var _hashClone:*;
    private var _baseHash:*;
    private var _nextName:String;
    private var _nextValue:*;
    private var _baseHashType:Class;

    public function TwoKeyHash(baseHashType:Class = null) {
        super();
        _baseHashType = baseHashType || Object;
        _hashClone = generateStructure();
        _baseHash = generateStructure();
    }

    protected function generateStructure():*{
        return new _baseHashType();
    }

    protected function generateItem():*{
        return new _baseHashType();
    }

    override flash_proxy function getProperty(name:*):* {
        if(!_baseHash[name]){
            _baseHash[name] = generateItem();
        }
        return _baseHash[name];
    }

    override flash_proxy function setProperty(name:*, value:*):void {
        throw new IllegalOperationError("can't set value by one key only");
    }

    override flash_proxy function hasProperty(name:*):Boolean {
        return _baseHash[name] != undefined;
    }

    override flash_proxy function deleteProperty(name:*):Boolean {
        return delete _baseHash[name];
    }

    override flash_proxy function nextName(index:int):String {
        return _nextName;
    }

    override flash_proxy function nextValue(index:int):* {
        return _nextValue;
    }



    override flash_proxy function nextNameIndex(index:int):int {
        if(!index) _populateCloneHash()
        return _goToNextState() ? 1 : 0;
    }

    private function _goToNextState():Boolean {
        for (var i:String in _hashClone) {
            _nextName = i;
            _nextValue = _hashClone[i];
            delete _hashClone[i];
            break;
        }
        return i != null;
    }

    private function _populateCloneHash():void {
        for (var i:String in _baseHash) {
            _hashClone[i] = _baseHash[i];
        }

    }

    public function get baseHashType():Class {
        return _baseHashType;
    }
}
}
