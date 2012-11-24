package by.vaukalak.core.controllers {
import by.vaukalak.core.data.DataBase;
import by.vaukalak.core.events.BaseEventDispatcher;

import flash.utils.describeType;

/**
 * ...
 * @author Boutylin Mikhail
 */
public class AbstractController extends BaseEventDispatcher implements IController {

    private var _baseController:IBaseController;

    public function AbstractController(baseController:IBaseController) {
        super(this);
//            var typeDescription:XML = describeType(this);
//            typeDescription
        _baseController = baseController;
    }

    protected function setBaseController(controller:IBaseController):void{
        _baseController = controller;
    }

    public function get baseController():IBaseController {
        return _baseController;
    }

    public function get dataBase():DataBase {
        return _baseController.dataBase;
    }
}

}