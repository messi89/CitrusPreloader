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
				
		/* override this function to setup our starling */
		override protected function handleAddedToStage(e:Event):void
		{
			super.handleAddedToStage(e);
			
			setUpStarling(true, 1, null, "baseline");
			
			
		}	
		
		/* when starling is ready we call our starlingState */
		override public function handleStarlingReady():void
		{
			state = new GameState();
		}
	}
	
}