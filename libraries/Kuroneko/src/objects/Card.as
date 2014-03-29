package objects
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Card extends Sprite
	{
		private var _owner:Cell;
		private var _letter:TextField;
		
		public function Card(owner:Cell)
		{
			super();
			_owner = owner;
			var quad:Quad = new Quad(Constants.GameWidth * 0.15, Constants.GameWidth * 0.15, 0x000000);
			addChild(quad);
		}
		
		public function returnToOwner():void {
			pivotX = 0;
			pivotY = 0;
			removeFromParent();
			_owner.addChild(this);
			x = 0;//parent.x;
			y = 0;//parent.y;
		}
	}
}