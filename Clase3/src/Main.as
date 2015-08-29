package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author Alexander Campos
	 */
	[SWF(frameRate=60,width = 480,height = 800 )]
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push('assets/scene1.png');/* nombre de la carpeta*/
			assets.push('assets/coin.png');
			assets.push('assets/walk.png');
			assets.push('assets/walk.xml');
			DStarling.init(Game, stage, assets,startGame);
			
		}
		
		private function startGame():void
		{
			trace("Start Game");
		}
		
		
	}
	
}