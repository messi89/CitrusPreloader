package  
{
	import citrus.core.starling.StarlingState;
	import starling.display.Image;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Messi89 OverGen
	 */
	
	public class GameState extends StarlingState 
	{
		[Embed(source = "../assets/nimro.png")]
		public static const nimro:Class;
		
		public function GameState() 
		{
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			var img:Image = new Image(Texture.fromBitmap(new nimro()));
			addChild(img);
		}
		
	}

}