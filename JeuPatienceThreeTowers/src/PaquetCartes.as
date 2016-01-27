package  
{
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class PaquetCartes extends MovieClip 
	{
		public var tabCarte:Array = new Array();
		public var tabCarte1:Array = new Array();
		public var tabCarte2:Array = new Array();
		public var tabCarte3:Array = new Array();
		public var tabCarte4:Array = new Array();
		public var tabCarteRetourne:Array = new Array();
		public var tabCarteRetourneHaut:Array = new Array();
		public var tabCarteHaut:Array = new Array();
		public var carteCentre:Carte = new Carte(0);
		public var wc:WildCard = new WildCard(0);
		public var lestage:Stage;
		public var jeu:MovieClip = new MovieClip();
		public var undo:Undo = new Undo();
		public var point:int = 0;
		public var pointcarte:int = 200;
		public var wcx:int;
	
		public function PaquetCartes(st:Stage) 
		{
			this.lestage = st;
			super();
			this.creerPaquet();
			this.melangerCarte();
			this.remplirTableauHaut();
			this.afficherCartes();
			
			
			
		}
		
		public function creerPaquet():void{
			for (var i:int = 1; i <= 13; i++)
			{
				tabCarte.push(new CarteCarreau(i));
			}
			
			for (i = 1; i <= 13; i++)
			{
				tabCarte.push(new CarteCoeur(i));
			}
			
			for (i = 1; i <= 13; i++)
			{
				tabCarte.push(new CarteTrefle(i));
			}
			
			for (i = 1; i <= 13; i++)
			{
				tabCarte.push(new CartePique(i));
			}
		}
		
		public function melangerCarte():void {
			var tabCarteMelange:Array = new Array();
			var pos:int = 0;
			while (tabCarte.length != 0) {
				pos = Math.floor(Math.random() * tabCarte.length);
				
				tabCarteMelange.push(tabCarte[pos]);
				tabCarte.splice(pos, 1);
			}
			tabCarte = tabCarteMelange;
		}
		
		public function remplirTableauHaut():void {
			for (var i:int = 0 ; i < 10; i++ ) {
			tabCarte4[i] = tabCarte[i];	
			tabCarte4[i]
			tabCarteHaut[i] = tabCarte4[i];
			tabCarte.splice(i, 1);
			}  // Remplissage du tableau de la derniere ligne du bas
			
			
			for (i = 0 ; i < 9; i++ ) {
			tabCarte3[i] = tabCarte[i];
			tabCarteHaut[i+10] = tabCarte3[i]
			//chainage vers le bas 
			tabCarte3[i].cartebasgauche = tabCarte4[i];
			tabCarte3[i].cartebasdroite = tabCarte4[i + 1];
			
			tabCarte.splice(i, 1);
			}  //remplissage du tableau de la troisieme ligne en partant du haut 
			
		
			
			for (i = 0 ; i < 6; i++ ) {
			tabCarte2[i] = tabCarte[i];
			tabCarteHaut[i+19] = tabCarte2[i]
			tabCarte.splice(i, 1);
			}
			for (i = 0 ; i < 3; i++ ) {
			tabCarte1[i] = tabCarte[i];
			tabCarteHaut[i+25] = tabCarte1[i]
			tabCarte.splice(i, 1);
			}
			
			
			
			for (i= 0 ; i < 10; i++ ) {
					//chainage du haut de la derniere ligne 
			if (i == 0) {
				tabCarte4[i].cartehautgauche = null;
				tabCarte4[i].cartehautdroite = tabCarte3[i];
			}else if(i == 9) {
				tabCarte4[i].cartehautgauche = tabCarte3[i-1];
				tabCarte4[i].cartehautdroite = null;
			}else {
				tabCarte4[i].cartehautgauche = tabCarte3[i-1];
				tabCarte4[i].cartehautdroite = tabCarte3[i];
			}
			}
			//chainage ligne 1 vers le bas
			tabCarte1[0].cartebasgauche = tabCarte2[0];
			tabCarte1[0].cartebasdroite = tabCarte2[1];
			tabCarte1[1].cartebasgauche = tabCarte2[2];
			tabCarte1[1].cartebasdroite = tabCarte2[3];
			tabCarte1[2].cartebasgauche = tabCarte2[4];
			tabCarte1[2].cartebasdroite = tabCarte2[5];
			
			
			//chainage ligne 2 vers le haut
			tabCarte2[0].cartehautdroite = tabCarte1[0];
			tabCarte2[2].cartehautdroite = tabCarte1[1];
			tabCarte2[4].cartehautdroite = tabCarte1[2];
			tabCarte2[1].cartehautgauche = tabCarte1[0];
			tabCarte2[3].cartehautgauche = tabCarte1[1];
			tabCarte2[5].cartehautgauche = tabCarte1[2];
			
			//chainage ligne 3 vers le haut 
			tabCarte3[0].cartehautdroite = tabCarte2[0];
			tabCarte3[1].cartehautdroite = tabCarte2[1];
			tabCarte3[3].cartehautdroite = tabCarte2[2];
			tabCarte3[4].cartehautdroite = tabCarte2[3];
			tabCarte3[6].cartehautdroite = tabCarte2[4];
			tabCarte3[7].cartehautdroite = tabCarte2[5];
			
			tabCarte3[1].cartehautgauche = tabCarte2[0];
			tabCarte3[2].cartehautgauche = tabCarte2[1];
			tabCarte3[4].cartehautgauche = tabCarte2[2];
			tabCarte3[5].cartehautgauche = tabCarte2[3];
			tabCarte3[7].cartehautgauche = tabCarte2[4];
			tabCarte3[8].cartehautgauche = tabCarte2[5];
			
			//chainage ligne 2 vers le bas 
			tabCarte2[0].cartebasdroite = tabCarte3[1];
			tabCarte2[1].cartebasdroite = tabCarte3[2];
			tabCarte2[2].cartebasdroite = tabCarte3[4];
			tabCarte2[3].cartebasdroite = tabCarte3[5];
			tabCarte2[4].cartebasdroite = tabCarte3[7];
			tabCarte2[5].cartebasdroite = tabCarte3[8];
			
			tabCarte2[0].cartebasgauche = tabCarte3[0];
			tabCarte2[1].cartebasgauche = tabCarte3[1];
			tabCarte2[2].cartebasgauche = tabCarte3[3];
			tabCarte2[3].cartebasgauche = tabCarte3[4];
			tabCarte2[4].cartebasgauche = tabCarte3[6];
			tabCarte2[5].cartebasgauche = tabCarte3[7];
			
			
			
			
		}
		
		public function afficherCartes():void 
		{	
			undo.visible = false;
			undo.placer(jeu);
			undo.addEventListener(MouseEvent.CLICK, undoClick, false, 0, true)
			var espace:int = 140;
			for (var i:int = 0 ; i < 3 ; i++) {
				var cd:CarteDos = new CarteDos();
				tabCarte1[i].x = espace;
				tabCarte1[i].carteDos = cd;
				tabCarte1[i].addEventListener(MouseEvent.CLICK, carteClick, false, 0, true);
				cd.x = espace;
				tabCarte1[i].y = 100;
				cd.y = 100;
				tabCarte1[i].gotoAndStop(tabCarte1[i].getValeur());
				jeu.addChild(tabCarte1[i]);
				jeu.addChild(cd);
				espace = espace + tabCarte1[i].width + 100;
			}
			
			
			var espace2:int = 110;
			for (i = 0; i < 6 ; i = i + 2) {
				 cd = new CarteDos();
				tabCarte2[i].x = espace2;
				cd.x = espace2
				tabCarte2[i].y = 140;
				tabCarte2[i].addEventListener(MouseEvent.CLICK, carteClick, false, 0, true);
				cd.y = 140;
				tabCarte2[i].carteDos = cd;
				tabCarte2[i].gotoAndStop(tabCarte2[i].getValeur());
				jeu.addChild(tabCarte2[i]);
				jeu.addChild(cd);
				for (var j:int = i + 1 ; j < i + 2 ; j++) {
					var cd2:CarteDos = new CarteDos();
					tabCarte2[j].x = espace2 + tabCarte2[i].width;
					cd2.x = espace2 + tabCarte2[i].width;
					tabCarte2[j].y = 140;
					tabCarte2[j].addEventListener(MouseEvent.CLICK, carteClick, false, 0, true);
					cd2.y = 140;
					tabCarte2[j].carteDos = cd2;
					tabCarte2[j].gotoAndStop(tabCarte2[j].getValeur());
					jeu.addChild(tabCarte2[j]);
					jeu.addChild(cd2);
				}
			espace2 = espace2 + 2*(tabCarte2[i].width) +40;
			}
			
			
			var espace3:int = 70;
			for (i = 0 ; i < 9; i++) {
				cd = new CarteDos();
				tabCarte3[i].x = espace3;
				cd.x = espace3
				tabCarte3[i].y = 180;
				tabCarte3[i].addEventListener(MouseEvent.CLICK, carteClick, false, 0, true);
				cd.y = 180;
				tabCarte3[i].carteDos = cd;
				tabCarte3[i].gotoAndStop(tabCarte3[i].getValeur());
				jeu.addChild(tabCarte3[i]);
				jeu.addChild(cd);
				espace3 = espace3 + tabCarte3[i].width ;
			}	
			
			var espace4:int =40;
			for (i = 0 ; i < 10; i++) {
				tabCarte4[i].x = espace4;
				tabCarte4[i].y = 220;
				tabCarte4[i].addEventListener(MouseEvent.CLICK, carteClick, false, 0, true);
				tabCarte4[i].gotoAndStop(tabCarte4[i].getValeur());
				jeu.addChild(tabCarte4[i]);
				espace4 = espace4 + ((tabCarte4[i].width)-2) ;
			}	
			
			var espaceTas:int =40;
			for ( i = 0 ; i < ((tabCarte.length) -1) ; i++) {
				 cd= new CarteDos();
				tabCarte[i].x = espaceTas;
				cd.x = espaceTas;
				tabCarte[i].y = 350;
				cd.y = 350;
				cd.addEventListener(MouseEvent.CLICK, carteGaucheClick, false, 0, true);
				tabCarte[i].gotoAndStop(tabCarte[i].getValeur());
				jeu.addChild(tabCarte[i]);
				tabCarteRetourne[i] = cd;
				jeu.addChild(cd);
				espaceTas = espaceTas + ((tabCarte[i].width)-50) ;
			}
			
			tabCarte[(tabCarte.length) -1].x = espaceTas + 60;
			tabCarte[(tabCarte.length) -1].y = 350;
			tabCarte[(tabCarte.length) -1].gotoAndStop(tabCarte[(tabCarte.length) -1].getValeur());
			carteCentre = tabCarte[(tabCarte.length) -1];
			undo.carteCentreB = carteCentre;
			jeu.addChild(tabCarte[(tabCarte.length) -1]);
			
			
			wc.x = espaceTas + 225;
			wcx = wc.x;
			wc.y = 350;
			jeu.addChild(wc);
			wc.addEventListener(MouseEvent.CLICK, WildCardClick, false, 0, true);
		
			lestage.addChild(jeu);
			
			
		}
		
			private function carteClick(e:MouseEvent):void {
				
				var carteIntem2:Carte = Carte(e.target);
				var carteHD:Carte = carteIntem2.cartehautdroite;
				var carteHG:Carte = carteIntem2.cartehautgauche;
				
				
				//pour tricher mettre "Carte" a la place de "WildCard" ci dessous ! 
				if (carteCentre is WildCard) {
					point = point - 10;
					carteIntem2.ancienX = carteIntem2.x;
					carteIntem2.ancienY = carteIntem2.y;
					undo.carteCentreA = carteIntem2;
					e.target.x = carteCentre.x;
					e.target.y = carteCentre.y;
					
					if (carteHD != null) {
						carteHD.cartebasgauche = null;
					}
					if (carteHG != null) {
						carteHG.cartebasdroite = null;
					}
					
					this.verifRetourne(carteIntem2);
					undo.carteCentreB = carteCentre;
					carteCentre = carteIntem2;
					undo.visible = true;
					carteCentre.removeEventListener(MouseEvent.CLICK, carteClick);
					jeu.addChild(carteCentre);
				}
				else if ( e.target.getValeur() == ((carteCentre.getValeur()) + 1) || e.target.getValeur() == ((carteCentre.getValeur()) - 1) ) {
					point = point + pointcarte;
					pointcarte = pointcarte + 200;
					carteIntem2.ancienX = carteIntem2.x;
					carteIntem2.ancienY = carteIntem2.y;
					undo.carteCentreA = carteIntem2;
					e.target.x = carteCentre.x;
					e.target.y = carteCentre.y;
					
					if (carteHD != null) {
						carteHD.cartebasgauche = null;
					}
					if (carteHG != null) {
						carteHG.cartebasdroite = null;
					}
					
					this.verifRetourne(carteIntem2);
					undo.carteCentreB = carteCentre;
					carteCentre = carteIntem2;
					undo.visible = true;
					carteCentre.removeEventListener(MouseEvent.CLICK, carteClick);
					jeu.addChild(carteCentre);
					
					
				}else {
					if (e.target.getValeur() == 1 && carteCentre.getValeur() == 13) {
					point = point + pointcarte;	
					pointcarte = pointcarte + 200;
					carteIntem2.ancienX = carteIntem2.x;
					carteIntem2.ancienY = carteIntem2.y;
					undo.carteCentreA = carteIntem2;
					
					e.target.x = carteCentre.x;
					e.target.y = carteCentre.y;
					
					if (carteHD != null) {
						
						carteHD.cartebasgauche = null;
					}
					if (carteHG != null) {
						carteHG.cartebasdroite = null;
					}
					
					this.verifRetourne(carteIntem2);
					undo.carteCentreB = carteCentre;
					carteCentre = carteIntem2;
					carteCentre.removeEventListener(MouseEvent.CLICK, carteClick);
					jeu.addChild(carteCentre);
					
					}
					if (e.target.getValeur() == 13 && carteCentre.getValeur() == 1) {
					point = point + pointcarte;
					pointcarte = pointcarte + 200;
					carteIntem2.ancienX = carteIntem2.x;
					carteIntem2.ancienY = carteIntem2.y;
					undo.carteCentreA = carteIntem2;
					
					e.target.x = carteCentre.x;
					e.target.y = carteCentre.y;
					if (carteHD != null) {
						carteHD.cartebasgauche = null;
					}
					if (carteHG != null) {
						carteHG.cartebasdroite = null;
					}

					this.verifRetourne(carteIntem2);
					undo.carteCentreB = carteCentre;
					carteCentre = carteIntem2;
					carteCentre.removeEventListener(MouseEvent.CLICK, carteClick);
					jeu.addChild(carteCentre);
					}
				}
				
				for (var i:int=0; i < tabCarteHaut.length; i++)
				{
					if (tabCarteHaut[i] == carteCentre)
					{
						tabCarteHaut.splice(i, 1);
					}               
				}
				
				Constantes.monMain.pointage.text = String(point);
				gagner();
				
			
				
				
				
			}
				
		
			
			private function carteGaucheClick(e:MouseEvent):void {
				
				
					
					pointcarte = 200;
					jeu.removeChild(tabCarteRetourne[0]);
					jeu.removeChild(Carte(tabCarte[0]));
					tabCarteRetourne.splice(0, 1);
					var carteInter:Carte = new Carte(0);
					carteInter = tabCarte.shift();
					
					carteInter.ancienX = carteInter.x;
					carteInter.ancienY = carteInter.y;
					
					undo.carteCentreA = carteInter;
					
					carteInter.x = carteCentre.x;
					carteInter.y = carteCentre.y;
					
					undo.carteCentreB = carteCentre;
					carteCentre = carteInter;
					
					undo.visible = true;
					jeu.addChild(carteCentre);
					gagner();
				
				
			}
			
			private function verifRetourne(c:Carte):void {
				
				var carteHD:Carte = c.cartehautdroite;
				var carteHG:Carte = c.cartehautgauche;
				if (carteHD != null) {
					if ( carteHD.cartebasdroite == null ) {
						trace("basdroite null");
						jeu.removeChild(carteHD.carteDos);
						//carteHD.carteDos = null;
					
					}else{
					trace("not null");
					}
				}else {
					trace("carteHD null");
				}
				
				if (carteHG != null) {
					if ( carteHG.cartebasgauche == null ) {
						trace("basgauche null");
						jeu.removeChild(carteHG.carteDos);
						//carteHG.carteDos = null;
					
					}else{
					trace("not null");
					}
				}else {
					trace("carteHG null");
				}
				
				
				
			}
			
			private function undoClick(e:MouseEvent):void {
			undo.gotoAndStop(2);
			
			
			pointcarte = 200;
			Constantes.monMain.pointage.text = String(point);
			
			
			Constantes.monMain.suite.text = "344";
			
			var cartedos:CarteDos = new CarteDos();
			if (undo.carteCentreA != null) {
				
				
				undo.carteCentreB.x = carteCentre.x;
				undo.carteCentreB.y = carteCentre.y;
				
				carteCentre = undo.carteCentreB;
		
				undo.carteCentreA.x = undo.carteCentreA.ancienX;
				undo.carteCentreA.y = undo.carteCentreA.ancienY;
				if (undo.carteCentreA.cartehautgauche != null) {
					undo.carteCentreA.cartehautgauche.cartebasdroite = undo.carteCentreA;
						trace("passe la");
						if (jeu.contains(undo.carteCentreA.cartehautgauche.carteDos) == false) {
						
						jeu.addChild(undo.carteCentreA.cartehautgauche.carteDos);
					}
				}
				if (undo.carteCentreA.cartehautdroite != null) {
					
						trace("et par ici");
						undo.carteCentreA.cartehautdroite.cartebasgauche = undo.carteCentreA;
						if (jeu.contains(undo.carteCentreA.cartehautdroite.carteDos) == false) {
						jeu.addChild(undo.carteCentreA.cartehautdroite.carteDos);
					}
				}
				
				
				
				
				if (undo.carteCentreA is WildCard) {
				 
				}else if (undo.carteCentreA.y == 350) {
					trace("pas -1");
					cartedos.x =  undo.carteCentreA.ancienX;
					cartedos.y =  undo.carteCentreA.ancienY;
					undo.carteCentreA.carteDos = cartedos
					var i:int = tabCarte.unshift(undo.carteCentreA);
					var j:int =tabCarteRetourne.unshift(undo.carteCentreA.carteDos);
					
					jeu.addChildAt(undo.carteCentreA, 2);
					jeu.addChild(carteCentre);
					jeu.addChildAt(undo.carteCentreA.carteDos, 3);
				}else {
					undo.carteCentreA.addEventListener(MouseEvent.CLICK, carteClick, false, 0, true);
					jeu.addChild(undo.carteCentreA);
					jeu.addChild(carteCentre);
					
				}
				undo.visible = false;
				
					
				trace("carte before :"+undo.carteCentreB+undo.carteCentreB.x + undo.carteCentreB.y);
				trace("carte after :" + undo.carteCentreA+ "x : " + undo.carteCentreA.ancienX + "y : " + undo.carteCentreA.ancienY  );
				
			}
			
			
		}
		
		
		private function WildCardClick(e:MouseEvent):void {
				
					
				
					pointcarte = 200;
					wc.ancienX = wc.x;
					wc.ancienY =wc.y;
					
					undo.carteCentreA = wc;
					
					wc.x = carteCentre.x;
					wc.y = carteCentre.y;
					
					undo.carteCentreB = carteCentre;
					carteCentre =wc;
					
					undo.visible = true;
					jeu.addChild(carteCentre);
					
					
					
					
					
					
					
				
		}
		
		
		private function verifierPlacable(carte:Carte):Boolean {
			var bool:Boolean = false ;
			if (carteCentre is WildCard) {
					bool = true;
				}
			if ( carte.getValeur() == ((carteCentre.getValeur()) + 1) || carte.getValeur() == ((carteCentre.getValeur()) - 1) ) {
					bool = true;
					
					
				}
		if (carte.getValeur() == 1 && carteCentre.getValeur() == 13) {
						bool = true;
					}
			if (carte.getValeur() == 13 && carteCentre.getValeur() == 1) {
						bool = true;
					}
			return bool;
			}
				
				
				
		
		
		private function gagner():void 
		{
			var cartePlacable:Boolean = false;
			
			for (var i:int = 0; i < tabCarteHaut.length ; i++  ) {
				if ( tabCarteHaut[i].carteDos == null) {
					
					if (this.verifierPlacable(tabCarteHaut[i]) == true) {
						cartePlacable = true;
					}
				}
			}
			
			if (tabCarteHaut.length == 0) {
				lestage.removeChild(jeu);
				var score:TextField = new TextField();
				score.text =String(point);
				
				var wildc:TextField = new TextField();
				wildc.text = "0";
				
				var deckc:TextField = new TextField();
				
				deckc.text = String((tabCarte.length -1) * 1000);
				
				
				//attention toujours contenu jeu.contains(wc)
				if (wc.x == wcx) {
					wildc.text = "1000";
				}
				
				
				
				var round:TextField = new TextField();
				var roundInt:int = (Constantes.monMain.rondeInt) * 1000;
				round.text = String(roundInt);
				
				Constantes.monMain.roundover(wildc,deckc,score,round);
				
			}else if ( (tabCarte.length -1 == 0) && (wc.x != wcx) && cartePlacable == false) {
				lestage.removeChild(jeu);
				//Constantes.monMain.gotoAndStop(4);
				 score = new TextField();
				score.text = String(point);
				Constantes.monMain.goGameOver(score);
				//Constantes.monMain.score.text = "333";
			}
			
			trace("test");
			//Constantes.monMain.alleratrois();
		}
		
		
		
	}

}