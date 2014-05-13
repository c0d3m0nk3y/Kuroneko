package scenes {
	import com.pozirk.ads.admob.AdEvent;
	import com.pozirk.ads.admob.AdMob;
	import com.pozirk.ads.admob.AdParams;
	
	import avmplus.getQualifiedClassName;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	
	public class MainMenu extends Sprite {
		private var _admob:AdMob;
		
		public function MainMenu() {
			var title:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.1, "Kana Puzzle", "Romanji", BitmapFont.NATIVE_SIZE, 0xffffff);
			title.x = Constants.GameWidth * 0.05;
			addChild(title);
			
			var free:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.05, "Free, from MonkeyPants Studio.", "Romanji", BitmapFont.NATIVE_SIZE * 0.4, 0xffffff);
			free.x = Constants.GameWidth * 0.05;
			free.y = Constants.GameHeight * 0.1;
			addChild(free);
			
			var textField:TextField = new TextField(Constants.GameWidth * 0.9, Constants.GameHeight * 0.4, "Rapidly develop your knowledge of the Japaneses Kana Syllabry.\nMemorize the locations of all the Kana.  Return them to their original location after shuffling.", "Romanji", BitmapFont.NATIVE_SIZE * 0.6, 0xffffff);
			textField.y = Constants.GameHeight * 0.2;
			textField.x = Constants.GameWidth * 0.05;
			addChild(textField);
			
			var katakana:Button = new Button(Assets.getTexture("blankbutton"), "Katakana");
			katakana.fontName = "Romanji";
			katakana.fontSize = BitmapFont.NATIVE_SIZE;
			katakana.fontColor = 0xFF7790;
			katakana.x = (Constants.GameWidth - katakana.width) * 0.5;
			katakana.y = (Constants.GameHeight - katakana.height) * 0.7;
			katakana.name = getQualifiedClassName(KatakanaPuzzle);
			addChild(katakana);
			
			
			var hiragana:Button = new Button(Assets.getTexture("blankbutton"), "Hiragana");
			hiragana.fontName = "Romanji";
			hiragana.fontSize = BitmapFont.NATIVE_SIZE;
			hiragana.fontColor = 0xFFF67F;
			hiragana.x = (Constants.GameWidth - hiragana.width) * 0.5;
			hiragana.y = (Constants.GameHeight - hiragana.height) * 0.85;
			hiragana.name = getQualifiedClassName(HiraganaPuzzle);
			addChild(hiragana);
			
			initAdMob();
		}
		
		private function initAdMob():void {
			try {
				_admob = new AdMob();
				_admob.addEventListener(AdEvent.INIT_OK, onAdEvent);
				_admob.addEventListener(AdEvent.INIT_FAIL, onAdEvent);
				_admob.addEventListener(AdEvent.AD_SHOW_OK, onAdEvent);
				_admob.addEventListener(AdEvent.AD_SHOW_FAIL, onAdEvent);
				_admob.addEventListener(AdEvent.PRESENT_SCREEN, onAdEvent);
				_admob.addEventListener(AdEvent.DISMISS_SCREEN, onAdEvent);
				_admob.addEventListener(AdEvent.LEAVE_APPLICATION, onAdEvent);
				_admob.addEventListener(AdEvent.INTERSTITIAL_CACHE_OK, onAdEvent);
				_admob.addEventListener(AdEvent.INTERSTITIAL_CACHE_OK, onAdEvent);
				_admob.addEventListener(AdEvent.INTERSTITIAL_CLOSED, onAdEvent);
				_admob.init("ca-app-pub-3134016349170574/2035960240");
				
				_admob.show(AdParams.SIZE_BANNER, AdParams.HALIGN_CENTER, AdParams.VALIGN_BOTTOM);
			} catch(e:Error) {
				Support.log("GamePage.initAdMob",e);
			}
		}
		
		private function onAdEvent(ae:AdEvent=null):void {
			//			Support.log(ae.type + " " + ae._data);
		}
	}
}
