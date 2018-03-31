package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		Reg.sprite = new FlxSprite(0,0,Reg.background);
		add(Reg.sprite);
		
		Reg.text = new FlxText(192,200,500,"Easter Egg Toss");
		Reg.text.size = 40;
		Reg.text.color = 0xff66db;
		add(Reg.text); 
		
		Reg.text = new FlxText(10,400,758,"Catch the falling Easter Eggs in the basket with the matching color. Use the mouse to drag the baskets under the eggs. Don't catch the black eggs or you will lose a point. ");
		Reg.text.setFormat(null, 14, 0xff66db, "center");
		add(Reg.text); 
		
		Reg.sprite = new FlxSprite(150,200,Reg.pinkEgg);
		add(Reg.sprite);
		Reg.sprite = new FlxSprite(250,450,Reg.blueEgg);
		add(Reg.sprite);
		Reg.sprite = new FlxSprite(530,600,Reg.greenEgg);
		add(Reg.sprite);
		
		Reg.button = new FlxButton(300, 700, "Play Game", goToGame);
		Reg.button.loadGraphic(Reg.purpleBasket);
		Reg.button.label.setFormat(null, 22, 0xffffff, "center");
		add(Reg.button);
	}
	
	private function goToGame():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
