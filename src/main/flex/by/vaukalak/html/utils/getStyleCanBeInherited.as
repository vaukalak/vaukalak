package by.vaukalak.html.utils {

    import by.vaukalak.html.core.styles.StyleType;

/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	public function getStyleCanBeInherited(name:String):Boolean {
		switch(name) {
			case StyleType.FLOAT:
			case StyleType.WIDTH:
			case StyleType.HEIGHT:
				return false;
			break;
			default:
				return true;
		}
	}

}