package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Undo extends MovieClip 
	{
		public var carteCentreA:Carte = null;
		public var carteCentreB:Carte = null;
		public function Undo() 
		{
			super();
			
		}
		
		public function placer(jeu:MovieClip):void {
			this.x = 470;
			this.y = 320;
			this.gotoAndStop(1);
			//PaquetCartes(parent).test();
			//this.addEventListener(MouseEvent.CLICK, undoClick, false, 0, true)
			jeu.addChild(this);
		}
		
	
		
		
	}

}