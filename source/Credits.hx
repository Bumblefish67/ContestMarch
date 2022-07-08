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
class Credits extends FlxState
{
   private var txt:FlxText;
   private var txt2:FlxText;
   private var txt3:FlxText;
   private var txt4:FlxText;
   private var txt5:FlxText;
   private var txt6:FlxText;
   private var txt7:FlxText;
   private var txt8:FlxText;
   private var txt9:FlxText;
   private var dbtn1:FlxSprite;
	override public function create():Void
	{
		super.create();
		#if(web || desktop)
		FlxG.mouse.visible = true;
		#end
	dbtn1 = new FlxSprite(FlxG.width/2 -57, 380);
	dbtn1.loadGraphic("assets/buttonsmedium2.png", true, 114, 35);
	dbtn1.animation.add("off", [1], 1, true);
	dbtn1.animation.add("on", [6], 1, true);
	
	txt = new FlxText(40, 100, 0, "Programming by Bumblefish", 16);
	txt.borderColor = 0xff000000;
    txt.borderStyle = FlxTextBorderStyle.NONE;
    txt.size = 16;
	txt2 = new FlxText(440, 100, 0, "Art by Steinberg", 16);
	txt2.borderColor = 0xff000000;
    txt2.borderStyle = FlxTextBorderStyle.NONE;
    txt2.size = 16;
	txt3 = new FlxText(320, 170, 0, "Songs : ", 16);
	txt3.borderColor = 0xff000000;
    txt3.borderStyle = FlxTextBorderStyle.NONE;
    txt3.size = 16;
	txt4 = new FlxText(210, 210, 0, "What You Want (Version 2) by Kevin MacLeod (incompetech.com) ", 8);
	txt4.borderColor = 0xff000000;
    txt4.borderStyle = FlxTextBorderStyle.NONE;
    txt4.size = 8;
	txt5 = new FlxText(210, 220, 0, "Licensed under Creative Commons: By Attribution 3.0", 8);
	txt5.borderColor = 0xff000000;
    txt5.borderStyle = FlxTextBorderStyle.NONE;
    txt5.size = 8;
	txt6 = new FlxText(210, 230, 0, "http://creativecommons.org/licenses/by/3.0/", 8);
	txt6.borderColor = 0xff000000;
    txt6.borderStyle = FlxTextBorderStyle.NONE;
    txt6.size = 8;
	txt7 = new FlxText(210, 280, 0, "Decisions by Kevin MacLeod (incompetech.com)", 8);
	txt7.borderColor = 0xff000000;
    txt7.borderStyle = FlxTextBorderStyle.NONE;
    txt7.size = 8;
	txt8 = new FlxText(210, 290, 0, "Licensed under Creative Commons: By Attribution 3.0", 8);
	txt8.borderColor = 0xff000000;
    txt8.borderStyle = FlxTextBorderStyle.NONE;
    txt8.size = 8;
	txt9 = new FlxText(210, 300, 0, "http://creativecommons.org/licenses/by/3.0/", 8);
	txt9.borderColor = 0xff000000;
    txt9.borderStyle = FlxTextBorderStyle.NONE;
    txt9.size = 8;
	
	add(txt);
	add(txt2);
	add(txt3);
	add(txt4);
	add(txt5);
	add(txt6);
	add(txt7);
	add(txt8);
	add(txt9);
	add(dbtn1);
	FlxG.plugins.add(new FlxMouseEventManager());
	FlxMouseEventManager.add(dbtn1, startp1, null, scalep1, uscalep1);
	dbtn1.animation.play("off");
	}
	 
	override public function destroy():Void
	{
		super.destroy();
	}
	
	function scalep1(Sprite:FlxSprite)
   {
	   dbtn1.animation.play("on");
   }
    function uscalep1(Sprite:FlxSprite)
   {
	   dbtn1.animation.play("off");
   }
    function startp1(Sprite:FlxSprite):Void
	{
	FlxG.camera.fade(FlxColor.BLACK, 0.4, false, startp1e);
   }
  	function startp1e():Void
	{
	FlxG.switchState(new MenuState());
   }
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}