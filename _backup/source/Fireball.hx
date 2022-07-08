package ;
import flixel.FlxSprite;
//  size = 32x32 
class Fireball extends FlxSprite 
{ 
	//private var blt:FlxSprite;
	public function new(X:Float, Y:Float){ 
                super(X, Y); 
				loadGraphic("assets/fireball.png", true, 32, 32);
				animation.add("fire", [ 0, 1, 2, 1], 10, true);
				animation.play("fire");
	} 
	override public function update(elapsed:Float)
	{
	super.update(elapsed);
	if (velocity.x > 1)
	{
		flipX = false;
	}
	else if (velocity.x < 1)
	{
		flipX = true;
	}
	animation.play("fire");
	}
} 