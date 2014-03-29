package scenes {
	import objects.Card;
	import objects.Cell;
	
	
	public class GamePage extends Scene {
		private static const NUM_KANA:int = 46;
		private static const NUM_COLS:int = 5;
		private static const NUM_ROWS:int = 11;
		private var cells:Vector.<Cell>;
		private var cards:Vector.<Card>;
		
		public function GamePage() {
			super();
			
			makeObjects();
		}
		
		override protected function onAddedToStage():void {
			super.onAddedToStage();
			
			for each(var cell:Cell in cells) {
				addChild(cell);
			}
		}
		
		private function makeCells():void {
			cells = new Vector.<Cell>();
			for(var row:int = 0; row < NUM_ROWS; row++) {
				for(var col:int = 0; col < NUM_COLS; col++) {
					var cell:Cell = new Cell();
					cell.x = (col % NUM_COLS) * cell.width;
					cell.y = (row % NUM_ROWS) * cell.height;
				}
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
