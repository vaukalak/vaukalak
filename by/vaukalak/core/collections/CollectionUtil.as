/**
 * Created with IntelliJ IDEA.
 * User: Mihas i Valka
 * Date: 21.4.12
 * Time: 23.23
 * To change this template use File | Settings | File Templates.
 */
package by.vaukalak.core.collections {
public class CollectionUtil {

    public static function vectorToArray(v:*):Array{
        var result:Array = new Array(v.length);
        for(var i:uint = 0; i< v.length; i++){
            result[i] = v[i];
        }
        return result;
    }

}
}
