package;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxFilterFrames;
import flash.filters.GlowFilter;
import flixel.util.FlxColor;
import flixel.addons.nape.FlxNapeSpace;
class Pause2 extends FlxSubState{
   
    public var pauseMsg:FlxText;
	
	override public function create():Void
	{
		FlxG.sound.pause();
		FlxG.mouse.visible = true; 
        pauseMsg = new FlxText(304,150, 160);
        pauseMsg.borderColor = 0xff000000;
        pauseMsg.borderStyle = FlxTextBorderStyle.NONE;
        pauseMsg.size = 16;
        pauseMsg.text = "GAME PAUSED";
		add(pauseMsg);
       
		
		
    }
	
 override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
       
    }
    
}