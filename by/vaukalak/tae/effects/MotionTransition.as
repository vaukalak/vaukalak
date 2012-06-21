package by.vaukalak.tae.effects {
	import by.vaukalak.tae.core.AbstractComponent;
	import by.vaukalak.tae.core.AbstractDecorator;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public class MotionTransition extends AbstractTransition{
		
		public function MotionTransition() {
			super();
			
		}
		
		override public function applyToObject(object:AbstractComponent, time:uint):AbstractDecorator {
			return new MotionTransitionItem(object, time, new Point(Math.random() * 100 - 50, Math.random() * 100 - 50));
		}
		
	}

}
import by.vaukalak.tae.core.AbstractComponent;
import by.vaukalak.tae.core.AbstractDecorator;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.utils.Timer;

class MotionTransitionItem extends AbstractDecorator{
	
	private var _compontent:AbstractComponent;
	private var _timer:Timer;
	private var _point:Point;
	private var _hasBeenProcessed:Boolean = false;
	private var _lastSavedPart:Number;
	
	public function MotionTransitionItem(compontent:AbstractComponent, time:uint, point:Point) {
		super(compontent);
		_point = point;
		_compontent = compontent;
		_timer = new Timer(30, Math.ceil(time/30));
		_timer.addEventListener(TimerEvent.TIMER, _onTimer);
		_timer.start();
	}
	
	private function _onTimer(e:TimerEvent):void {
		if (_hasBeenProcessed) {
			_compontent.target.y -= _lastSavedPart * _point.y;
			_compontent.target.x -= _lastSavedPart * _point.x;
			
		}
		_hasBeenProcessed = true;
		_lastSavedPart = _partLeft;
		_compontent.target.y += _lastSavedPart * _point.y;
		_compontent.target.x += _lastSavedPart * _point.x;
		trace((_timer.repeatCount - _timer.currentCount));
		_timer.start();
	}
	
	private function get _partLeft():Number {
		return (_timer.repeatCount - _timer.currentCount) / _timer.repeatCount;
	}
}