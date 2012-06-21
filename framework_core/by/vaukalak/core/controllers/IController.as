package by.vaukalak.core.controllers {
	import by.vaukalak.core.data.DataBase;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public interface IController {
		function get baseController():IBaseController;
		function get dataBase():DataBase;
	}
	
}