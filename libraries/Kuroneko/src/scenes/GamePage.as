package scenes {
	import objects.Card;
	import objects.Cell;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	
	
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
		
//		override protected function onAddedToStage():void {
//			super.onAddedToStage();
//			
//			for each(var cell:Cell in cells) {
//				addChild(cell);
//			}
//		}
		
		private function makeCells():void {
			cells = new Vector.<Cell>();
			var charID:int = 10000;
			for(var row:int = 0; row < NUM_ROWS; row++) {
				for(var col:int = 0; col < NUM_COLS; col++) {
					var cell:Cell = new Cell();
					cell.x = (col % NUM_COLS) * cell.width;
					cell.y = (row % NUM_ROWS) * cell.height;
					cells.push(cell);
					addChild(cell);
				}
			}
			
			cells[0].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12450), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[1].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12452), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[2].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12454), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[3].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12456), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[4].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12458), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[5].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12459), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[6].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12461), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[7].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12463), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[8].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12465), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[9].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12467), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[10].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12469), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[11].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12471), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[12].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12473), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[13].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12475), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[14].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12477), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[15].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12479), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[16].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12481), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[17].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12484), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[18].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12486), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[19].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12488), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[20].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12490), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[21].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12491), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[22].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12492), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[23].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12493), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[24].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12494), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[25].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12495), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[26].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12498), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[27].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12501), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[28].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12504), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[29].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12507), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[30].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12510), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[31].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12511), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[32].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12512), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[33].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12513), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[34].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12514), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[35].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12516), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[37].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12518), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[39].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12520), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[40].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12521), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[41].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12522), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[42].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12523), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[43].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12524), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[44].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12525), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[45].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12527), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[49].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12530), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[50].addChild(new TextField(cell.width, cell.height, String.fromCharCode(12531), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			
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
