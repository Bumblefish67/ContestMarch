package ;
	import flixel.FlxSprite;
	import flixel.FlxObject;
	import flixel.FlxG;
	import flixel.util.FlxSpriteUtil;
	import flixel.ui.FlxBar;
    import flixel.util.FlxColor;
/**
 * ...
 * @author Thomas Williamson
 */
class Boss2 extends FlxSprite
{

        public var moving:UInt;
		public var walkSpeed:Float ;
		public static var bar:FlxBar;
		public function new(X:Int, Y:Int) 
	{
			super(X, Y);
		bar = new FlxBar(100, 402,  FlxBarFillDirection.LEFT_TO_RIGHT, 532, 10, this,"health");
	    bar.createFilledBar(FlxColor.PINK, FlxColor.BLUE, true);
		health = 100;
		loadGraphic("assets/bosssheet2.png", true, 125, 120, true);
            
		  animation.add("dead", [11],1,true);
		  animation.add("walk", [0, 1, 2, 3, 4, 3, 2, 1], 12, true);
		  animation.add("dying", [5,6,7,8,9,10,10,11], 4, true);
		//  animation.add("up",[0,1,2, 3,4,5,6], 9, true);
		 // animation.add("down",[0,1,2, 3,4,5,6], 9, true);
			//solid = true;
     //    walkSpeed = 120;
	}
		  override public function update(elapsed:Float):Void
   {
                  super.update(elapsed);
				  bar.update(elapsed);
			
     }
}