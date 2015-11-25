/**
 * Created by newkrok on 23/09/15.
 */
package src.menu.module.rating
{
	import src.data.DataManager;
	import src.events.BaseModuleEvent;
	import src.menu.module.rating.events.RatingModuleEvent;
	import src.menu.module.rating.view.RatingView;

	import starling.display.Sprite;
	import starling.events.Event;

	public class RatingModule extends Sprite
	{
		private var _ratingView:RatingView;

		public function RatingModule()
		{
			this.addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}

		private function onAddedToStage():void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );

			this._ratingView = new RatingView();
			this._ratingView.addEventListener( RatingModuleEvent.RATE_REQUEST, this.handleRateRequest );
			this._ratingView.addEventListener( RatingModuleEvent.RATE_LATER_REQUEST, this.handleRateLaterRequest );
			this._ratingView.addEventListener( RatingModuleEvent.RATE_NEVER_REQUEST, this.handleRateNeverRequest );
			this.addChild( this._ratingView );
		}

		private function clearModule():void
		{
			if( this._ratingView )
			{
				this._ratingView.removeEventListener( RatingModuleEvent.RATE_REQUEST, this.handleRateRequest );
				this._ratingView.removeEventListener( RatingModuleEvent.RATE_LATER_REQUEST, this.handleRateLaterRequest );
				this._ratingView.removeEventListener( RatingModuleEvent.RATE_NEVER_REQUEST, this.handleRateNeverRequest );

				this.removeChild( this._ratingView );
				this._ratingView = null;
			}
		}

		private function handleRateRequest():void
		{
			DataManager.setRatingData( false );

			MountainMonsterIOSMain.goToRating();

			this.disposeRequest();
		}

		private function handleRateLaterRequest():void
		{
			this.disposeRequest();
		}

		private function handleRateNeverRequest():void
		{
			DataManager.setRatingData( false );

			this.disposeRequest();
		}

		private function disposeRequest():void
		{
			this.clearModule();

			this.dispatchEvent( new BaseModuleEvent( BaseModuleEvent.DISPOSE_REQUEST ) );
		}

		override public function dispose():void
		{
			this.clearModule();

			super.dispose();
		}
	}
}