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
			
			var start:Button = new Button(Assets.getTexture("bubble"), "Start");
			start.alpha = 0.5;
			start.fontName = "Cooper Black Large";
			start.fontSize = BitmapFont.NATIVE_SIZE;
			start.scaleX = start.scaleY = 0.5;
			start.x = (Constants.GameWidth - start.width) * 0.5;
			start.y = (Constants.GameHeight - start.height) * 0.5;
			start.name = getQualifiedClassName(GamePage);
			addChild(start);
			
			var title:TextField = new TextField(Constants.GameWidth, Constants.GameHeight * 0.5, "Bubble\nPop!", "Cooper Black Large", BitmapFont.NATIVE_SIZE, Color.RED);
			addChild(title);
		}
	}
}
