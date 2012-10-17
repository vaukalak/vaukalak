/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 25.6.12
 * Time: 0.42
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections {

import by.vaukalak.core.collections.events.CollectionEvent;

import flash.events.IEventDispatcher;

public class CollectionEventDispatcher extends AbstractProxyCollection implements IEventDispatcher {

    include "../implemtents_IEventDispatcher.as"

    public function CollectionEventDispatcher(values:Object) {
        super(values);
    }


    override protected function change():void {
        dispatchEvent(new CollectionEvent(CollectionEvent.COLLECTION_CHANGED));
    }
}
}
