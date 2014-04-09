package scenes {
	import avmplus.getQualifiedClassName;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class MainMenu extends Sprite {
		public function MainMenu() {
			var title:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.1, "Kana Puzzle", "Romanji", BitmapFont.NATIVE_SIZE, 0xffffff);
			title.x = Constants.GameWidth * 0.05;
			addChild(title);
			
			var free:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.05, "Free, from MonkeyPants Studio.", "Romanji", BitmapFont.NATIVE_SIZE * 0.4, 0xffffff);
			free.x = Constants.GameWidth * 0.05;
			free.y = Constants.GameHeight * 0.1;
			addChild(free);
			
			var textField:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.4, "Rapidly develop your knowledge of the Japaneses Kana Syllabry.\nMemorize the locations of all the Kana.  Return them to their original location after shuffling.", "Romanji", BitmapFont.NATIVE_SIZE * 0.6, 0xffffff);
			textField.y = Constants.GameHeight * 0.2;
			textField.x = Constants.GameWidth * 0.05;
			addChild(textField);
			
			var katakana:Button = new Button(Assets.getTexture("blankbutton"), "Katakana");
			katakana.fontName = "Romanji";
			katakana.fontSize = BitmapFont.NATIVE_SIZE;
			katakana.fontColor = Color.WHITE;
			katakana.x = (Constants.GameWidth - katakana.width) * 0.5;
			katakana.y = (Constants.GameHeight - katakana.height) * 0.75;
			katakana.name = getQualifiedClassName(KatakanaPuzzle);
			addChild(katakana);
			
			
			var hiragana:Button = new Button(Assets.getTexture("blankbutton"), "Hiragana");
			hiragana.fontName = "Romanji";
			hiragana.fontSize = BitmapFont.NATIVE_SIZE;
			hiragana.fontColor = Color.WHITE;
			hiragana.x = (Constants.GameWidth - hiragana.width) * 0.5;
			hiragana.y = (Constants.GameHeight - hiragana.height) * 0.95;
			hiragana.name = getQualifiedClassName(HiraganaPuzzle);
			addChild(hiragana);
		}
	}
}
