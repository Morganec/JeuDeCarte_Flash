package  
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Jouer extends SimpleButton 
	{
		
		public function Jouer(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null) 
		{
			super(upState, overState, downState, hitTestState);
			
		}
		
	}

}