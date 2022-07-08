package;

import flixel.FlxGame;
import openfl.display.Sprite;
//import io.newgrounds.NG;
class Main extends Sprite
{
	public function new()
	{
		super();
		//NG.create(50341:3wioN8nn);
		addChild(new FlxGame(768, 432, MenuState));
	}
}