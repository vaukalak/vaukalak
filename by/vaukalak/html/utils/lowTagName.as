package by.vaukalak.html.utils {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public function lowTagName(xml:XML):String {
		return String(xml.name()).toLowerCase();
	}

}