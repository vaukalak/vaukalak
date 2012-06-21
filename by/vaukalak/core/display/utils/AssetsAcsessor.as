package by.vaukalak.core.display.utils {
	import flash.display.DisplayObjectContainer;
	import flash.utils.Dictionary;
	import flash.utils.flash_proxy;
	import flash.utils.Proxy;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public dynamic class AssetsAcsessor extends Proxy{
		
		private var _target:DisplayObjectContainer;
		private var _objects:Dictionary = new Dictionary();
		
		public function AssetsAcsessor(target:DisplayObjectContainer) {
			super();
			_target = target;
		}
		
		override flash_proxy function getProperty(name:*):* {
			if (_objects[name]) return _objects[name];
			return _objects[name] = _target.getChildByName(name);
		}
		
		public function dispose():void {
			for (var i:String in _objects) delete _objects[i];
			_target = null;
		}
		
	}

}