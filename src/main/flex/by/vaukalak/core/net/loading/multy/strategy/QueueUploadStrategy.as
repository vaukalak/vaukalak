/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 28.6.12
 * Time: 21.37
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.net.loading.multy.strategy {
import by.vaukalak.core.net.loading.multy.AbstractUploadStrategy;
import by.vaukalak.core.net.loading.multy.MultyLoader;

import flash.events.Event;

public class QueueUploadStrategy extends AbstractUploadStrategy {

    private var _currentIndex:uint = 0;

    public function QueueUploadStrategy(target:MultyLoader) {
        super(target);
    }


    override public virtual function upload():void {
        _data ||= {};
        _loadNextItem();
    }

    private function _loadNextItem():void {
        _loaders[_currentIndex].target.load();
        _loaders[_currentIndex].target.addEventListener(Event.COMPLETE, _onItemLoaded);

    }

    private function _onItemLoaded(event:Event):void {
        _data[_loaders[_currentIndex].id] = _loaders[_currentIndex].target.data;
        if (++_currentIndex >= _loaders.length) {
            dispatchEvent(new Event(Event.COMPLETE));
        } else {
            _loadNextItem();
        }
    }

}
}
