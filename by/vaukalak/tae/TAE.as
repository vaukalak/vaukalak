package by.vaukalak.tae {
	import by.vaukalak.tae.core.AbstractComponent;
	import by.vaukalak.tae.core.BaseElement;
	import by.vaukalak.tae.core.ConcreteComponent;
	import by.vaukalak.tae.effects.AbstractTransition;
	import by.vaukalak.tae.order.AbstractOrder;
	import by.vaukalak.tae.order.OrderFactory;
	import by.vaukalak.tae.order.RandomOrder;
	import by.vaukalak.tae.order.SequentialOrder;
	import by.vaukalak.tae.split.BaseSplitPattern;
	import by.vaukalak.tae.split.CharSplitPattern;
	import by.vaukalak.tae.split.SplitModeFactory;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class TAE extends Sprite{
		
		private var _textField:TextField;
		
		private var _timer:Timer;
		private var _fields:Vector.<BaseElement>;
		private var _time:uint;
		
		private var _order:AbstractOrder;
		private var _orderFactory:OrderFactory;
		
		private var _splitPattern:BaseSplitPattern;
		private var _splitPatternFactory:SplitModeFactory;
		
		private var _transitions:Vector.<AbstractTransition> = Vector.<AbstractTransition>([]);
		
		public var elementDurationPercent:Number = 10;
		
		public function TAE(textField:TextField) {
			super();
			
			_splitPatternFactory = new SplitModeFactory();
			_splitPatternFactory.type = SplitMode.CHAR;
			
			_orderFactory = new OrderFactory();
			_orderFactory.type = TAEOrder.SEQUENTIAL;
			
			this.textField = textField;
			_timer = new Timer(50);
			_timer.addEventListener(TimerEvent.TIMER, _onTimerCount);
		}
		
		public function set textField(value:TextField):void {
			_textField = value;
			
			this.x = _textField.x;
			this.y = _textField.y;
			_textField.parent.addChild(this);
			_textField.parent.removeChild(_textField);
		}
		
		//--------------------------------------------------------------------------
		//
		//  HANDLING EFFECTS
		//
		//--------------------------------------------------------------------------
		
		public function addTranstion(transition:AbstractTransition):void {
			_transitions.push(transition);
		}
		
		//--------------------------------------------------------------------------
		//
		//  PARAMETERS GETTERS & SETTERS
		//
		//--------------------------------------------------------------------------
		
		public function set splitPattern(value:String):void {
			_splitPatternFactory.type = value;
		}
		
		public function set order(value:uint):void {
			_orderFactory.type = value;
		}
		
		public function set time(value:uint):void {
			_time = value;
		}
		
		private function get _timerDelay():uint {
			return (_time * (100 - elementDurationPercent) / 100) / (_fields.length - 1);
		}
		
		private function get _elementDuration():uint {
			return _time * elementDurationPercent / 100;
		}
		
		//--------------------------------------------------------------------------
		//
		//  PROCESSING ANIMATION
		//
		//--------------------------------------------------------------------------
		
		public function startAnimation():void {
			
			
			_splitPattern = _splitPatternFactory.createSplitPattern();
			_fields = _splitPattern.split(_textField);
			_order = _orderFactory.createNewOrder(_fields);
			
			_timer.reset();
			_timer.repeatCount = _fields.length;
			_timer.delay = _timerDelay;
			_timer.start();
		}
		
		private function _onTimerCount(e:TimerEvent):void {
			var element:BaseElement = _order.nextElement;
			var component:AbstractComponent = new ConcreteComponent(element);
			
			for (var i:uint = 0; i < _transitions.length; i++) {
				
				component = _transitions[i].applyToObject(component, _elementDuration);
				_transitions[i].applyToObject(component, _elementDuration);
			}
			addChild(element);
		}
	}

}