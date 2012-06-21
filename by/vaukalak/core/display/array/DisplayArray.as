package by.vaukalak.core.display.array {
	import by.vaukalak.core.display.array.place.HorrizontalPlaceManager;
	import by.vaukalak.core.display.array.place.IPlaceManager;
	import by.vaukalak.core.display.array.place.VerticalPlaceManager;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	public class DisplayArray extends NativeDisplayArray{
		
		protected var _items:Vector.<DisplayObject> = Vector.<DisplayObject>([]);
		protected var _managerType:uint = 0;
		private var _placeManager:IPlaceManager;
		private var _standartManagers:Vector.<IPlaceManager> = Vector.<IPlaceManager>([HorrizontalPlaceManager.instanse,
																						VerticalPlaceManager.instanse]);
		private var _objectDistance:Number = 0;
		
		public function DisplayArray() {
			super();
			managerType = PlaceManagerType.HORIZONTAL;
		}
		
		public function push(object:DisplayObject):DisplayObject {
			_items.push(object);
			super._addChild(object);
			update();
			return object;
		}
		
		//--------------------------------------------------------------------------
		//
		//  PUBLIC METHODS
		//
		//--------------------------------------------------------------------------
		
		public function getItemAt(i:uint):DisplayObject {
			return _items[i];
		}
		
		public function clear():void {
			for (var i:int = 0; i < _items.length; i++) {
				super._removeChild(_items[i]);
			}
			_items = Vector.<DisplayObject>([]);
		}
		
		//--------------------------------------------------------------------------
		//
		//  GETTERS & SETTERS
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Type of the place manager.
		 */
		
		public function get managerType():uint { return _managerType; }
		public function set managerType(value:uint):void {
			_managerType = value;
			if (value >= _standartManagers.length) throw new ArgumentError();
			else manager = _standartManagers[value];
		}
		
		/**
		 * The place objects manager.
		 */
		
		public function get manager():IPlaceManager { return _placeManager };
		public function set manager(manager:IPlaceManager):void {
			_placeManager = manager;
			update();
		}
		
		/**
		 * The length of the display array
		 */
		
		public function get length():uint { return _items.length; }
		public function set length(value:uint):void {
			if (_items.length == value) return;
			_items.length = value;
		}
		
		/**
		 * the distance among the displayed objects
		 */
		
		public function get objectDistance():Number { return _objectDistance; }
		public function set objectDistance(value:Number):void {
			if (_objectDistance == value) return;
			_objectDistance = value;
			update();
		}
		
		/**
		 * return an item in the specific posiotion
		 * @param	i the index of the item to return
		 * @return
		 */
		
		 
		public function update():void{
			_placeManager.applyTo(this);
		}
	}

}