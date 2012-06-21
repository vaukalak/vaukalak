package by.vaukalak.html.utils {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	public function repairHTMLString(s:String):String {
		s = s.replace(/<br>q/, "<br/>");
		return s.toLowerCase();
	}
	
}