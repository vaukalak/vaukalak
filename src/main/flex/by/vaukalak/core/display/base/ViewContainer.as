/**
 * User: Mihas i Valka
 * Date: 11.11.12
 * Time: 17.57
 */
package by.vaukalak.core.display.base {
import by.vaukalak.core.display.resource.IResourceAware;
import by.vaukalak.core.resource.ResourceManager;

public class ViewContainer extends NativeView implements IResourceAware{

    private var _resourceManager:ResourceManager;


    public function ViewContainer() {
        _resourceManager = new ResourceManager();
    }

    public function get resourceManager():ResourceManager {
        return _resourceManager;
    }

}
}
