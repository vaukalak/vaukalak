/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 21.4.12
 * Time: 22.24
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.display.list {
import by.vaukalak.core.display.array.DisplayArray;

import flash.display.DisplayObject;

public class BaseList extends DisplayArray{

    private var _itemRenderer:Class;
    private var _dataProvider:Array;

    public function BaseList() {
    }

    public function get itemRenderer():Class {
        return _itemRenderer;
    }

    public function set itemRenderer(value:Class):void {
        if(_itemRenderer === value) return;
        _itemRenderer = value;
        _updateList();
    }

    public function get dataProvider():Array {
        return _dataProvider;
    }

    public function set dataProvider(value:Array):void {
        if(_dataProvider === value) return;
        _dataProvider = value;
        _updateList();
    }

    private function _updateList():void{
        super.clear();
        if(_itemRenderer && _dataProvider){
            for(var i:uint = 0; i< _dataProvider.length; i++){
                var renderer:IRenderer = new _itemRenderer() as IRenderer;
                renderer.data = _dataProvider[i];
                super.push(renderer as DisplayObject);
            }
        }
    }

}
}
