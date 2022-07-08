package ;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.addons.nape.FlxNapeSprite;
import nape.phys.BodyType;
import flixel.input.gamepad.FlxGamepad;
/**
 * ...
 * @author Thomas Williamson
 */
class Car extends FlxNapeSprite
{

	public var moving:UInt;
	static public var walkSpeed:Float = 120;
	public static var bar:FlxBar;
	public static var ended:Bool = false;
	public var gp2:FlxGamepad;
	public function new(X:Int, Y:Int)

	{
		super(X, Y);
		bar = new FlxBar(100, 20, FlxBarFillDirection.LEFT_TO_RIGHT, 532, 10, this,"health");
		bar.createFilledBar(FlxColor.RED, FlxColor.BLUE, true);
		health = 100;
		loadGraphic("assets/zombiecar.png", true, 110, 56);
		animation.add("idle", [1]);
		animation.add("walk", [0, 1, 2, 3, 4, 5, 6], 9, true);
		animation.add("walkfast", [0, 1, 2, 3, 4, 5, 6], 14, true);
		width = 50;
		height = 50;
		centerOffsets(false);
		// animation.add("up",[0,1,2, 3,4,5,6], 9, true);
		//animation.add("down",[0,1,2, 3,4,5,6], 9, true);
		solid = true;
		createRectangularBody(40, 40,BodyType.DYNAMIC);
		setBodyMaterial(0.001);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		bar.update(elapsed);
		#if(web ||desktop)
		gp2 = FlxG.gamepads.lastActive;
		#end
		if (ended == false)
		{
			if (gp2 == null)
			{
			if ( FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.A && FlxG.keys.pressed.D || FlxG.keys.pressed.A && FlxG.keys.pressed.RIGHT|| FlxG.keys.pressed.LEFT && FlxG.keys.pressed.D  || FlxG.keys.anyPressed(["LEFT","RIGHT","A","D"]) == false)
			{
				if (walkSpeed >120)
				{
					walkSpeed -= FlxG.elapsed * 200;
					// body.velocity.x = walkSpeed -120;
					if (flipX == false)
					{
						body.velocity.x = walkSpeed -120;
					}
					else if (flipX == true)
					{
						body.velocity.x = -walkSpeed -120;
					}
				}
				else
				{
					walkSpeed = 120;
					body.velocity.x = 0;
				}
			}

			else if (FlxG.keys.pressed.D  || FlxG.keys.pressed.RIGHT  )
			{
				body.velocity.x = walkSpeed*1;
				flipX = false;
				if (walkSpeed < 600)
				{
					walkSpeed += FlxG.elapsed * 90;
				}
			}
			else    if (FlxG.keys.pressed.A   || FlxG.keys.pressed.LEFT)
			{
				body.velocity.x = -walkSpeed*1 ;
				flipX = true;
				if (walkSpeed < 600)
				{
					walkSpeed += FlxG.elapsed*90;
				}
			}

			if (FlxG.keys.pressed.S  || FlxG.keys.pressed.DOWN  )
			{
				body.velocity.y = walkSpeed / 3;
			}
			else    if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
			{
				body.velocity.y = -walkSpeed /3;
			}
			else if (FlxG.keys.anyPressed(["UP","W","S","DOWN"]) == false)
			{

				body.velocity.y = 0;
			}
		}
			if (gp2 != null)
			{
				if (gp2.anyPressed (["DPAD_RIGHT","LEFT_STICK_DIGITAL_RIGHT", "DPAD_LEFT", "LEFT_STICK_DIGITAL_LEFT"]) == false)
				{
					if (walkSpeed >120)
					{
						walkSpeed -= FlxG.elapsed * 200;
						// body.velocity.x = walkSpeed -120;
						if (flipX == false)
						{
							body.velocity.x = walkSpeed -120;
						}
						else if (flipX == true)
						{
							body.velocity.x = -walkSpeed -120;
						}
					}
					else
					{
						walkSpeed = 120;
						body.velocity.x = 0;
					}
				}

				else if (gp2.pressed.DPAD_RIGHT || gp2.pressed.LEFT_STICK_DIGITAL_RIGHT || gp2.pressed.A)
				{
					body.velocity.x = walkSpeed*1;
					flipX = false;
					if (walkSpeed < 600)
					{
						walkSpeed += FlxG.elapsed * 90;
					}
				}
				else  if (gp2.pressed.DPAD_LEFT || gp2.pressed.LEFT_STICK_DIGITAL_LEFT)
				{
					body.velocity.x = -walkSpeed*1 ;
					flipX = true;
					if (walkSpeed < 600)
					{
						walkSpeed += FlxG.elapsed*90;
					}
				}
				

				if (gp2.pressed.DPAD_DOWN || gp2.pressed.LEFT_STICK_DIGITAL_DOWN)
				{
					body.velocity.y = walkSpeed / 3;
				}
				else    if (gp2.pressed.DPAD_UP || gp2.pressed.LEFT_STICK_DIGITAL_UP)
				{
					body.velocity.y = -walkSpeed /3;
				}
				else if (gp2.anyPressed(["DPAD_DOWN,LEFT_STICK_DIGITAL_DOWN,DPAD_UP,LEFT_STICK_DIGITAL_UP, A"]) == false)
				{

					body.velocity.y = 0;
				}
			}

		}
		if (ended == true)
		{
			flipX = false;
			body.velocity.x = 60;
			body.velocity.y = 0;
		}

		if (body.velocity.x  == 0 && body.velocity.y == 0)
		{
			animation.play("idle");
		}
		if (body.velocity.x > 0 && body.velocity.x  < 300  || body.velocity.y > 0 && body.velocity.y < 300 || body.velocity.x < -0 && body.velocity.x  > -300  || body.velocity.y < -0 && body.velocity.y  > -300)
		{
			animation.play("walk");
		}
		if ( body.velocity.x  > 300 || body.velocity.x  < -300)
		{
			animation.play("walkfast");
		}
	}
}
