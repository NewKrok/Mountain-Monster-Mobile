package src.display
{
	import net.fpp.starling.display.UIBox;

	import starling.display.DisplayObject;
	import caurina.transitions.Tweener;
	
	public class AnimatedUIBox extends UIBox
	{
		public var animationTime:Number = .5;
		public var transitionType:String = 'easeOutExpo';
		
		override protected function orderByHorizontal():void
		{
			var nextChildPosition:Number = 0;
			
			for( var i:int = 0; i < this.numChildren; i++ )
			{
				var child:DisplayObject = this.getChildAt( i );
				
				Tweener.addTween( child, { x: nextChildPosition, alpha: 1, time: animationTime, transition: transitionType } ) ;
				
				nextChildPosition += child.width + gap;
			}
		}
		
		override protected function orderByVertical():void
		{
			var nextChildPosition:Number = 0;
			
			for( var i:int = 0; i < this.numChildren; i++ )
			{
				var child:DisplayObject = this.getChildAt( i );
				
				Tweener.addTween( child, { y: nextChildPosition, alpha: 1, time: animationTime, transition: transitionType } ) ;
				
				nextChildPosition += child.height + gap;
			}
		}
	}
}