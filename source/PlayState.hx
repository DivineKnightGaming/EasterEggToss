package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;
import flixel.addons.display.FlxExtendedSprite;
import flixel.util.FlxCollision;
import flixel.addons.plugin.FlxMouseControl;
import flixel.util.FlxRect;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var curEgg:Int;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		FlxG.plugins.add(new FlxMouseControl());
		
		Reg.sprite = new FlxSprite(0,0,Reg.background);
		add(Reg.sprite);
		
		Reg.scoreText = new FlxText(30, 550, 600, "Score: 0");
		Reg.scoreText.size = 20;
		add(Reg.scoreText);
		Reg.eggsLeft = 12;
		Reg.eggsText = new FlxText(30, 580, 600, "Eggs left: 12");
		Reg.eggsText.size = 20;
		add(Reg.eggsText);
		
		Reg.purpleBasketSprite = new FlxExtendedSprite(32, 768 - 64, Reg.purpleBasket);
		Reg.purpleBasketSprite.enableMouseDrag(true, true, 255, new FlxRect(0,640,768,128));
		add(Reg.purpleBasketSprite);
		Reg.greenBasketSprite = new FlxExtendedSprite(224,768-64,Reg.greenBasket);
		Reg.greenBasketSprite.enableMouseDrag(true, true, 255, new FlxRect(0,640,768,128));
		add(Reg.greenBasketSprite);
		Reg.blueBasketSprite = new FlxExtendedSprite(416,768-64,Reg.blueBasket);
		Reg.blueBasketSprite.enableMouseDrag(true, true, 255, new FlxRect(0,640,768,128));
		add(Reg.blueBasketSprite);
		Reg.pinkBasketSprite = new FlxExtendedSprite(608,768-64,Reg.pinkBasket);
		Reg.pinkBasketSprite.enableMouseDrag(true, true, 255, new FlxRect(0,640,768,128));
		add(Reg.pinkBasketSprite);
		
		this.dropEgg();
	}
	
	public function dropEgg():Void
	{
		curEgg = FlxRandom.intRanged(0, 4);
		switch(curEgg)
		{
			case 0:
				Reg.eggSprite = new FlxSprite(FlxRandom.intRanged(0, (768-64)),-64,Reg.blueEgg);
			case 1:
				Reg.eggSprite = new FlxSprite(FlxRandom.intRanged(0, (768-64)),-64,Reg.greenEgg);
			case 2:
				Reg.eggSprite = new FlxSprite(FlxRandom.intRanged(0, (768-64)),-64,Reg.purpleEgg);
			case 3:
				Reg.eggSprite = new FlxSprite(FlxRandom.intRanged(0, (768-64)),-64,Reg.pinkEgg);
			case 4:
				Reg.eggSprite = new FlxSprite(FlxRandom.intRanged(0, (768-64)),-64,Reg.blackEgg);
		}
		Reg.eggSprite.velocity.y = FlxRandom.intRanged(200, 275);
		add(Reg.eggSprite);
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
		this.checkCollisions();
		Reg.scoreText.text = "Score: " + Reg.score;
		Reg.eggsText.text = "Eggs Left: " + Reg.eggsLeft;
		if(Reg.eggsLeft == 0)
		{
			FlxG.switchState(new GameOverState());
		}
	}	
	
	/**
	 * Pixel perfect collision check between all objects
	 */
	function checkCollisions():Void
	{
		if (Reg.eggSprite.alive)
		{
			if(Reg.eggSprite.y > FlxG.height-Reg.eggSprite.height)
			{
				if (curEgg != 4)
				{
					Reg.eggsLeft--;
				}
				Reg.eggSprite.kill();
				this.dropEgg();
			}

			switch(curEgg)
			{
				case 0:
					if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.blueBasketSprite, FlxSprite)))
					{
						Reg.score++;
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.purpleBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.greenBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.pinkBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
				case 1:
					if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.greenBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.score++;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.purpleBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.blueBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.pinkBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
				case 2:
					if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.purpleBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.score++;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.blueBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.greenBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.pinkBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
				case 3:
					if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.pinkBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.score++;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.purpleBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.greenBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.blueBasketSprite, FlxSprite)))
					{
						Reg.eggsLeft--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
				case 4:
					if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.blueBasketSprite, FlxSprite)))
					{
						Reg.score--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.purpleBasketSprite, FlxSprite)))
					{
						Reg.score--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.greenBasketSprite, FlxSprite)))
					{
						Reg.score--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
					else if (FlxCollision.pixelPerfectCheck(cast(Reg.eggSprite, FlxSprite), cast(Reg.pinkBasketSprite, FlxSprite)))
					{
						Reg.score--;
						Reg.eggSprite.kill();
						this.dropEgg();
					}
			}
		}
	}
}