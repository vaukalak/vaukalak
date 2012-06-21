package by.vaukalak.core.utils {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public function collectProperties(obj:Object, ... properties):Array {
		var arr:Array = new Array(properties.length);
		for (var i:int = 0; i < properties.length; i++) {
			arr[i] = obj[properties[i]];
		}
		return arr;
	}

}