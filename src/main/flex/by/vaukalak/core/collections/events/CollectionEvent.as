/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 26.6.12
 * Time: 2.03
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections.events {
import flash.events.Event;

public class CollectionEvent extends Event {

    public static const COLLECTION_CHANGED:String = "collectionChanged";

    public function CollectionEvent(type:String) {
        super(type);
    }
}
}
