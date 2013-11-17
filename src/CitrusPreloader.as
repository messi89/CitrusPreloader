package  
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
			stop();
			
			progressTxt.x = stage.stageWidth / 2;
			progressTxt.y = stage.stageHeight / 2;
			progressTxt.defaultTextFormat = new TextFormat("Tahoma", "20", 0x000000, true);
			addChild(progressTxt);
			
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loaderInfo.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onProgress(e:ProgressEvent):void 
		{
			trace("Loading");
			progressTxt.text = String(Math.floor((e.bytesLoaded/e.bytesTotal)*100));
		}
		
		private function onComplete(e:Event):void 
		{
			trace("Loaded");
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			loaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			
			removeChild(progressTxt);
			
			gotoAndStop(2);
			
			//getDefinitionByName() will let us access the classes without importing
			/*StarlingType = getDefinitionByName("starling.core.Starling") as Class;
			MainType = getDefinitionByName("Main") as Class;
			_starling = new StarlingType(MainType, this.stage);
			_starling.start();*/
			
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass(this.stage) as DisplayObject);
		}		
	}
}