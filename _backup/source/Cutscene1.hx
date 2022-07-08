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
class Cutscene1 extends FlxState
{
    private var bg:FlxSprite;
    private var txt:FlxTypeText;
    private var txt2:FlxTypeText;
    private var txt3:FlxTypeText;
    private var txt4:FlxTypeText;
    private var txt5:FlxTypeText;
    private var txt6:FlxTypeText;
    private var txt7:FlxTypeText;
	private var time:Float = 15;
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
		///skip.scale.x = skip.scale.y = 2;
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/scene1.png", true, 768, 432,true);
		bg.animation.add("zero", [2], 5,true);
	    bg.animation.add("one", [1], 5,true);
		bg.animation.add("two", [0], 5,true);
		txt = new FlxTypeText(100, 10, FlxG.width - 150, "Who is there?", 24,true );
		txt.delay = 0.0;
		txt.eraseDelay = 0.0;
		txt.showCursor = false;
		txt.color = FlxColor.YELLOW;
		txt.waitTime = 1;
		txt.autoErase = true;
		txt2 = new FlxTypeText(100, 10, FlxG.width - 150, "What the..?", 24, true );
		txt2.delay = 0.0;
		txt2.eraseDelay = 0.0;
		txt2.showCursor = false;
		txt2.color = FlxColor.YELLOW;
		txt2.waitTime = 1;
		if (Reg.mute == false)
		{
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		}
		bg.animation.play("zero");
		add(bg);
		add(skip);
		FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(skip, skipScene, null, scalep1, uscalep1);
	skip.animation.play("off");
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
	FlxG.switchState(new PlayState());
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
     	time -= FlxG.elapsed;
		if (time > 12)
		{
			
		bg.animation.play("zero");
     
		}
	else if (time < 12 && time > 9)
		{
				txt.erase(0.0);
		bg.animation.play("one");
        first(); 
		}
	else if (time < 9&& time > 5)
		{
			
		bg.animation.play("two");
    second();  
		}
	
	else if (time <= 5)
		{
				FlxG.switchState(new PlayState());
		}
	}
}