package scenes {
	import objects.Card;
	import objects.Cell;
	
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	
	
	public class GamePage extends Scene {
		private static const NUM_KANA:int = 46;
		private static const NUM_COLS:int = 5;
		private static const NUM_ROWS:int = 11;
		private var cells:Vector.<Cell>;
		
		public function GamePage() {
			super();
			
			makeObjects();
		}
		
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
			
			cells[0].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12450), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[1].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12452), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[2].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12454), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[3].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12456), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[4].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12458), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[5].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12459), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[6].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12461), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[7].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12463), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[8].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12465), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[9].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12467), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[10].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12469), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[11].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12471), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[12].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12473), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[13].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12475), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[14].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12477), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[15].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12479), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[16].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12481), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[17].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12484), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[18].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12486), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[19].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12488), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[20].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12490), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[21].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12491), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[22].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12492), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[23].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12493), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[24].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12494), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[25].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12495), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[26].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12498), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[27].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12501), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[28].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12504), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[29].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12507), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[30].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12510), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[31].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12511), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[32].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12512), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[33].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12513), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[34].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12514), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[35].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12516), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[37].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12518), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[39].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12520), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[40].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12521), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[41].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12522), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[42].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12523), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[43].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12524), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[44].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12525), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[45].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12527), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[49].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12530), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			cells[50].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12531), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			
		}
		
		private var selectedCard:Card;
		override protected function onTouch(touchEvent:TouchEvent=null):void {
			var touch:Touch = touchEvent.touches[0];
			
			if(touch) {
				if(touch.phase == TouchPhase.BEGAN) {
					var target:Card = touch.target.parent as Card;
					if(target) {
						selectedCard = target;
						selectedCard.pivotX = selectedCard.width * 0.5;
						selectedCard.pivotY = selectedCard.height * 0.5;
						selectedCard.x = touch.globalX;
						selectedCard.y = touch.globalY;
						addChild(selectedCard);
					}
				}
				if(touch.phase == TouchPhase.MOVED) {
					if(selectedCard) {
						selectedCard.x = touch.globalX;
						selectedCard.y = touch.globalY;
					}
				}
				if(touch.phase == TouchPhase.ENDED) {
					if(selectedCard) {
						selectedCard.returnToOwner();
						selectedCard = null;
					}
				}
			}
		}
		
		private function makeObjects():void {
			makeCells();
		}
	}
}
