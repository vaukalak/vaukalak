package by.vaukalak.core.controllers {
	import by.vaukalak.core.data.DataBase;
	import by.vaukalak.core.events.BaseEventDispatcher;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class AbstractController extends BaseEventDispatcher implements IController{
		
		private var _baseController:IBaseController;
		
		public function AbstractController(baseController:IBaseController) {
			super(this);
			_baseController = baseController;
		}
		
		public function get baseController():IBaseController {
			return _baseController;
		}
		
		public function get dataBase():DataBase {
			return _baseController.dataBase;
		}
	}

}