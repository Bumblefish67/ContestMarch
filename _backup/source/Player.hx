package ;
		import flixel.FlxSprite;
		import flixel.FlxObject;
		import flixel.FlxG;
		import flixel.util.FlxSpriteUtil;
		import flixel.ui.FlxBar;
      import flixel.util.FlxColor;
	  import flixel.ui.FlxVirtualPad;
	  import flixel.util.FlxDestroyUtil;
	  import flixel.ui.FlxButton;
	  import flixel.ui.FlxAnalog;
	 class Player extends FlxSprite
	{
		
		public var moving:UInt;
		public var walkSpeed:Float ;
		public static var bar:FlxBar;
		#if android
	public static var virtualPad:FlxVirtualPad;
    public static var  analog:FlxAnalog;
	#end
		public function new(X:Int, Y:Int) 
	
	{
		super(X, Y);
		bar = new FlxBar(100, 20,FlxBarFillDirection.LEFT_TO_RIGHT, 532, 10, this,"health");
	    bar.createFilledBar(FlxColor.RED, FlxColor.BLUE, true);
		health = 100;
		loadGraphic("assets/Zombiehunter.png", true, 35, 54, true);
            
		   animation.add("idle", [1]);
		  animation.add("walk", [0,1,2, 3,4,5,6], 9, true);
		  animation.add("up",[0,1,2, 3,4,5,6], 9, true);
		  animation.add("down",[0,1,2, 3,4,5,6], 9, true);
			solid = true;
         walkSpeed = 120;
	   #if android
		virtualPad = new FlxVirtualPad(NONE, A);
		virtualPad.alpha = 0.5;
		analog = new FlxAnalog(100, 332, 100, 0.25);
		virtualPad.scale.x = virtualPad.scale.y = 2;
	   virtualPad.buttonA.x  -= virtualPad.buttonA.width;
		virtualPad.buttonA.y -= virtualPad.buttonA.height ;
		
		#end
		}
		
		private function left():Void
			{
	velocity.x = -walkSpeed;
	flipX = true;
      }
		private function right():Void
			{
	velocity.x = walkSpeed;
		flipX = false;
    }
		private function up():Void
		{
	velocity.y = -walkSpeed;
	//	facing = FlxObject.UP;
    }
		private function down():Void
		{ 
	velocity.y  = walkSpeed;
	//	facing = FlxObject.DOWN;
    }
		  override public function update(elapsed:Float):Void
{
                  super.update(elapsed);
				  bar.update(elapsed);
				  if (health > 100)
				  {
				  health = 100;
				  }
			 if((velocity.x != 0) || (velocity.y != 0) ||  (velocity.y != -0))
			{
				animation.play("walk");
			}
				else {
					animation.play("idle");
				}
				#if(web ||desktop)
    if(FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
   {
	velocity.x = walkSpeed;
		flipX = false;
    }
 else  if(FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
    {
	velocity.x = -walkSpeed;
	flipX = true;
      }
	  else if(FlxG.keys.anyPressed(["A","LEFT","D","RIGHT"]) == false)
      {
	velocity.x = 0;
       }
     if(FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
     {
	velocity.y = walkSpeed;
    }
	else    if(FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
    {
	velocity.y = -walkSpeed;
    }
	else if(FlxG.keys.anyPressed(["UP","W","S","DOWN"]) == false)
      {
	velocity.y =  0;
       }
	   #end
	   #if (android)
	   if (analog.acceleration.x < 0)
	{
	    left();
	}
	else if (analog.acceleration.x > 0)
	{
		right();
	}
	else 
	{
	velocity.x =  0;
	}
	if (analog.acceleration.y < 0)
	{
		up();
	}
	else if (analog.acceleration.y > 0)
	{
		down();
	}
	else
	{
	velocity.y =  0;
	}
	analog.moves = false;
	   //velocity.y =  0;
	   //velocity.x =  0;
	   #end
     }
	 override public function destroy():Void
	{
		super.destroy();
		#if android
		//virtualPad = FlxDestroyUtil.destroy(virtualPad);
		analog = FlxDestroyUtil.destroy(analog);
		#end
	}
	inline function buttonPressed(button:FlxButton):Bool
	{
		return button.status == FlxButton.PRESSED;
	}
}
