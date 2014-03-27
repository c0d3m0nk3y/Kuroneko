package scenes {
	import objects.Card;
	import objects.Cell;
	
	
	public class GamePage extends Scene {
		private static const NUM_KANA:int = 46;
		private var cells:Vector.<Cell>;
		private var cards:Vector.<Card>;
		
		public function GamePage() {
			super();
			
			makeObjects();
		}
		
		override protected function initialise():void {
			super.initialise();
			
		}
		
		private function makeCells():void {
			cells = new Vector.<Cell>();
			for(var cellsIndex:int = 0; cellsIndex < NUM_KANA; cellsIndex++) {
				cells.push(new Cell());
			}
		}
		
		private function makeCards():void {
			cards = new Vector.<Card>();
			for(var cardsIndex:int = 0; cardsIndex < NUM_KANA; cardsIndex++) {
				cards.push(new Card());
			}
		}
		
		private function makeObjects():void {
			makeCells();
			makeCards();
			
		}
	}
}
