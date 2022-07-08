package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;
import flixel.util.FlxSpriteUtil;
import flixel.addons.text.FlxTypeText;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

/**
 * ...
 * @author Thomas Williamson
 */
class Ending extends FlxState
{
  // private var bg:FlxSprite;
   private var txt:FlxTypeText;
  // private var txt2:FlxText;
  private var time:Float = 8;
   private var skip:FlxSprite;
	override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		skip = new FlxSprite(FlxG.width / 2 -57, 380);
	    skip.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
	    skip.animation.add("off", [1], 1, true);
	    skip.animation.add("on", [6], 1, true);
		
		txt = new FlxTypeText(320, 100, FlxG.width - 150, "THE END", 24,true );
		txt.delay = 0.0;
		txt.eraseDelay = 0.0;
		txt.showCursor = false;
		txt.color = FlxColor.WHITE;
		txt.waitTime = 1;
		txt.autoErase = true;
		add(skip);
		FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(skip, skipScene, null, scalep1, uscalep1);
	skip.animation.play("off");
	}
	function scalep1(Sprite:FlxSprite)
   {
	   skip.animation.play("on");
   }
    function uscalep1(Sprite:FlxSprite)
   {
	   skip.animation.play("off");
   }
	private function skipScene(Sprite:FlxSprite):Void
	{
	FlxG.switchState(new MenuState());
	}
	override public function destroy():Void
	{
		super.destroy();
	}
	function first()
	{
		add(txt);
			txt.start(0.02, false, true);
	}
	
	
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
     	time -= FlxG.elapsed;
	
		
	if (time < 8 && time > 5)
		{
		txt.erase(0.0);
        first(); 
		}
	else if (time < 5 && time > 0)
		{
		   FlxG.switchState(new Credits());
		}
  }
}