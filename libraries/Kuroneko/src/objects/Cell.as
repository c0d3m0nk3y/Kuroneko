package objects
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Cell extends Sprite
	{
		private var _card:Card;
		
		public function Cell()
		{
			super();
			
//			addChild(new Quad(Constants.GameWidth * 0.15, Constants.GameWidth * 0.15, 0xff0000));
			var quad:Quad = new Quad(Constants.GameWidth * 0.15, Constants.GameWidth * 0.15, 0x000000);
			quad.touchable = false;
//			quad.x = Constants.GameWidth * 0.005;
//			quad.y = Constants.GameWidth * 0.005;
			addChild(quad);
		}
		
		public function giveCard(textField:TextField):void {
			_card = new Card(this);
			textField.touchable = false;
			_card.addChild(textField);
			addChild(_card);
		}
	}
}