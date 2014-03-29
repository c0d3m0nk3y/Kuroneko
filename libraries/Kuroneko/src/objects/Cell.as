package objects
{
	import starling.display.Quad;
	import starling.display.Sprite;
	
	public class Cell extends Sprite
	{
		public function Cell()
		{
			super();
			
			addChild(new Quad(Constants.GameWidth * 0.15, Constants.GameWidth * 0.15, 0xff0000));
			var quad:Quad = new Quad(Constants.GameWidth * 0.14, Constants.GameWidth * 0.14, 0x000000);
			quad.x = Constants.GameWidth * 0.005;
			quad.y = Constants.GameWidth * 0.005;
			addChild(quad);
		}
	}
}