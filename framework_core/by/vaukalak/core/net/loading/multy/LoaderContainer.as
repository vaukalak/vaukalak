package by.vaukalak.core.net.loading.multy {
	import by.vaukalak.core.net.loading.base.ILoader;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class LoaderContainer{
		
		public var id:String;
		public var inited:Boolean;
		
		private var _target:ILoader;
		
		public function LoaderContainer(target:ILoader) {
			_target = target;
		}
		
		public function get target():ILoader { return _target; }
		
	}

}