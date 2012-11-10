/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 26.6.12
 * Time: 2.09
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections.binding {
import by.vaukalak.core.collections.*;

import flash.utils.flash_proxy;

use namespace flash_proxy;

public class BindableArray extends CollectionEventDispatcher implements IBindableCollection {

    private var _bindingLocked:Boolean = false;

    public function BindableArray(...args) {
        super(args);
    }

    [Bindable("collectionChanged")]
    override flash_proxy function getProperty(name:*):* {
        return super.flash_proxy::getProperty(name);
    }

    public function lockBinding():void {
        _bindingLocked = true;
    }

    public function unlockBinding():void {
        _bindingLocked = false;
        change();
    }


    override protected function change():void {
        if (!_bindingLocked) {
            super.change();
        }
    }
}
}
