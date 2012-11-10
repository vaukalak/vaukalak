/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 20.8.12
 * Time: 12.49
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections {
public class SymmetricLinker {

    private const _leftByRight:Object = {};
    private const _rightByRight:Object = {};

    public function addPair(left:*, right:*, force:Boolean = false):Boolean {
        if (getLeftValue(right) || getRightValue(left)) {
            if (force) {
                delete _leftByRight[right];
                delete _rightByRight[left];
            } else {
                return false;
            }
        }
        _leftByRight[right] = left;
        _rightByRight[left] = right;
        return true;
    }

    public function getLeftValue(rightValue:*):* {
        return _leftByRight[rightValue];
    }

    public function getRightValue(leftValue:*):* {
        return _rightByRight[leftValue];
    }

}
}
