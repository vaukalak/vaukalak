/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 30.4.12
 * Time: 23.48
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.utils {
public class CollectionElement {

    private var _collection:Object;
    private var _indexes:Array;

    public function CollectionElement(collection:Object, ...indexes) {
        _collection = collection;
        _indexes = indexes;
    }

    public function get isValidCell():Boolean {
        try {
            value;
            return true;
        } catch (err:Error) {
            return false;
        }
        return false;
    }

    public function get value():* {
        var indexesClone:Array = _indexes.concat();
        var value:* = _collection[indexesClone.shift()];
        while (indexesClone.length) {
            value = value[indexesClone.shift()];
        }
        return value;
    }

}
}
