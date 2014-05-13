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
	
	public class GamePage extends Scene {
		private static const NUM_COLS:int = 5;
		private static const NUM_KANA:int = 46;
		private static const NUM_ROWS:int = 11;
		
		public function GamePage() {
			super();
			
			makeObjects();
		}
		
		protected var _cells:Vector.<Cell>;
		
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
		
		private function lockCorrectCards():void {
			for each (var cell:Cell in _cells) {
				if (cell.hasCard) {
					if (cell.card == cell.tempCard) {
						cell.card.locked = true;
					}
				}
			}
		}
		
		protected function getCardsToCells(cell:Cell):void {
			
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
			
			getCardsToCells(cell);
		}
		
		private function makeObjects():void {
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
