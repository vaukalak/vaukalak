package by.vaukalak.core.errors {
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class StaticError extends Error{
		
		public function StaticError(object:*) {
			super("The class " + getDefinitionByName(object) + " is static. It can't be instanced directly");
		}
		
	}

}