package by.vaukalak.core.utils.string {

/**
 * ...
 * @author Boutylin Mikhail
 */


public class StringHelper {

    public static function clearWhiteSpaces(s:String):String {
        //switch(mode) {
        //case START_OF_STRING:
        //s = s.replace(/ /, "");
        //break;
        //case END_OF_STRING:
        //break;
        //case START_AND_END_OF_STRING:
        //break;
        //}
        return s.replace(/ /, "");
    }

}

}