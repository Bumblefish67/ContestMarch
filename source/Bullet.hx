package ; 
import flixel.FlxSprite;
/** 
 * ... 
 * @author bumblefish 
 */ 
//  size = 16x16 
class Bullet extends FlxSprite 
{ 
	//private var blt:FlxSprite;
	public function new(X:Float, Y:Float){ 
                super(X, Y); 
				makeGraphic(4, 2);
	} 
} 