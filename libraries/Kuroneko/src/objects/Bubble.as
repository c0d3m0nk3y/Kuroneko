package objects
{
	import flash.geom.Point;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.events.Event;
	import starling.filters.ColorMatrixFilter;
	import starling.textures.Texture;
	
	public class Bubble extends Button implements IAnimatable
	{
		private static const SPEED_THRESHOLD:int = 10;
		private var _velocity:Point;
		private var _deceleration:Number;
		
		public function Bubble(upState:Texture, text:String="", downState:Texture=null)
		{
			super(upState, text, downState);
			_deceleration = 0.005 + Math.random() * 0.02; 
			pivotX = width * 0.5;
			pivotY = height * 0.5;
			_velocity = new Point(-SPEED_THRESHOLD * 0.5 + Math.random() * SPEED_THRESHOLD, -SPEED_THRESHOLD * 0.5 + Math.random() * SPEED_THRESHOLD);
			x = Math.random() * Constants.GameWidth;
			y = Math.random() * Constants.GameHeight;
			scaleX = scaleY = 0.05 + Math.random() * 0.25;
			alpha = 0.1;
			var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter();
			colorMatrixFilter.adjustHue(-1 + Math.random() * 2);
			filter = colorMatrixFilter;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.TRIGGERED, onTouch);
		}
		
		private function onTouch(event:Event=null):void {
			pop();
		}
		
		private function pop():void {
			Sounds.play(Sounds.POP);
			Starling.current.juggler.remove(this);
			removeFromParent(true);
		}
		
		private function onAddedToStage(event:Event=null):void
		{
			Starling.current.juggler.add(this);
		}
		
		public function advanceTime(time:Number):void
		{
			x += _velocity.x;
			y += _velocity.y;
			
			if(_velocity.x < 0) {
				_velocity.x += _deceleration;
			} else {
				_velocity.x -= _deceleration;
			}
			
			if(_velocity.y < 0) {
				_velocity.y += _deceleration;
			} else {
				_velocity.y -= _deceleration;
			}
			
			if(_velocity.x > -0.02 && _velocity.x < 0.02 && _velocity.y > -0.02 && _velocity.y < 0.02) {
				pop();
			}
			
			if(x - width * 0.5 > Constants.GameWidth) {
				x = -width * 0.5 + 1;
			} else if(x < -width * 0.5) {
				x = Constants.GameWidth + width * 0.5 - 1;
			}
			
			if(y - height * 0.5 > Constants.GameHeight) {
				y = -height * 0.5 + 1;
			} else if(y < -height * 0.5) {
				y = Constants.GameHeight + height * 0.5 - 1;
			}
		}
	}
}