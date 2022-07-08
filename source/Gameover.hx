package ;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxState;

/**
 * ...
 * @author Thomas Williamson
 */
class Gameover extends FlxState
{
	private var bg:FlxSprite;
	private var bg2:FlxSprite;
	private var  dbtn1:FlxButton;
override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		#if (android)
		FlxG.mouse.visible = false;
		#end
		if (Reg.mute == false)
		{
	FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		}
			dbtn1 = new FlxButton(FlxG.width/2 -50, 300,"Menu");
	   dbtn1.color = FlxColor.WHITE;
	   dbtn1.label.color = FlxColor.BLACK;
	   dbtn1.scale.x = dbtn1.scale.y = 2;
			bg = new FlxSprite(0, 0, "assets/Game-Over.png");
	    add(bg);
		add(dbtn1);
	}
 function scalep1():Void
   {
	   
   }
    function uscalep1():Void
   {
	  
   }
    function startp1():Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 0.4, false, startp1e);
   }
  	function startp1e():Void
	{
	FlxG.sound.destroy(true);
	FlxG.switchState(new MenuState());
   }
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		dbtn1.onDown.callback = startp1;
		dbtn1.onOver.callback = scalep1;
		dbtn1.onOut.callback = uscalep1;
	}
		override public function destroy():Void
	{
		super.destroy();
		
	}
}