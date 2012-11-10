package by.vaukalak.core.process {
import flash.events.IEventDispatcher;

/**
 * ...
 * @author Boutylin Mikhail
 */
[Event(name="progress", "by.vaukalak.events.ProgressEvent")]

public interface IProgressable extends IEventDispatcher {


    function get progress():Number;
}

}