package 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextSnapshot;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Main extends MovieClip 
	{
		public var paquetcarte:PaquetCartes;
		
		public var jouer:Jouer = new Jouer();
		public var pointage:TextField = new TextField();
		public var suite:TextField = new TextField();
		public var ronde:TextField = new TextField();
		public var rondeInt:int = 1;
		public var score:TextField = new TextField();
		
		public var wild:TextField = new TextField();
		public var deck:TextField = new TextField();
		
		public var ok:SimpleButton = new SimpleButton();
		public var rejouer:SimpleButton = new SimpleButton();
		public var roundovercount:int = 0;
		public var partiecount:int = 0;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Constantes.monMain = this;
			
			
			jouer.x = 250;
			jouer.y = 250;
			//jouer.gotoAndStop(1);
			stage.addChild(jouer);
			gotoAndStop(1);
			

			
			
			jouer.addEventListener(MouseEvent.CLICK, jouerClick, false, 0, true);
			// entry point
		}
		
		
	
		
		private function retour(e:MouseEvent):void 
		{
			//stage.addEventListener(Event.ADDED, stageAddedHandler, false, 0, true);
			
			
			
			
			//Constantes.monMain = this;
			
			gotoAndStop(1);
			stage.addChild(jouer);
			

			stage.addEventListener(Event.ADDED, mainF, false, 0, true);
			
			
			
			
		}
		
		
		private function mainF(e:Event):void {
			
			var jou:SimpleButton;
			trace("mainF");
			trace(e.target);
			
			
			
			if ( e.target.name == "jouer") {
				jou = SimpleButton(e.target);
				trace("dans le if jouer");
				jou.addEventListener(MouseEvent.CLICK, jouerClick, false, 0, true);
				stage.removeEventListener(Event.ADDED, mainF);
			}
		}
		
		
		
		
		
			private function jouerClick(e:MouseEvent):void 
		{
			//stage.addEventListener(Event.ADDED, stageAddedHandler, false, 0, true);
			
			gotoAndStop(2);
			if (stage.contains(jouer)) {
				stage.removeChild(jouer);
			}
			
			stage.addEventListener(Event.ADDED, stageAddedHandler, false, 0, true);
			
			paquetcarte = new PaquetCartes(stage);
			addChild(paquetcarte);

			
		}
		
		private function stageAddedHandler(e:Event):void 
		{
			var pointageInter:TextField;
			var suiteInter:TextField;
			var rondeInter:TextField;
			
			if ( e.target.name == "pointage") {
				pointageInter = TextField(e.target);
				partiecount++
				
			}
			
			
			if ( e.target.name == "suite") {
				suiteInter = TextField(e.target);
				partiecount++
			}
			
			if ( e.target.name == "ronde") {
				rondeInter = TextField(e.target);
				trace("ronde int : "+rondeInt);
				rondeInter.text = String(rondeInt);
				partiecount++
			}
			
			if (partiecount == 3) {
				stage.removeEventListener(Event.ADDED, stageAddedHandler);
			}
			
		}
		
	
		
		public function goGameOver(score2:TextField):void {
			gotoAndStop(4);
			score = score2;
			stage.addEventListener(Event.ADDED, scoreF, false, 0, true);
			
		}
		
		private function scoreF(e:Event):void 
		{
			var scoreinter:TextField;
			var btok:SimpleButton;
			
			
			if ( e.target.name == "score") {
				scoreinter = TextField(e.target);
				scoreinter.text = score.text;
			}
			
			if ( e.target.name == "ok") {
				btok = SimpleButton(e.target);
				trace("dans le if")
				btok.addEventListener(MouseEvent.CLICK, retour, false, 0, true);
			}
			
			
			
			
			//stage.removeEventListener(Event.ADDED, scoreF);
		}
		
		
		//score2:TextField ,wc2:TextField ,deck2:TextField ,round2:TextField
		public function roundover(wc2:TextField,deck2:TextField, score2:TextField, round2:TextField):void {
			gotoAndStop(3);
			wild = wc2;
			deck = deck2;
			score = score2;
			ronde = round2;
			stage.addEventListener(Event.ADDED, roundoverF, false, 0, true);
			
	
			
		}
		
		private function roundoverF(e:Event):void 
		{
			
			
		
			var s:TextField;
			var w:TextField;
			var d:TextField;
			var r:TextField;
			var rep:SimpleButton;
			
			if ( e.target.name == "score") {
				 s = TextField(e.target);
				 s.text = score.text;
				 roundovercount++
			}
			
			if ( e.target.name == "wild") {
				 w = TextField(e.target);
				 w.text = wild.text;
				 roundovercount++
			}
			
			
			if ( e.target.name == "deck") {
				 d = TextField(e.target);
				 d.text = deck.text;
				 roundovercount++
			}
			
			
			if ( e.target.name == "ronde") {
				 r = TextField(e.target);
				 r.text = ronde.text;
				 roundovercount++
			}
			
			if ( e.target.name == "rejouer") {
				 rep = SimpleButton(e.target);
				 rondeInt++;
				 partiecount = 0;
				 rep.addEventListener(MouseEvent.CLICK, jouerClick, false, 0, true);
				 roundovercount++
			}
			
			if (roundovercount == 5) {
				stage.removeEventListener(Event.ADDED, roundoverF);
			}
			
		}
		
	}
	
}