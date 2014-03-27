package scenes {
	import avmplus.getQualifiedClassName;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.utils.Color;
	
	public class MainMenu extends Sprite {
		public static var instance:MainMenu;
		
		public function MainMenu() {
			instance = this;
			
			var katakana:Button = new Button(Assets.getTexture("blankbutton"), "カタカナ");
			katakana.fontName = "SimSunKana";
			katakana.fontSize = BitmapFont.NATIVE_SIZE;
			katakana.fontColor = Color.WHITE;
			katakana.x = (Constants.GameWidth - katakana.width) * 0.5;
			katakana.y = (Constants.GameHeight - katakana.height) * 0.75;
			katakana.name = getQualifiedClassName(GamePage);
			addChild(katakana);
			
			var hiragana:Button = new Button(Assets.getTexture("blankbutton"), "ひらがな");
			hiragana.fontName = "SimSunKana";
			hiragana.fontSize = BitmapFont.NATIVE_SIZE;
			hiragana.fontColor = Color.WHITE;
			hiragana.x = (Constants.GameWidth - hiragana.width) * 0.5;
			hiragana.y = (Constants.GameHeight - hiragana.height) * 0.25;
			hiragana.name = getQualifiedClassName(GamePage);
			addChild(hiragana);
			
		}
	}
}
