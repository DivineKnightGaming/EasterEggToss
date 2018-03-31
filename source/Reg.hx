package;

import flixel.util.FlxSave;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.effects.FlxSpriteFilter;
import flixel.addons.display.FlxExtendedSprite;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	static public var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	static public var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	static public var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	static public var score:Int = 0;
	static public var eggsLeft:Int = 0;
	/**
	 * Generic bucket for storing different <code>FlxSaves</code>.
	 * Especially useful for setting up multiple save slots.
	 */
	static public var saves:Array<FlxSave> = [];
	
	public static var text:FlxText;
	public static var scoreText:FlxText;
	public static var eggsText:FlxText;
	public static var sprite:FlxSprite;
	public static var button:FlxButton;
	
	public static var dkLogo="assets/images/DKGTitleLogo.png";
	public static var dkLogoSp:FlxSprite;
	
	public static var background="assets/images/background.png";
	
	public static var easterEggs="assets/images/easter_eggs.png";
	public static var purpleEgg="assets/images/purple_egg.png";
	public static var greenEgg="assets/images/green_egg.png";
	public static var blueEgg="assets/images/blue_egg.png";
	public static var pinkEgg="assets/images/pink_egg.png";
	public static var blackEgg="assets/images/black_egg.png";
	public static var eggSprite:FlxSprite;
	
	public static var easterBaskets="assets/images/baskets.png";
	public static var purpleBasket="assets/images/purple_basket.png";
	public static var blueBasket="assets/images/blue_basket.png";
	public static var greenBasket="assets/images/green_basket.png";
	public static var pinkBasket="assets/images/pink_basket.png";
	public static var purpleBasketSprite:FlxExtendedSprite;
	public static var blueBasketSprite:FlxExtendedSprite;
	public static var greenBasketSprite:FlxExtendedSprite;
	public static var pinkBasketSprite:FlxExtendedSprite;
}
