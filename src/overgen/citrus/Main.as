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
			// TODO Auto Generated method stub
		}
				
		/*override this function to setup our _starling and call the starlingState*/
		override protected function handleAddedToStage(e:Event):void
		{
			super.handleAddedToStage(e);
			
			setUpStarling(true, 1, null, "baseline");
			
			state = new GameState();
		}	
	}
	
}