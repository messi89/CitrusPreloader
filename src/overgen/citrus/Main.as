package overgen.citrus 
{
	import citrus.core.starling.StarlingCitrusEngine;
	import flash.events.Event;

	
	/**
	 * ...
	 * @author Messi89 OverGen
	 */
	
	public class Main extends StarlingCitrusEngine 
	{		
		public function Main():void 
		{			
			
		}	
		
		override protected function handleAddedToStage(e:Event):void
		{
			super.handleAddedToStage(e);
			setUpStarling(true, 1, null, "baseline");
			
			state = new GameState();
		}	
	}
	
}