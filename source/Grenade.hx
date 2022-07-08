package ; 
import flixel.FlxSprite;
/** 
 * ... 
 * @author bumblefish 
 */ 
//  size = 16x16 
class Grenade extends FlxSprite 
{ 
	//private var blt:FlxSprite;
	public function new(X:Float, Y:Float)
	{ 
                super(X, Y);  
				loadGraphic("assets/Upgrades320023.png", true, 32,32);
				animation.add("blow", [0, 0,0], 1, false);
				
	} 
} 