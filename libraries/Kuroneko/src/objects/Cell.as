package objects
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Cell extends Sprite
	{
		private var _card:Card;
		private var _hasCard:Boolean;
		private var _tempCard:Card;
		
		public function Cell()
		{
			super();
			
			_hasCard = false;
			
			var quad:Quad = new Quad(Constants.GameWidth * 0.2, Constants.GameHeight / 11, 0x000000);
			quad.touchable = false;
			addChild(quad);
		}
		
		public function giveCard(textField:TextField):void {
			_hasCard = true;
			_card = new Card(this);
			_card.locked = true;
			textField.touchable = false;
			_card.setText(textField);
			addChild(_card);
		}

		public function get hasCard():Boolean
		{
			return _hasCard;
		}

		public function get card():Card
		{
			return _card;
		}

		public function set tempCard(value:Card):void
		{
			_tempCard = value;
		}

		public function get tempCard():Card
		{
			return _tempCard;
		}


	}
}