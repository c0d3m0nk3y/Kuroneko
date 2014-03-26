package scenes {
	import objects.Bubble;
	
	public class GamePage extends Scene {
		private static const NUM_BUBBLES:int = 24;
		private var bubbles:Vector.<Bubble>;
		
		public function GamePage() {
			super();
			
			makeObjects();
		}
		
		override protected function initialise():void {
			super.initialise();
			
			for each(var bubble:Bubble in bubbles) {
				addChild(bubble);
			}
		}
		
		private function makeObjects():void {
			bubbles = new Vector.<Bubble>();
			
			for(var bubbleIndex:int = 0; bubbleIndex < NUM_BUBBLES; bubbleIndex++) {
				var bubble:Bubble = new Bubble(Assets.getTexture("bubble"));
				
				bubbles.push(bubble);
			}
		}
	}
}
