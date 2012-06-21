package by.vaukalak.core.ui.keyboard {
	
	import flash.display.InteractiveObject;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	
	
	
	public class KeyboardManager {
		
		//--------------------------------------------------------------------------
		//
		//  PROPERTIES
		//
		//--------------------------------------------------------------------------
		
		private var _observable:InteractiveObject;
		protected const _keyRegister:Dictionary = new Dictionary();
		
		//--------------------------------------------------------------------------
		//
		//  CONSTRUCTOR
		//
		//--------------------------------------------------------------------------
		
		public function KeyboardManager(observable:InteractiveObject = null) {
			_initObservable(observable);
		}
		
		//--------------------------------------------------------------------------
		//
		//  PUBLIC METHODS
		//
		//--------------------------------------------------------------------------
		
		public function observe(observable:InteractiveObject):void {
			_initObservable(observable);
		}
		
		public function getCharTime(s:String):uint {
			return _keyRegister[keysCodes[s]];
		}
		
		public function checkKeysCombination(s:String, consecutive:Boolean = false):Boolean {
			var lastSavedTime:uint = 0;
			while(s.length){ 
				var currentChar:String = _shiftCharacter(s);
				if (currentChar == null) return false;
				s = s.substr(currentChar.length);
				if (!isKeyPressed(currentChar)) return false;
				var currentCharTime:uint = getCharTime(currentChar);
				if (consecutive && lastSavedTime > currentCharTime) {
					return false;
				}else {
					lastSavedTime = currentCharTime;
				}
			}
			return true;
		}
		
		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------
		
		private function _initObservable(observable:InteractiveObject):void {
			_observable = observable;
			_observable.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown, false, int.MAX_VALUE, true);
			_observable.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp, false, int.MAX_VALUE, true);
		}
		
		public function isKeyPressed(s:String):Boolean {
			return _keyRegister[keysCodes[s]] != undefined;
		}
		
		
		
		private function _shiftCharacter(s:String):String {
			var ch:String = s.charAt(0);
			if (ch === "$") {
				var res:Array = s.match(/\$\{(.(?!\$))+\}/);
				return res ? res[0] : null;
			}else {
				return ch;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  EVENT HANDLERS
		//
		//--------------------------------------------------------------------------
		
		private function _onKeyDown(e:KeyboardEvent):void {
			if (!_keyRegister[e.keyCode]) {
				_keyRegister[e.keyCode] = getTimer();
			}
			
		}
		
		private function _onKeyUp(e:KeyboardEvent):void {
			delete _keyRegister[e.keyCode];		
		}
	}

}

//--------------------------------------------------------------------------
//
//  INNER DEFINITIONS
//
//--------------------------------------------------------------------------

import flash.ui.Keyboard;
import flash.utils.Dictionary;

const keysCodes:Dictionary = new Dictionary();
keysCodes["${backspace}"] = Keyboard.BACKSPACE;
keysCodes["${caps_lock}"] = Keyboard.CAPS_LOCK;
keysCodes["${control}"] = Keyboard.CONTROL;
keysCodes["${delete}"] = Keyboard.DELETE;
keysCodes["${end}"] = Keyboard.END;
keysCodes["${enter}"] = Keyboard.ENTER;
keysCodes["${escape}"] = Keyboard.ESCAPE;
keysCodes["${f1}"] = Keyboard.F1;
keysCodes["${f2}"] = Keyboard.F2;
keysCodes["${f3}"] = Keyboard.F3;
keysCodes["${f4}"] = Keyboard.F4;
keysCodes["${f5}"] = Keyboard.F5;
keysCodes["${f6}"] = Keyboard.F6;
keysCodes["${f7}"] = Keyboard.F7;
keysCodes["${f8}"] = Keyboard.F8;
keysCodes["${f9}"] = Keyboard.F9;
keysCodes["${f10}"] = Keyboard.F10;
keysCodes["${f11}"] = Keyboard.F11;
keysCodes["${f12}"] = Keyboard.F12;
keysCodes["${f13}"] = Keyboard.F13;
keysCodes["${f14}"] = Keyboard.F14;
keysCodes["${f15}"] = Keyboard.F15;
keysCodes["${home}"] = Keyboard.HOME;
keysCodes["${insert}"] = Keyboard.INSERT;
keysCodes["${left}"] = Keyboard.LEFT;
keysCodes["${numpad_0}"] = Keyboard.NUMPAD_0;
keysCodes["${numpad_1}"] = Keyboard.NUMPAD_1;
keysCodes["${numpad_2}"] = Keyboard.NUMPAD_2;
keysCodes["${numpad_3}"] = Keyboard.NUMPAD_3;
keysCodes["${numpad_4}"] = Keyboard.NUMPAD_4;
keysCodes["${numpad_5}"] = Keyboard.NUMPAD_5;
keysCodes["${numpad_6}"] = Keyboard.NUMPAD_6;
keysCodes["${numpad_7}"] = Keyboard.NUMPAD_7;
keysCodes["${numpad_8}"] = Keyboard.NUMPAD_8;
keysCodes["${numpad_9}"] = Keyboard.NUMPAD_9;
keysCodes["${numpad_add}"] = Keyboard.NUMPAD_ADD;
keysCodes["${numpad_decimal}"] = Keyboard.NUMPAD_DECIMAL;
keysCodes["${numpad_divide}"] = Keyboard.NUMPAD_DIVIDE;
keysCodes["${numpad_enter}"] = Keyboard.NUMPAD_ENTER;
keysCodes["${numpad_multiply}"] = Keyboard.NUMPAD_MULTIPLY;
keysCodes["${numpad_substract}"] = Keyboard.NUMPAD_SUBTRACT;
keysCodes["${page_down}"] = Keyboard.PAGE_DOWN;
keysCodes["${page_up}"] = Keyboard.PAGE_UP;
keysCodes["${right}"] = Keyboard.RIGHT;
keysCodes["${shift}"] = Keyboard.SHIFT;
keysCodes["${space}"] = Keyboard.SPACE;
keysCodes["${tab}"] = Keyboard.TAB;
keysCodes["${up}"] = Keyboard.UP;
keysCodes["0"] = 48;
keysCodes["1"] = 49;
keysCodes["2"] = 50;
keysCodes["3"] = 51;
keysCodes["4"] = 52;
keysCodes["5"] = 53;
keysCodes["6"] = 54;
keysCodes["7"] = 55;
keysCodes["8"] = 56;
keysCodes["9"] = 57;
keysCodes["a"] = 65;
keysCodes["b"] = 66;
keysCodes["c"] = 67;
keysCodes["d"] = 68;
keysCodes["e"] = 69;
keysCodes["f"] = 70;
keysCodes["g"] = 71;
keysCodes["h"] = 72;
keysCodes["i"] = 73;
keysCodes["j"] = 74;
keysCodes["k"] = 75;
keysCodes["l"] = 76;
keysCodes["m"] = 77;
keysCodes["n"] = 78;
keysCodes["o"] = 79;
keysCodes["p"] = 80;
keysCodes["q"] = 81;
keysCodes["r"] = 82;
keysCodes["s"] = 83;
keysCodes["t"] = 84;
keysCodes["u"] = 85;
keysCodes["v"] = 86;
keysCodes["w"] = 87;
keysCodes["x"] = 88;
keysCodes["y"] = 89;
keysCodes["z"] = 90;