package  by.vaukalak.core.collections{

/**
 * ...
 * @author vaukalak
 */
public dynamic class MultyKeyHash extends TwoKeyHash {
    private var _numKeys:uint;

    public function MultyKeyHash(numKeys:uint, baseHashType:Class = null) {
        this._numKeys = numKeys;
        super(baseHashType);
    }

    override protected function generateItem():* {
        if(_numKeys > 3) return new MultyKeyHash(_numKeys - 1, baseHashType);
        if (_numKeys == 3) return new TwoKeyHash(baseHashType);
        if (_numKeys == 2) return { };
        throw new ArgumentError("number of keys can not be minor of 2");
    }

    public function get numKeys():uint {
        return _numKeys;
    }

}

}