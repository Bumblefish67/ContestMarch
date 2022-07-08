package ;
 import flixel.FlxSprite;
/**
 * ...
 * @author Thomas Williamson
 */
class Zombie5 extends FlxSprite
	{
		
		public var moving:UInt;
		public var walkSpeed:Float ;
		public function new(X:Float, Y:Float) 
	{
		super(X, Y);
			loadGraphic("assets/zombieguy2.png", true, 36, 53, true);
		   animation.add("idle", [1]);
		  animation.add("walk", [0,1,2, 3,4,5,6,7], 12, true);
			solid = true;
         walkSpeed = 150;
	}
	  override public function update(elapsed:Float):Void
{
         super.update(elapsed);
		animation.play("walk");
     }
}