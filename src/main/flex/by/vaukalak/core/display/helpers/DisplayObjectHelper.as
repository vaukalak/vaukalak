/**
 * User: Mihas i Valka
 * Date: 23.11.12
 * Time: 14.55
 */
package by.vaukalak.core.display.helpers {
import by.vaukalak.core.calls.responder.IResponder;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.errors.IllegalOperationError;
import flash.utils.Dictionary;

public class DisplayObjectHelper {

    private static const _linker:Dictionary = new Dictionary(true);

    public static function registerManager(manager:IManager, viewContainer:DisplayObjectContainer, commands:Vector.<String>):void {
        _getViewReference(viewContainer).registerManager(manager, commands);
    }

    public function handleCommand(command:String, view:DisplayObject, responder:IResponder = null, commandInfo:* = null):void {
        if(!view.stage){
            throw new IllegalOperationError("view has to be on the stage");
        }
        var nextParent:DisplayObjectContainer = view.parent;
        while(nextParent){
            var manager:IManager = _getViewReference(nextParent).getManagerForCommand(command);
            if(manager){
                manager.handleCommand(command, commandInfo, responder);
            }
            nextParent = view.parent;
        }
    }

    private static function _getViewReference(viewContainer:DisplayObjectContainer):ViewReference {
        return _linker[viewContainer] ||= new ViewReference(viewContainer);
    }


}
}

import by.vaukalak.core.display.helpers.IManager;
import by.vaukalak.core.display.helpers.IManager;

import flash.display.DisplayObjectContainer;
import flash.utils.Dictionary;

class ViewReference{

    private var _viewContainer:DisplayObjectContainer;
    private const _linker:Dictionary = new Dictionary();

    public function ViewReference(viewContainer:DisplayObjectContainer) {
        _viewContainer = viewContainer;
    }

    public function getManagerForCommand(commandName:String):IManager {
        for each(var managerReference:ManagerReference in _linker){
            if(managerReference.handlesCommand(commandName)){
                return managerReference.manager;
            }
        }
    }

    public function registerManager(manager:IManager, commands:Vector.<String>):void {
        _getManagerReference(manager).addCommandsToHandle(commands);
    }

    private function _getManagerReference(manager:IManager):ManagerReference {
        return _linker[manager] ||= new ManagerReference(manager);
    }

}

class ManagerReference{

    private var _manager:IManager;
    private var _commands:Vector.<String> = new Vector.<String>();

    public function addCommandsToHandle(newCommands:Vector.<String>):void {
        _commands = _commands.concat(newCommands);
    }

    public function handlesCommand(type:String):Boolean {
        return _commands.indexOf(type) != -1;
    }

    function ManagerReference(manager:IManager) {
        _manager = manager;
    }

    public function get manager():IManager {
        return _manager;
    }
}