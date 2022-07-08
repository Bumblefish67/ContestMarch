package ;
import flixel.FlxSprite;
/**
 * ...
 * @author Thomas Williamson
 */
class Blood extends FlxSprite
	{
		
		public var moving:UInt;
		public var walkSpeed:Float ;
		public function new() 
	{
		super();
		loadGraphic("assets/zombieblood.png", true, 60, 60);
		animation.add("one", [0], 1, false);
		animation.add("two", [1], 1, false);
	    animation.add("three", [2], 1, false);
		animation.add("four", [3], 1, false);
		animation.add("five", [4], 1, false);
		animation.add("six", [5], 1, false);
		animation.add("seven", [6], 1, false);
	}
	  
}