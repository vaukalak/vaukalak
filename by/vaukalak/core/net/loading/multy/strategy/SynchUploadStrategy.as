package by.vaukalak.core.net.loading.multy.strategy {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
		import by.vaukalak.core.events.ProcessProgressEvent;
		import by.vaukalak.core.net.loading.base.ILoader;
		import by.vaukalak.core.net.loading.multy.AbstractUploadStrategy;
	import by.vaukalak.core.net.loading.multy.LoaderContainer;
	import by.vaukalak.core.net.loading.multy.MultyLoader;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	

	
	public class SynchUploadStrategy extends AbstractUploadStrategy{
		
		private var _bytesTotal:uint;
		
		public function SynchUploadStrategy(target:MultyLoader) {
			super(target);
		}
		
		override public function upload():void {
			super.upload();
			
			_bytesTotal = 0;
			for (var i:int = 0; i < _loaders.length; i++) {
				_loaders[i].inited = false;
				_loaders[i].target.addEventListener(ProgressEvent.PROGRESS, _onItemInited);
				_loaders[i].target.load();
				
			}
		}
		
		private function _onItemInited(e:Event):void {
			var container:LoaderContainer = _findContainerByTarget(e.target as ILoader);
			if (!container.inited) {
				
				//saves bytes of the object, and closes the upload
				
				container.inited = true;
				container.target.close();
				_bytesTotal += container.target.bytesTotal;
				container.target.removeEventListener(flash.events.ProgressEvent.PROGRESS, _onItemInited);
				
				//if all items where uploaded, restarts the upload
				
				if (_checkAllLoadersWhereInited()) {
					
					dispatchEvent(new ProcessProgressEvent(ProcessProgressEvent.PROCESS_PROGRESS, false, false, 0));
					for (var i:int = 0; i < _loaders.length; i++) {
						_loaders[i].target.addEventListener(ProgressEvent.PROGRESS, _onUploadProgress);
						_loaders[i].target.load();
					}
					
				}
			}
		}
		
		private function _findContainerByTarget(target:ILoader):LoaderContainer {
			for (var i:int = 0; i < _loaders.length; i++) {
				if (_loaders[i].target == target) return _loaders[i];
			}
			return null;
		}
		
		private function _checkAllLoadersWhereInited():Boolean {
			for (var i:int = 0; i < _loaders.length; i++) {
				if (!_loaders[i].inited) return false;
			}
			return true;
		}
		
		//--------------------------------------------------------------------------
		//
		//  PROPERTIE ACSESSORS
		//
		//--------------------------------------------------------------------------
		
		private function get _bytesLoaded():uint {
			var loc:uint = 0;
			for (var i:int = 0; i < _loaders.length; i++) {
				loc += _loaders[i].target.bytesLoaded;
			}
			return loc;
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------
		
		private function _onUploadProgress(e:Event):void {
			super.dispatchEvent(new ProcessProgressEvent(ProcessProgressEvent.PROCESS_PROGRESS, false, false, _bytesLoaded / _bytesTotal));
		}
		
	}

}