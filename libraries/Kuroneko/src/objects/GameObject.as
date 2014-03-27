package objects {
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class GameObject extends Sprite implements IAnimatable {
		
		public function GameObject(texture:Texture=null) {
			super();
			
			initialise();
			
			if (texture)
				setImage(texture);
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		private var _image:Image;
		
		public function advanceTime(time:Number):void {
			update(time);
		}
		
		override public function dispose():void {
			super.dispose();
		}
		
		protected function update(time:Number):void {
		
		}
		
		private function addImage():void {
			if (_image) {
				addChild(_image);
			}
		}
		
		private function initialise():void {
		}
		
		private function onAddedToStage(event:Event=null):void {
			Starling.current.juggler.add(this);
		}
		
		private function onRemovedFromStage(event:Event=null):void {
			Starling.current.juggler.remove(this);
		}
		
		private function removeImage():void {
			if (_image) {
				_image.removeFromParent(true);
				_image = null;
			}
		}
		
		private function setImage(texture:Texture):void {
			removeImage();
			setImageFromTexture(texture);
			addImage();
		}
		
		private function setImageFromTexture(texture:Texture):void {
			_image = new Image(texture);
		}
	}
}
