package by.vaukalak.core.commands
{
import by.vaukalak.core.collections.SymmetricLinker;

import flash.events.Event;

import by.vaukalak.core.commands.Command;
import by.vaukalak.core.events.BaseEventDispatcher;
import by.vaukalak.core.events.IBaseEventDispatcher;

import flash.utils.Dictionary;

/**
 * ...
 * @author Boutylin Mikhail
 */


public class CommandDispatcher implements ICommandDispatcher
{

    public function CommandDispatcher()
    {
    }

    private const _listeners:Vector.<CommandListener> = new Vector.<CommandListener>([]);

    public function dispatchCommand(command:Command):void
    {
        for (var i:uint = 0; i < _listeners.length; i++)
        {
            var commandListener:CommandListener = _listeners[i];
            if (commandListener.name == command.name)
            {
                commandListener.handler(command);
            }
        }
    }

    public function addCommandListener(name:String, listener:Function, priority:int = 0, useWeakReference:Boolean = false):void
    {
        for (var i:uint = 0; i < _listeners.length; i++)
        {
            var commandListener:CommandListener = _listeners[i];
            if ((commandListener.name == name) &&
                    (commandListener.listener == listener) &&
                    (commandListener.priority == priority) &&
                    (commandListener.useWeakReference == useWeakReference))
            {
                return;
            }
        }
        this._listeners.push(new CommandListener(name, listener, priority, useWeakReference));
    }

    public function removeCommandListener(commandName:String, listener:Function):void
    {
        for (var i:uint = 0; i < _listeners.length; i++)
        {
            var commandListener:CommandListener = _listeners[i];
            if ((commandListener.name == commandName) &&
                    (commandListener.listener == listener))
            {
                _listeners.splice(i, 1);
                i--;
            }
        }
    }

    public function hasCommandListener(commandName:String):Boolean
    {
        return super.hasEventListener(commandName);
    }
}

}

internal final class CommandListener
{
    import by.vaukalak.core.commands.Command;

    public function CommandListener(name:String, listener:Function, priority:int, useWeakReference:Boolean)
    {
        super();
        this.name = name;
        this.listener = listener;
        this.priority = priority;
        this.useWeakReference = useWeakReference;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    public var name:String;
    public var listener:Function;
    public var priority:int;
    public var useWeakReference:Boolean

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    public function handler(command:Command):void
    {
        this.listener.call(null, command);
    }

}