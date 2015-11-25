package src
{
	import caurina.transitions.Tweener;
	
	import starling.display.Sprite;

	public class AbstractPanel extends Sprite
	{	
		private var _waitingForDispose:Boolean;
		
		public function AbstractPanel( ):void
		{
		}
		
		public function init( ):void
		{
		}
		
		public function disposeRequest( $onComplete:Function, $time:Number = 1 ):void
		{
			_waitingForDispose = true;
			Tweener.addTween( this, { time: $time, alpha: 0, onComplete: $onComplete, onCompleteParams: [this] } );
		}
		
		public function get waitingForDispose( ):Boolean
		{
			return _waitingForDispose;
		}
	}
}