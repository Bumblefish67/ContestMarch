package ; 
import flixel.FlxSprite;
import flixel.util.FlxColor;


/** 
 * ... 
 * @author bumblefish 
 */ 
//  size = 16x16 
class Mine extends FlxSprite 
{ 
	//private var blt:FlxSprite;
	public function new(X:Float, Y:Float) 
	{ 
                super(X,Y); 
				loadGraphic( "assets/Bomb.png", false, 18, 18);
	} 
} 