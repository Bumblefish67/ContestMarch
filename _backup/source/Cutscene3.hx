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
class Cutscene3 extends FlxState
{
   private var bg:FlxSprite;
   private var bg2:FlxSprite;
   private var txt:FlxTypeText;
    private var txt2:FlxTypeText;
    private var txt3:FlxTypeText;
    private var txt4:FlxTypeText;
    private var txt5:FlxTypeText;
   private var txt6:FlxTypeText;
    private var txt7:FlxTypeText;
	private var txt8:FlxTypeText;
	private var txt9:FlxTypeText;
	private var time:Float = 60;
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
		bg2 = new FlxSprite(0, 0);
		bg.loadGraphic("assets/scene3-1.png", true, 768, 432);
		bg2.loadGraphic("assets/scene3-2.png", true, 768, 432);
		bg2.animation.add("one", [1], 1);
		bg2.animation.add("two", [0], 1);
		bg.animation.add("three", [3], 1);
		bg.animation.add("four", [2], 1);
		bg.animation.add("five", [1], 1);
		bg.animation.add("six", [0], 1);
		txt = new FlxTypeText(150, 100, FlxG.width - 150, "Quick, get in here!", 24,true );
		txt.delay = 0.0;
		txt.eraseDelay = 0.0;
		txt.showCursor = false;
		txt.color = FlxColor.WHITE;
		txt.waitTime = 1;
		txt.autoErase = true;
		txt2 = new FlxTypeText(100, 10, FlxG.width - 150, "I've been collecting information on this whole situation since the outbreak.", 24, true );
		txt2.delay = 0.0;
		txt2.eraseDelay = 0.0;
		txt2.showCursor = false;
		txt2.color = FlxColor.WHITE;
		txt2.waitTime = 1;
		txt3 = new FlxTypeText(100, 10, FlxG.width - 150, " I was out gathering resources, and saw a creature, not like the others. It was shaped like a giant mutated brain.", 24, true );
		txt3.delay = 0.0;
		txt3.eraseDelay = 0.0;
		txt3.showCursor = false;
		txt3.color = FlxColor.WHITE;
		txt3.waitTime = 1;
		txt4 = new FlxTypeText(100, 10, FlxG.width - 150, "Apparently it emitted some sort of energy, making the deceased people it killed come back to life.", 24, true );
		txt4.delay = 0.0;
		txt4.eraseDelay = 0.5;
		txt4.showCursor = false;
		txt4.color = FlxColor.WHITE;
		txt4.waitTime = 1;
		txt5 = new FlxTypeText(100, 10, FlxG.width - 150, "Luckily, I was able to improvise using my tranquilizer gun and shoot a tracking device on the creature.", 24, true );
		txt5.delay = 0.0;
		txt5.eraseDelay = 0.5;
		txt5.showCursor = false;
		txt5.color = FlxColor.WHITE;
		txt5.waitTime = 1;
		txt6 = new FlxTypeText(100, 10, FlxG.width - 150, "I didn't have the resources to fight it, but I believe that if we bring the monster down, we will be able to stop this madness.", 24, true );
		txt6.delay = 0.0;
		txt6.eraseDelay = 0.5;
		txt6.showCursor = false;
		txt6.color = FlxColor.WHITE;
		txt6.waitTime = 1;
		txt7 = new FlxTypeText(100, 10, FlxG.width - 150, "We will be able to control the situation from there, and reduce the numbers of the remaining undead over time...", 24, true );
		txt7.delay = 0.0;
		txt7.eraseDelay = 0.5;
		txt7.showCursor = false;
		txt7.color = FlxColor.WHITE;
		txt7.waitTime = 1;
		txt8 = new FlxTypeText(100, 10, FlxG.width - 150, "Damn! They got in!", 24, true );
		txt8.delay = 0.0;
		txt8.eraseDelay = 0.5;
		txt8.showCursor = false;
		txt8.color = FlxColor.YELLOW;
		txt8.waitTime = 1;
		txt9 = new FlxTypeText(100, 10, FlxG.width - 150, "Damn..", 24, true );
		txt9.delay = 0.0;
		txt9.eraseDelay = 0.5;
		txt9.showCursor = false;
		txt9.color = FlxColor.YELLOW;
		txt9.waitTime = 1;
		if (Reg.mute == false)
		{
		FlxG.sound.playMusic("assets/sounds/Decisions.mp3");
		}
		add(bg);
		add(bg2);
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
	FlxG.switchState(new Playstate5());
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
	function third()
	{
		txt2.resetText("");
		add(txt3);
		txt3.start(0.02, false, true);
	}
	function fourth()
	{
			txt3.resetText("");
		add(txt4);
		txt4.start(0.04, false, false,null,null);
	}
	function fifth()
	{
			txt4.resetText("");
		add(txt5);
		txt5.start(0.04, false, false,null,null);
	}
	function sixth()
	{
			txt5.resetText("");
		add(txt6);
		txt6.start(0.04, false, false);
	}
	function seventh()
	{
			txt6.resetText("");
		add(txt7);
		txt7.start(0.04, false, false);
	}
	function eighth()
	{
			txt7.resetText("");
		add(txt8);
		txt8.start(0.04, false, false);
	}
	function ninth()
	{
			txt8.resetText("");
		add(txt9);
		txt9.start(0.04, false, false);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
     	time -= FlxG.elapsed;
	
		
		
	if (time < 60&& time > 55)
		{
		txt.erase(0.0);
		bg2.animation.play("one");
        first(); 
		}
	else if (time < 55 && time > 35)
		{
		bg2.animation.play("two");
		   if (time < 55 && time > 49)
		   {
			second();
		   }
		     else if (time < 49 && time > 40)
		   {
			third();
		   }
		     else if (time < 40 && time > 30)
		   {
			fourth();
		   }
		}
	else if (time < 30 && time > 0)
		{
			bg2.kill();
		bg.animation.play("three");
		   if (time < 30 && time > 20)
		   {
			fifth();
		   }
		     else if (time < 20 && time > 10)
		   {
			sixth();
		   }
		     else if (time < 10 && time > 0)
		   {
			seventh();
		   }
		}
	else if (time < 0 && time > -5)
		{
		bg.animation.play("four");
		txt7.resetText("");
		}
		else if (time < -5 && time > -10)
		{
		bg.animation.play("five");
		eighth();
		}
		else if (time < -10 && time > -15)
		{
		bg.animation.play("six");
		ninth();
		}
		else if (time <= -15)
	{
		FlxG.switchState(new Playstate6());
	}
  }
}