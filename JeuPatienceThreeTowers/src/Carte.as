package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Carte extends MovieClip 
	{
		// quatre attribut : cartebasgauche, cartehautgauche, cartebasdroite, cartehautdroit 
		public var valeur:int = 0;
		public var cartebasgauche:Carte = null;
		public var cartehautgauche:Carte = null;
		public var cartebasdroite:Carte = null;
		public var cartehautdroite:Carte = null;
		public var carteDos:CarteDos = null;
		
		public var ancienX:int;
		public var ancienY:int;
		
		
		

		
		public function Carte(val:int, carteBG:Carte=null, carteHG:Carte=null, carteBD:Carte=null, carteHD:Carte=null, carteD:CarteDos= null)
		{
			super();
			this.valeur = val;
			this.cartebasgauche = carteBG;
			this.cartehautgauche = carteHG;
			this.cartebasdroite = carteBD;
			this.cartehautdroite = carteHD;
			this.carteDos = carteDos;
		}
		
	
		
		public function getValeur():int {
			return this.valeur;
		}
		
		public function getCarteDos():CarteDos {
			return this.carteDos;
		}
		
		
		
		
	}

}