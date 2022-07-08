package ;
import flixel.FlxSprite;
/**
 * ...
 * @author Thomas Williamson
 */
class Explosion2 extends FlxSprite
{

	public function new(X, Y) 
	{
		super(X, Y);
		loadGraphic("assets/robotcloud120x120.png", true, 120,120); 
		animation.add("downL", [0, 1, 2, 3, 4, 5, 6], 6,false);
	
	}
	override public function destroy():Void
	{
		super.destroy();
	}
	
	
	
}
