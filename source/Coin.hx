package ; 
import flixel.FlxSprite;
import flixel.util.FlxColor;


/** 
 * ... 
 * @author bumblefish 
 */ 
//  size = 16x16 
class Coin extends FlxSprite 
{ 
	//private var blt:FlxSprite;
	public function new(){ 
                super(); 
				loadGraphic("assets/Coin1.png", false, 9, 9);
				
	} 
} 