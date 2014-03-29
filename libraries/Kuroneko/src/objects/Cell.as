package objects
{
	import starling.display.Quad;
	import starling.display.Sprite;
	
	public class Cell extends Sprite
	{
		public function Cell()
		{
			super();
			
			
			addChild(new Quad(Constants.GameWidth * 0.2, Constants.GameWidth * 0.2, 0xff0000));
		}
	}
}