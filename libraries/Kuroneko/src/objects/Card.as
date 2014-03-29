package objects
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Card extends Sprite
	{
		private var _owner:Cell;
		private var _tempOwner:Cell;
		private var _textField:TextField;
		private var _locked:Boolean;
		
		public function Card(owner:Cell)
		{
			super();
			_owner = owner;
			_locked = false;
			var quad:Quad = new Quad(Constants.GameWidth * 0.15, Constants.GameWidth * 0.15, 0x000000);
			quad.alpha = 0;
			addChild(quad);
		}
		
		public function returnToTempOwner():void {
			pivotX = 0;
			pivotY = 0;
			removeFromParent();
			_tempOwner.addChild(this);
			x = 0;
			y = 0;
		}
		
		public function returnToOwner():void {
			pivotX = 0;
			pivotY = 0;
			removeFromParent();
			_owner.addChild(this);
			x = 0;
			y = 0;
		}
		
		public function setText(textField:TextField):void {
			_textField = textField;
			addChild(_textField);
		}

		public function set tempCell(value:Cell):void
		{
			_tempOwner = value;
		}

		public function get tempCell():Cell
		{
			return _tempOwner;
		}

		public function get locked():Boolean
		{
			return _locked;
		}

		public function set locked(value:Boolean):void
		{
			_locked = value;
			if(value) {
				if(_textField) {
					_textField.color = 0x00ff00;
				}
			} else {
				if(_textField) {
					_textField.color = 0xffffff;
				}
			}
		}


	}
}