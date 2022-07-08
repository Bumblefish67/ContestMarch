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
class End extends FlxState
{
   private var bg:FlxSprite;
   private var txt:FlxTypeText;
   private var txt2:FlxTypeText;
   private var time:Float = 8;
   private var skip:FlxSprite;
   
	override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
		skip = new FlxSprite(640, 380);
	    skip.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
	    skip.animation.add("off", [3], 1, true);
	    skip.animation.add("on", [8], 1, true);
		bg = new FlxSprite(0, 0);
		
		bg.loadGraphic("assets/Maps0043.png", true, 768, 432);
		bg.animation.add("one", [0], 1);
		txt = new FlxTypeText(150, 100, FlxG.width - 150, "Huh....", 24,true );
		txt.delay = 0.0;
		txt.eraseDelay = 0.0;
		txt.showCursor = false;
		txt.color = FlxColor.WHITE;
		txt.waitTime = 1;
		txt.autoErase = true;
		txt2 = new FlxTypeText(100, 100, FlxG.width - 150, "I think it's really over now.", 24, true );
		txt2.delay = 0.0;
		txt2.eraseDelay = 0.0;
		txt2.showCursor = false;
		txt2.color = FlxColor.WHITE;
		txt2.waitTime = 1;
		
		if (Reg.mute == false)
			{
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
			}
		add(bg);
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
	function second()
	{
	txt.resetText("");
		add(txt2);
		txt2.start(0.02, false, true);
	}
	
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
     	time -= FlxG.elapsed;
	
		bg.animation.play("one");
		
	if (time < 8 && time > 6)
		{
		txt.erase(0.0);
        first(); 
		}
	else if (time < 6 && time > 2)
		{
			second();
		   
		}
		
		else if (time <= 0)
	{
		FlxG.switchState(new Ending());
	}
  }
}