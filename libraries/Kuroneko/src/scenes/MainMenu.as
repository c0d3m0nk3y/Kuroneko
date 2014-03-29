package scenes {
	import avmplus.getQualifiedClassName;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.Color;
	
	public class MainMenu extends Sprite {
		public static var instance:MainMenu;
		
		public function MainMenu() {
			instance = this;
			
			var title:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.1, "Katakana Puzzle", "Romanji", BitmapFont.NATIVE_SIZE, 0xffffff);
			title.x = Constants.GameWidth * 0.05;
			addChild(title);
			
			var free:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.05, "Free, from MonkeyPants Studio.", "Romanji", BitmapFont.NATIVE_SIZE * 0.4, 0xffffff);
			free.x = Constants.GameWidth * 0.05;
			free.y = Constants.GameHeight * 0.1;
			addChild(free);
			
			var textField:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.4, "Rapidly develop your knowledge of the Japaneses Katakana Syllabry.\nMemorize the locations of all the Kana.  Return them to their original location after shuffling.", "Romanji", BitmapFont.NATIVE_SIZE * 0.6, 0xffffff);
			textField.y = Constants.GameHeight * 0.2;
			textField.x = Constants.GameWidth * 0.05;
			addChild(textField);
			
			var katakana:Button = new Button(Assets.getTexture("blankbutton"), "Start");
			katakana.fontName = "Romanji";
			katakana.fontSize = BitmapFont.NATIVE_SIZE;
			katakana.fontColor = Color.WHITE;
			katakana.x = (Constants.GameWidth - katakana.width) * 0.5;
			katakana.y = (Constants.GameHeight - katakana.height) * 0.85;
			katakana.name = getQualifiedClassName(GamePage);
			addChild(katakana);
			
		}
	}
}
