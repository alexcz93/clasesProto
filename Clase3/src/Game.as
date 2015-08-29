package 
{
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author Alexander Campos
	 */
	public class Game extends Sprite
	{
		
		private var cont:int = 0;
		private var timer:Timer;
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		public function start():void
		{
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var bc:Image = new Image(DStarling.assetsManager.getTexture("scene1"));
			addChild(bc);
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			
			
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			
			if (timer.currentCount % 4 == 0) 
			{
				var Coin:Image = new Image(DStarling.assetsManager.getTexture("coin"));
				addChild(Coin);
				
				Coin.x = Math.random() * stage.stageWidth;
				Coin.y = Math.random() * stage.stageHeight;
				
				
				Coin.name = 'coin';
			}
			else
			{
				var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
			addChild(mc);
	
			mc.x = Math.random() * stage.stageWidth;
			mc.y = Math.random() * stage.stageHeight;
			Starling.juggler.add(mc);
			mc.name = 'green';
			}
			
			
		}
		
	
		
		private function onTouch(e:TouchEvent):void 
		{
			//var mc:MovieClip = e.currentTarget as MovieClip;
			var touch:Touch = e.getTouch(this);
			if (touch != null)
			{
				if (touch.phase == TouchPhase.BEGAN)
				{
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == 'coin' || content.name == 'green')
					{
						removeChild(content);
					}
					//removeChild(mc);
					//Starling.juggler.remove(mc);
					//mc.removeEventListener(TouchEvent.TOUCH, onTouch)
				}
			}
		}
		
	}

}