/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 30.4.12
 * Time: 23.39
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections.iterators {
public class MatrixIterator {
    //-----------------------------------------------------
    //
    //	PROPERTIES
    //
    //-----------------------------------------------------

    private var _target:Object;
    private var _currentCollumn:int = 0;
    private var _currentRow:int = 0;
    private var _keepHistory:uint;
    private var _history:Vector.<MatrixCoordinate> = new <MatrixCoordinate>[];

    //-----------------------------------------------------
    //
    //	CONSTRUCTOR
    //
    //-----------------------------------------------------

    public function MatrixIterator(target:Object, keepHistory:int = 0) {
        super();
        this._keepHistory = keepHistory;
        this._target = target;
    }

    //-----------------------------------------------------
    //
    //	PUBLIC METHODS
    //
    //-----------------------------------------------------

    public function setPosition(row:int, col:int, keepInHistory:Boolean = true):void {
        if (keepInHistory) _saveCurrentState();
        _currentCollumn = col;
        _currentRow = row;
    }

    public function moveRight():Boolean {
        if (_currentCollumn < _target[_currentRow].length - 1) {
            _saveCurrentState();
            _currentCollumn++;
            return true;
        }
        return false;
    }

    public function moveLeft():Boolean {
        if (_currentCollumn) {
            _saveCurrentState();
            _currentCollumn--;
            return true;
        }
        return false;
    }

    public function moveUp():Boolean {
        if (_currentRow) {
            _saveCurrentState();
            _currentRow--;
            return true;
        }
        return false;
    }

    public function moveDown():Boolean {
        if (_currentRow < _target.length - 1) {
            _saveCurrentState();
            _currentRow++;
            return true;
        }
        return false;
    }

    public function rollBack():Boolean {
        if (_history.length) {
            var lastHistoryItem:MatrixCoordinate = _history.pop();
            setPosition(lastHistoryItem.row, lastHistoryItem.col);
            return true;
        }
        return false;
    }

    public function clearHistory():void {
        _history = new <MatrixCoordinate>[];
    }

    //-----------------------------------------------------
    //
    //	GETTERS & SETTERS
    //
    //-----------------------------------------------------

    public function get currentValue():* {
        return _target[_currentRow][_currentCollumn];
    }

    public function get keepHistory():uint {
        return _keepHistory;
    }

    public function set keepHistory(value:uint):void {
        _keepHistory = value;
    }

    //-----------------------------------------------------
    //
    //	PRIVATE METHODS
    //
    //-----------------------------------------------------

    private function _saveCurrentState():void {
        if (_keepHistory) {
            var historyItem:MatrixCoordinate = new MatrixCoordinate;
            historyItem.col = _currentCollumn;
            historyItem.row = _currentRow;
            _history.push(historyItem);
            if (_history.length > _keepHistory) {
                _history.shift();
            }
        }
    }
}
}

class MatrixCoordinate {
    public var col:uint;
    public var row:uint;
}