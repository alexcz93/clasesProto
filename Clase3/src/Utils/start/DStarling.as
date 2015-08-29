package Utils.start 
{
	import flash.display.Stage;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author Alexander Campos
	 */
	public class DStarling 
	{
		private static var starling:Starling;
		private static var _assetsManager:AssetManager;
		private static var _assets:Vector.<String>;
		private static var onComplete:Function;
		private static var baseClass:Class;
		
		public static function init(rootClass:Class,stage:Stage,assets:Vector.<String>,_onComplete:Function):void
		{
			starling = new Starling(rootClass, stage);/*Starling necesita una ruta de Clase y Stage*/
			starling.start();
			assetsManager = new AssetManager();
			onComplete = _onComplete;
			baseClass = rootClass;
			_assets = assets;
			starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}
		
		static private function onRootCreated(e:Event):void 
		{
			starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			for (var i:int = 0; i <_assets.length ; i++) 
			{
				assetsManager.enqueue(_assets[i]);
			}
			assetsManager.loadQueue(endQueue);/* endQueue nos permite cuando parar la carga*/
		}
		
		static private function endQueue(ratio:Number):void 
		{
			if (ratio == 1)
			{
				var game:Object = starling.root as baseClass;
				game.start();
				/*onComplete();*/
			}
		}
		
		static public function get assetsManager():AssetManager 
		{
			return _assetsManager;
		}
		
		static public function set assetsManager(value:AssetManager):void 
		{
			_assetsManager = value;
		}
		
	}

}