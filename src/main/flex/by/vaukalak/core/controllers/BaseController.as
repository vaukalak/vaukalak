package by.vaukalak.core.controllers {

import by.vaukalak.core.calls.responder.IResponder;
import by.vaukalak.core.commands.Command;
import by.vaukalak.core.commands.CommandDispatcher;
import by.vaukalak.core.data.DataBase;

import flash.display.DisplayObjectContainer;
import flash.net.Responder;

/**
 * ...
 * @author Boutylin Mikhail
 */
public class BaseController extends CommandDispatcher implements IBaseController {
    private var _container:DisplayObjectContainer;
    private var _dataBase:DataBase;

    public function BaseController(container:DisplayObjectContainer, dataBase:DataBase) {
        if (!container) throw new ArgumentError('container');
        if (!dataBase) dataBase = new DataBase();
        _container = container;
        _dataBase = dataBase;
    }

    public function get baseController():IBaseController {
        return this;
    }

    public function get dataBase():DataBase {
        return _dataBase;
    }

    public function get container():DisplayObjectContainer {
        return _container;
    }

    public function call(commandName:String, args:Array = null):void {
        super.dispatchCommand(new Command(commandName, args));
    }
}

}