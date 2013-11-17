package overgen.citrus  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Messi89 OverGen
	 */
	
	[SWF(width="640",height="480",frameRate="60",backgroundColor="#ffffff")]
	public class CitrusPreloader extends MovieClip
	{
		private var progressTxt:TextField = new TextField();
		
		public function CitrusPreloader() 
		{
			//stop our movieClip at first position to listen to the progress event
			stop();
			
			//textfield to show the loading progress
			progressTxt.x = stage.stageWidth / 2;
			progressTxt.y = stage.stageHeight / 2;
			progressTxt.defaultTextFormat = new TextFormat("Tahoma", "20", 0x000000, true);
			addChild(progressTxt);
			
			//handle progress and complete event
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loaderInfo.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onProgress(e:ProgressEvent):void 
		{
			trace("Loading");
			//show loading %
			progressTxt.text = String(Math.floor((e.bytesLoaded/e.bytesTotal)*100));
		}
		
		private function onComplete(e:Event):void 
		{
			trace("Loaded");
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			
			removeChild(progressTxt);
			
			gotoAndStop(2);
			
			//after stopping our movieclip on position 2 we add the main class by getDefintionByName and Addchild			
			var mainClass:Class = getDefinitionByName("overgen.citrus.Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}		
	}
}