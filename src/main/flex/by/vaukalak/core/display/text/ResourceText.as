/**
 * User: Mihas i Valka
 * Date: 24.11.12
 * Time: 18.24
 */
package by.vaukalak.core.display.text {
import by.vaukalak.core.calls.responder.IResponder;
import by.vaukalak.core.calls.responder.Responder;
import by.vaukalak.core.display.resource.IResourceAware;
import by.vaukalak.core.resource.ResourceManager;

import flash.display.DisplayObjectContainer;
import flash.events.Event;

public class ResourceText extends Text{

    private var p_resourceManager:ResourceManager;
    private var _textURI:String;

    public function set textURI(value:String):void {
        _textURI = value;
        _createText();
    }

    private function _createText(event:Event = null):void {
        if(!(_textURI && resourceManager)){
            return;
        }
        var responder:IResponder = new Responder(_onTextRecived);
        resourceManager.getResource(_textURI, responder);
    }

    private  function  _onTextRecived(text:String){
        super.text = text;
    }

    public function get resourceManager():ResourceManager {
        if(p_resourceManager){
            return p_resourceManager;
        }
        var nextParent:DisplayObjectContainer = parent;
        while(nextParent){
            if(nextParent is IResourceAware){
                return p_resourceManager = (nextParent as IResourceAware).resourceManager;
            }
            nextParent = nextParent.parent;
        }
        return null;
    }

}
}
