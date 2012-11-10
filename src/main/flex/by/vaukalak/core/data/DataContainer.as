package by.vaukalak.core.data {
import by.vaukalak.core.events.DataBaseEvent;

import flash.display.DisplayObject;

import flash.utils.Dictionary;

/**
 * ...
 * @author Boutylin Mikhail
 */
[Event(name="childAdded", type="by.vaukalak.core.events.DataBaseEvent")]
[DefaultProperty("children")]
public class DataContainer extends Data {
    private var _children:Vector.<Data> = Vector.<Data>([]);

    //use namespace $internal;

    public function DataContainer() {
        super();
        addEventListener(DataBaseEvent.REMOVED_FROM_DATABASE, _onRemovedFromDatabase)
    }

    public function addChild(child:Data):Data {
        if (child == this) return child;
        var p:DataContainer = parent;
        while (p) {
            if (p == child) return child;
            p = p.parent;
        }
        if (child.parent) child.parent.removeChild(child);
        dispatchEvent(new DataBaseEvent(DataBaseEvent.CHILD_ADDED, true));
        _children.push(child);
        child.setParent(this);
        return child;
    }

    public function contains(child:Data):Boolean {
        do {
            if (child === this) return true;
        } while (child = child.parent);
        return false;
    }

    public function removeChild(child:Data):Data {
        var i:int = _children.indexOf(child);
        if (i == -1) throw new ArgumentError("not found");
        else _children.splice(i, 1);
        child.setParent(null);
        return child;
    }

    public function get numChildren():uint {
        return _children.length;
    }

    public function getChildByName(name:String):Data {
        for (var i:uint; i < _children.length; i++) if (_children[i].name == name) return _children[i];
        return null;
    }

    public function getChildAt(i:uint):Data {
        return _children[i];
    }

    public function removeChildAt(i:int):Data {
        var child:Data = _children[i];
        _children.splice(i, 1);
        child.setParent(null);
        return child;
    }

    /**
     * Used for MXML
     */
    public function set children(value:Array):void {
        for (var i:uint = 0; i < value.length; i++) {
            addChild(value[i] as Data);
        }
    }

    /**
     * provides prototypes to children
     */

    private var p_prototypes:Dictionary;

    private function get _injectableObjects():Dictionary {
        return p_prototypes ||= new Dictionary();
    }

    public function provide(clazz:Class):* {
        var prototype:* = _injectableObject(clazz);
        if (prototype) {
            return prototype;
        } else {
            if (!parent) {
                throw new ArgumentError("Object not found:" + clazz);
            }
            return parent.provide(clazz);
        }
    }

    public function addInjectableObject(prototype:*):void {
        _injectableObjects[prototype] = true;
    }

    private function _injectableObject(clazz:Class):* {
        var result:*;
        for (var key:* in _injectableObjects) {
            if (key is clazz) {
                if (result) {
                    throw new Error("more then one prototype " + clazz + " found");
                }
                result = key;
            }
        }
        return result;
    }

    private function _onRemovedFromDatabase(event:DataBaseEvent):void {
        for (var key:* in _injectableObjects) {

        }
    }

}

}