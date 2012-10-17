package by.vaukalak.core.display.array {
import by.vaukalak.core.display.base.NativeView;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;

/**
 * ...
 * @author Boutylin Mikhail
 */

[ExcludeClass]

public class NativeDisplayArray extends NativeView {

    public function NativeDisplayArray() {
        super();
        if (!this is DisplayArray)
            throw new IllegalOperationError();

    }

    /**
     * property excluded
     */

    [Exclude(kind="method", name="addChild")]
    override public function addChild(child:DisplayObject):DisplayObject {
        return child;
        throw new IllegalOperationError();
    }

    protected function _addChild(child:DisplayObject):DisplayObject {
        return super.addChild(child);
    }

    /**
     * property excluded
     */

    [Exclude(kind="method", name="addChildAt")]
    override public function addChildAt(child:DisplayObject, index:int):DisplayObject {
        return child;
        throw new IllegalOperationError();
    }

    protected function _addChildAt(child:DisplayObject, index:int):DisplayObject {
        return super.addChildAt(child, index);
    }

    /**
     * property excluded
     */

    [Exclude(kind="method", name="removeChild")]
    override public function removeChild(child:DisplayObject):DisplayObject {
        return child;
        throw new IllegalOperationError();
    }

    protected function _removeChild(child:DisplayObject):DisplayObject {
        return super.removeChild(child);
    }

    /**
     * property excluded
     */

    [Exclude(kind="method", name="removeChildAt")]
    override public function removeChildAt(index:int):DisplayObject {
        return null;
        throw new IllegalOperationError();
    }

    protected function _removeChildAt(index:int):DisplayObject {
        return super.removeChildAt(index);
    }
}

}