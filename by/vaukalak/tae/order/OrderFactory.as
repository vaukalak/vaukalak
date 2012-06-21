package by.vaukalak.tae.order {
	import by.vaukalak.tae.core.BaseElement;
	import by.vaukalak.tae.TAEOrder;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class OrderFactory{
		
		private var _type:uint;
		
		public function OrderFactory() { }
		
		public function createNewOrder(fields:Vector.<BaseElement>):AbstractOrder {
			switch(_type) {
				case TAEOrder.SEQUENTIAL:
					return new SequentialOrder(fields);
				break;
				case TAEOrder.RANDOM:
					return new RandomOrder(fields);
				break;
				default:
					throw new ArgumentError("incorrect order type");
			}
		}
		
		public function get type():uint { return _type; }
		
		public function set type(value:uint):void {
			_type = value;
		}
		
	}

}