/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 21.4.12
 * Time: 22.24
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.gui.list {
import by.vaukalak.core.data.Data;
import by.vaukalak.core.data.DataContainer;
import by.vaukalak.core.display.array.DisplayArray;
import by.vaukalak.core.events.DataBaseEvent;

import flash.display.DisplayObject;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.utils.Dictionary;

public class BaseList extends DisplayArray {

    private var _itemRenderer:Class;
    private var _dataProvider:Object;
    private var _itemRendererFunction:Function;
    private const _filteredData:Array = [];

    public var filterFunction:Function;

    public var limit:uint = uint.MAX_VALUE;


    public function BaseList() {
    }

    public function getDataIndex(value:*){
        return _filteredData.indexOf(value);
    }

    public function get itemRenderer():Class {
        return _itemRenderer;
    }

    public function set itemRendererFunction(value:Function):void {
        if (!_itemRendererFunction === value) return;
        _itemRendererFunction = value;
        _updateList();
    }

    public function set itemRenderer(value:Class):void {
        if (_itemRenderer === value) return;
        _itemRenderer = value;
        _updateList();
    }

    public function get dataProvider():Object {
        return _dataProvider;
    }

    public function set dataProvider(value:Object):void {
        if (_dataProvider === value) return;
        _dataProvider = value;
        _updateList();
    }

    private function _updateList():void {
        super.clear();
        if (_itemRenderer && _dataProvider) {
            for (var i:uint = 0; i < _dataProvider.length; i++) {
                var renderer:IRenderer = new (_itemRendererFunction ? _itemRendererFunction(_dataProvider[i]) : _itemRenderer)() as IRenderer;
                renderer.data = _dataProvider[i];
                super.push(renderer as DisplayObject);
            }
        }
    }

    private var _dataContainer:DataContainer;

    public function itemDataAt(i:uint):Object {
        return _filteredData[i];
//        return _dataContainer ? _dataContainer.getChildAt(i) : _dataProvider[i];
    }

    public function itemViewAt(i:uint):IRenderer {
        return _linker[itemDataAt(i)];
    }

    public function set dataContainer(dataContainer:DataContainer):void {
        if (_dataContainer) {
            _dataContainer.removeEventListener(DataBaseEvent.ADDED, _onChildRemoved);
            _dataContainer.removeEventListener(DataBaseEvent.REMOVED, _onChildRemoved);
        }
        _linker = new Dictionary();
        _dataContainer = dataContainer;
        _dataContainer.addEventListener(DataBaseEvent.ADDED, _onChildAdded);
        _dataContainer.addEventListener(DataBaseEvent.REMOVED, _onChildRemoved);
        renderDataContainer(_dataContainer);
    }

    private function _onChildAdded(event:DataBaseEvent):void {
        if (length >= limit) {
            return;
        }
        var data:Data = event.target as Data;
        if (data.parent == _dataContainer) {
            _createAndAddRenderer(data);
        }
    }

    private var _linker:Dictionary;

    private function _onChildRemoved(event:DataBaseEvent):void {
        var data:Data = event.target as Data;
        if (data.parent == _dataContainer) {
            var view:DisplayObject = _linker[data] as DisplayObject;
            splice(getItemIndex(view), 1);
            delete _linker[data];
        }
    }

    private function renderDataContainer(dataContainer:DataContainer):void {
        clear();
        var renderersQuantity:uint = Math.min(dataContainer.numChildren, limit);
        for (var i:uint = 0; i < renderersQuantity; i++) {
            var data:Data = dataContainer.getChildAt(i);
            if (filterFunction && !filterFunction(data)) {
                continue;
            }
            _createAndAddRenderer(data);
        }
        dispatchEvent(new Event("dataRendered"));
    }


    override public function clear():void {
        _filteredData.length = 0;
        super.clear();
    }

    private function _createAndAddRenderer(data:Data):void {
        var rendererClass:Class = _itemRendererFunction ? _itemRendererFunction(data) : _itemRenderer;
        var renderer:IRenderer = new rendererClass() as IRenderer;
        renderer.data = data;
        _linker[data] = renderer;
        _filteredData.push(data);
        super.push(renderer as DisplayObject);
    }
}
}