package 
{
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.utils.Context3DUtil;
	import citrus.utils.Mobile;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Messi89 OverGen
	 */
	
	public class Main extends StarlingCitrusEngine 
	{
		//txtfield to show loading %
		private var myStage:Stage;
		
		public function Main(__stage:Stage):void 
		{
			myStage = __stage;
			
			setUpStarling(true,1,null,"baseline");
			state = new GameState();
		}
		
		/*override the setup function to use the parent stage from CitrusPrealoder class*/
		override public function setUpStarling(debugMode:Boolean = false, antiAliasing:uint = 1, viewPort:Rectangle = null, profile:String = "auto"):void {
			
			//super.setUpStarling(true, 1, null, "baseline");
			
			if (Mobile.isAndroid())
				Starling.handleLostContext = true;
				
			if (viewPort)
				_viewport = viewPort;
				
			var starlingInit:Function = function(profile:String):void
			{
				_starling = new Starling(RootClass, myStage, null, null, "auto", profile);
				_starling.antiAliasing = antiAliasing;
				_starling.showStats = debugMode;
				_starling.addEventListener(Event.CONTEXT3D_CREATE, _context3DCreated);
			}
			
			if (profile == "auto")
			{
					
				var profiletests:Array = _context3DProfiles.slice();
				
				var testProfiles:Function = function(profile:String, success:Boolean):void
				{
					if (success)
					{
						if(debugMode)
							trace("[StarlingCitrusEngine] Context3DProfile -", profile, "is supported! setting up starling...");
						starlingInit(profile);
						return;
					}
					
					if(debugMode)
							trace("[StarlingCitrusEngine] Context3DProfile -", profile, "is not supported...");
					
					if (profiletests.length > 0)
					{
						if (_context3DProfileTestDelay == 0)
							Context3DUtil.supportsProfile(stage, profiletests.shift(), testProfiles);
						else
							setTimeout(Context3DUtil.supportsProfile,_context3DProfileTestDelay,stage, profiletests.shift(), testProfiles);
					}else if (profiletests.length == 0)
						throw new ArgumentError("[StarlingCitrusEngine] Failed to create any Context3D with a profile from this list : " + String(_context3DProfiles) + ". check the render mode?");
				}
				
				if(debugMode)
						trace("[StarlingCitrusEngine] Context3DProfile - testing :", profiletests, "with delay:"+_context3DProfileTestDelay+"ms ...");
				Context3DUtil.supportsProfile(stage, profiletests.shift(), testProfiles);
			
			}
			else
			{
				starlingInit(profile);
			}
		}
		
	}
	
}

import starling.display.Sprite;

/**
 * RootClass is the root of Starling, it is never destroyed and only accessed through <code>_starling.stage</code>.
 */
internal class RootClass extends Sprite {

	public function RootClass() {
	}
}