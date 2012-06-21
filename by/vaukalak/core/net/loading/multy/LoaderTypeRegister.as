package by.vaukalak.core.net.loading.multy {
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class LoaderTypeRegister{
		
		private static const _registredLoaderTypes:Object = new Object();
		
		/**
		 * regist a loader class wich can be used as item of MultyLoader object
		 * @param	clazz the class object (class should implements 
		 * @param	name the name used to refer the class
		 */
		
		public static function registerLoaderType(clazz:Class, name:String):void {
			_registredLoaderTypes[name] = clazz;
		}
		
		/**
		 * 
		 * @param	name the name with wich the class was registered
		 * @return the class instanse of the loader
		 */
		
		public static function getLoaderTypeDefinition(name:String):Class {
			if (!_registredLoaderTypes[name]) throw new ArgumentError("unknown loader type");
			return _registredLoaderTypes[name] as Class;
		}
		
	}

}