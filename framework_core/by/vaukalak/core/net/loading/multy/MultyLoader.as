package by.vaukalak.core.net.loading.multy {
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	import by.vaukalak.core.events.*;
	import by.vaukalak.core.net.loading.base.*;
	import by.vaukalak.core.net.loading.multy.strategy.SynchUploadStrategy;
	import flash.events.*;
	import flash.net.*;
	

	
	public class MultyLoader extends EventDispatcher{
		
		internal var $loaders:Vector.<LoaderContainer>;
		private var _pull:LoadersPull;
		
		
		//--------------------------------------------------------------------------
		//
		//  CONSTRUCTOR
		//
		//--------------------------------------------------------------------------
		
		public function MultyLoader() {
			super(this);
			_init();
		}
		
		private function _init():void{
			$loaders = new Vector.<LoaderContainer>();
			_pull = new LoadersPull();
		}
		
		//--------------------------------------------------------------------------
		//
		//  PUBLIC METHODS
		//
		//--------------------------------------------------------------------------
		
		public function addLoader(type:String, url:URLRequest = null, id:String = ""):void {
			var item:LoaderContainer = _pull.getItem(type);
			item.target.url = url;
			item.id = id;
			$loaders.push(item);
		}
		
		public function removeLoader(id:String):void {
			for (var i:int = 0; i < $loaders.length; i++) {
				if ($loaders[i].id == id) {
					$loaders.splice(i, 1)
					return;
				}
			}
			
		}
		
		public function upload(sync:Boolean = true):void {
			//TODO:Add queue upload strategy
			var _uploadStrategy:AbstractUploadStrategy = new SynchUploadStrategy(this);
			_uploadStrategy.upload();
		}
		
	}

}

import by.vaukalak.core.net.loading.assets.AssetsLoader;
import by.vaukalak.core.net.loading.base.BaseLoader;
import by.vaukalak.core.net.loading.base.ILoader;
import by.vaukalak.core.net.loading.LoaderType;
import by.vaukalak.core.net.loading.multy.LoaderTypeRegister;
import by.vaukalak.core.net.loading.multy.LoaderContainer;

class LoadersPull {
	
	private var _items:Vector.<PullItem>;
	
	//--------------------------------------------------------------------------
	//
	//  CONSTRUCTOR
	//
	//--------------------------------------------------------------------------
	
	public function LoadersPull() {
		_init();
	}
	
	private function _init():void{
		_items = new Vector.<PullItem>();
		LoaderTypeRegister.registerLoaderType(BaseLoader, LoaderType.DATA);
		LoaderTypeRegister.registerLoaderType(AssetsLoader, LoaderType.ASSETS);
	}
	
	//--------------------------------------------------------------------------
	//
	//  PUBLIC METHODS
	//
	//--------------------------------------------------------------------------
	
	public function getItem(type:String):LoaderContainer {
		var item:PullItem;
		for (var i:int = 0; i < _items.length; i++) {
			if (_items[i].type == type && _items[i].isFree)
				item = _items[i];
		}
		if (!item) item = _createItem(type);
		item.isFree = false;
		return item.target;
	}
	
	public function releaseItem(item:LoaderContainer):void {
		for (var i:int = 0; i < _items.length; i++) {
			if (_items[i].target == item) {
				_items[i].isFree = true;
				return;
			}
		}
		throw new ArgumentError("the item is not part of the pull");
	}
	
	//--------------------------------------------------------------------------
	//
	//  PRIVATE METHODS
	//
	//--------------------------------------------------------------------------
	
	private function _createItem(type:String):PullItem {
		var constructor:Class = LoaderTypeRegister.getLoaderTypeDefinition(type);
		var item:ILoader = new constructor() as ILoader;
		return new PullItem(new LoaderContainer(item), type);
	}
	
}

class PullItem {
	
	public var isFree:Boolean;
	
	private var _target:LoaderContainer;
	private var _type:String;
	
	public function PullItem(target:LoaderContainer, type:String) {
		_type = type;
		_target = target;
		this.isFree = true;
	}
	
	public function get target():LoaderContainer { return _target; }
	
	public function get type():String { return _type; }
	
}