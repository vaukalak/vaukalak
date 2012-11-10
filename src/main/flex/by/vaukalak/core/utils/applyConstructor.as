package by.vaukalak.core.utils {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	public function applyConstructor(clazz:Class, args:Array):* {
		switch(args.length) {
			case 0: return new clazz(); break;
			case 1: return new clazz(args[0]); break;
			case 2: return new clazz(args[0], args[1]); break;
			case 3: return new clazz(args[0], args[1], args[2]); break;
			case 4: return new clazz(args[0], args[1], args[2], args[3]); break;
			case 5: return new clazz(args[0], args[1], args[2], args[3], args[4]); break;
			case 6: return new clazz(args[0], args[1], args[2], args[3], args[4], args[5]); break;
			case 7: return new clazz(args[0], args[1], args[2], args[3], args[4], args[5], args[6]); break;
			case 8: return new clazz(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]); break;
			case 9: return new clazz(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]); break;
			case 10: return new clazz(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]); break;
			case 11: return new clazz(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]); break;
		}
	}

}