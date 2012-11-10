/**
 * Created by IntelliJ IDEA.
 * User: 000
 * Date: 28.02.12
 * Time: 15:52
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.utils {
public class PropertyFileParser {
    public static function parse(resorse:String):Object {
        var commentlessText:String = resorse.replace(/\n?#.+\n?/g, "\n");
        var blankRowLess:String = commentlessText.replace(/\n+/g, "\n");

        var rows:Array = blankRowLess.split(/[\n]/g);
        var properties:Object = { };
        for (var i:int = 0; i < rows.length; i++) {
            var firstDelimIndex:int = String(rows[i]).search(/\s*[:=]\s*/);
            var key:String = String(rows[i]).split(/\s*[:=]\s*/)[0];
            properties[key] = String(rows[i]).slice(firstDelimIndex).replace(/\s*[:=]\s*/, "").replace(/\\n/g, "\n");
        }
        return properties;
    }
}
}
