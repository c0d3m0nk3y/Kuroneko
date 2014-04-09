package scenes {
	import com.pozirk.ads.admob.AdEvent;
	import com.pozirk.ads.admob.AdMob;
	import com.pozirk.ads.admob.AdParams;
	
	import objects.Card;
	import objects.Cell;
	
	import starling.display.Button;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	
	public class GamePage extends Scene {
		private static const NUM_COLS:int = 5;
		private static const NUM_KANA:int = 46;
		private static const NUM_ROWS:int = 11;
		
		public function GamePage() {
			super();
			
			makeObjects();
		}
		
		private var _admob:AdMob;
		private var _cells:Vector.<Cell>;
		
		private var _selectedCard:Card;
		private var _shuffleButton:Button;
		
		override protected function onTouch(touchEvent:TouchEvent=null):void {
			var touch:Touch = touchEvent.touches[0];
			
			if (touch) {
				if (touch.phase == TouchPhase.BEGAN) {
					selectLetter(touch);
				}
				if (touch.phase == TouchPhase.MOVED) {
					moveSelectedLetter(touch);
				}
				if (touch.phase == TouchPhase.ENDED) {
					dropSelectedLetter(touch);
					lockCorrectCards();
					checkComplete();
				}
			}
		}
		
		private function allCardsLocked():Boolean {
			for each (var cell:Cell in _cells) {
				if (cell.hasCard) {
					if (cell.card.locked == false) {
						return false;
					}
				}
			}
			
			return true;
		}
		
		private function checkComplete():void {
			if (allCardsLocked()) {
				addChild(_shuffleButton);
			}
		}
		
		private function dropSelectedLetter(touch:Touch):void {
			if (!_selectedCard)
				return;
			
			var fingerTarget:Cell = getFingerTarget(touch);
			
			if (fingerTarget) {
				if (_selectedCard == fingerTarget.card) {
					_selectedCard.tempCell.addChild(fingerTarget.tempCard);
					_selectedCard.tempCell.tempCard = fingerTarget.tempCard;
					fingerTarget.tempCard.tempCell = _selectedCard.tempCell;
					
					_selectedCard.returnToOwner();
					_selectedCard.locked = true;
				} else {
					_selectedCard.returnToTempOwner();
				}
			} else {
				_selectedCard.returnToTempOwner();
			}
			
			_selectedCard = null;
		}
		
		private function getFingerTarget(touch:Touch):Cell {
			var fingerTarget:Cell;
			
			for each (var cell:Cell in _cells) {
				if (touch.globalX > cell.x && touch.globalX < cell.x + cell.width && touch.globalY > cell.y && touch.globalY < cell.y + cell.width) {
					fingerTarget = cell;
				}
			}
			
			return fingerTarget;
		}
		
		private function initAdMob():void {
			try {
//				_admob = new AdMob();
//				_admob.addEventListener(AdEvent.INIT_OK, onEvent);
//				_admob.addEventListener(AdEvent.INIT_FAIL, onEvent);
//				_admob.addEventListener(AdEvent.AD_SHOW_OK, onEvent);
//				_admob.addEventListener(AdEvent.AD_SHOW_FAIL, onEvent);
//				_admob.addEventListener(AdEvent.PRESENT_SCREEN, onEvent);
//				_admob.addEventListener(AdEvent.DISMISS_SCREEN, onEvent);
//				_admob.addEventListener(AdEvent.LEAVE_APPLICATION, onEvent);
//				_admob.addEventListener(AdEvent.INTERSTITIAL_CACHE_OK, onEvent);
//				_admob.addEventListener(AdEvent.INTERSTITIAL_CACHE_OK, onEvent);
//				_admob.addEventListener(AdEvent.INTERSTITIAL_CLOSED, onEvent);
//				_admob.init("ca-app-pub-3134016349170574/8488596644");
//				
//				_admob.show(AdParams.SIZE_BANNER, AdParams.HALIGN_CENTER, AdParams.VALIGN_BOTTOM);
			} catch(e:Error) {
				Support.log("GamePage.initAdMob",e);
			}
		}
		
		private function lockCorrectCards():void {
			for each (var cell:Cell in _cells) {
				if (cell.hasCard) {
					if (cell.card == cell.tempCard) {
						cell.card.locked = true;
					}
				}
			}
		}
		
		private function makeCells():void {
			_cells = new Vector.<Cell>();
			
			for (var row:int = 0; row < NUM_ROWS; row++) {
				for (var col:int = 0; col < NUM_COLS; col++) {
					var cell:Cell = new Cell();
					cell.x = (col % NUM_COLS) * cell.width;
					cell.y = (row % NUM_ROWS) * cell.height;
					_cells.push(cell);
					addChild(cell);
				}
			}
			
			_cells[0].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12450), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[1].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12452), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[2].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12454), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[3].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12456), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[4].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12458), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[5].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12459), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[6].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12461), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[7].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12463), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[8].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12465), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[9].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12467), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[10].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12469), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[11].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12471), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[12].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12473), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[13].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12475), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[14].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12477), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[15].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12479), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[16].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12481), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[17].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12484), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[18].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12486), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[19].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12488), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[20].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12490), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[21].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12491), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[22].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12492), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[23].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12493), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[24].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12494), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[25].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12495), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[26].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12498), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[27].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12501), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[28].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12504), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[29].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12507), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[30].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12510), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[31].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12511), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[32].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12512), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[33].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12513), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[34].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12514), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[35].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12516), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[37].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12518), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[39].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12520), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[40].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12521), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[41].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12522), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[42].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12523), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[43].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12524), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[44].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12525), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[45].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12527), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[49].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12530), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
			_cells[50].giveCard(new TextField(cell.width, cell.height, String.fromCharCode(12531), "KatakanaLite", BitmapFont.NATIVE_SIZE, 0xffffff));
		}
		
		private function makeObjects():void {
			initAdMob();
			
			_shuffleButton = new Button(Assets.getTexture("shufflebutton"), "Shuffle");
			_shuffleButton.fontName = "Romanji";
			_shuffleButton.fontColor = 0xffffff;
			_shuffleButton.fontSize = BitmapFont.NATIVE_SIZE;
			_shuffleButton.addEventListener(Event.TRIGGERED, onShufflePressed);
			_shuffleButton.y = Constants.GameHeight - _shuffleButton.height * 2;
			_shuffleButton.x = Constants.GameWidth * 0.5 - _shuffleButton.width * 0.5;
			
			makeCells();
			
			addChild(_shuffleButton);
		}
		
		private function moveSelectedLetter(touch:Touch):void {
			if (_selectedCard) {
				_selectedCard.x = touch.globalX;
				_selectedCard.y = touch.globalY;
			}
		}
		
		private function onEvent(ae:AdEvent):void {
//			Support.log(ae.type + " " + ae._data);
		}
		
		private function onShufflePressed(event:Event=null):void {
			_shuffleButton.removeFromParent();
			unlockAllCards();
			shuffleCards();
			lockCorrectCards();
		}
		
		private function randomSort(a:*, b:*):Number {
			if (Math.random() < 0.5)
				return -1;
			else
				return 1;
		}
		
		private function selectLetter(touch:Touch):void {
			var target:Card = touch.target.parent as Card;
			
			if (target && !target.locked) {
				_selectedCard = target;
				_selectedCard.pivotX = _selectedCard.width * 0.5;
				_selectedCard.pivotY = _selectedCard.height * 0.5;
				_selectedCard.x = touch.globalX;
				_selectedCard.y = touch.globalY;
				addChild(_selectedCard);
			}
		}
		private function shuffleCards():void {
			var tempCards:Vector.<Card> = new Vector.<Card>();
			
			for each (var cell:Cell in _cells) {
				if (cell.hasCard)
					tempCards.push(cell.card);
			}
			
			tempCards.sort(randomSort);
			
			var cardIndex:int = 0;
			for each (cell in _cells) {
				if (cell.hasCard) {
					cell.addChild(tempCards[cardIndex]);
					cell.tempCard = tempCards[cardIndex];
					tempCards[cardIndex].tempCell = cell;
					cardIndex++;
				}
				
			}
		}
		
		private function unlockAllCards():void {
			for each (var cell:Cell in _cells) {
				if (cell.hasCard) {
					cell.card.locked = false;
				}
			}
		
		}
	}
}
