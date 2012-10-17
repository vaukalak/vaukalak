/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 7.7.12
 * Time: 18.46
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.resource {
import by.vaukalak.core.display.base.NativeView;

public class ResourceContainerView extends NativeView {

    private const _resourceViews:Vector.<ResourceView> = new Vector.<ResourceView>();

    public function set resourceMap(resourcesData:Array):void {
        for each(var resource:Object in resourcesData) {
            var view:ResourceView = new ResourceView();
            view.uri = resource["uri"];
            view.x = int(resource["x"]) || 0;
            view.y = int(resource["y"]) || 0;
            _addImage(view);
        }
    }

    private function _clear():void {
        while (_resourceViews.length) {
            removeChild(_resourceViews.pop());
        }
    }

    private function _addImage(view:ResourceView):void {
        _resourceViews.push(view);
        addChild(view);
    }

}
}
