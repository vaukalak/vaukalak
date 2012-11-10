/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 26.6.12
 * Time: 2.17
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections.binding {
public interface IBindableCollection {
    function lockBinding():void;

    function unlockBinding():void;
}
}
