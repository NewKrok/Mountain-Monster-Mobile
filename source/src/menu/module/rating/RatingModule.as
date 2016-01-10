/**
 * Created by newkrok on 23/09/15.
 */
package src.menu.module.rating
{
	import net.fpp.starling.module.AModule;

	import src.data.DataManager;
	import src.menu.module.rating.events.RatingModuleEvent;
	import src.menu.module.rating.view.RatingModuleView;

	public class RatingModule extends AModule
	{
		private var _ratingView:RatingModuleView;

		public function RatingModule()
		{
			this._view = new RatingModuleView();
			this._view.addEventListener( RatingModuleEvent.RATE_REQUEST, this.handleRateRequest );
			this._view.addEventListener( RatingModuleEvent.RATE_LATER_REQUEST, this.handleRateLaterRequest );
			this._view.addEventListener( RatingModuleEvent.RATE_NEVER_REQUEST, this.handleRateNeverRequest );
		}

		private function clearModule():void
		{
			if( this._view )
			{
				this._view.removeEventListener( RatingModuleEvent.RATE_REQUEST, this.handleRateRequest );
				this._view.removeEventListener( RatingModuleEvent.RATE_LATER_REQUEST, this.handleRateLaterRequest );
				this._view.removeEventListener( RatingModuleEvent.RATE_NEVER_REQUEST, this.handleRateNeverRequest );
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

		override protected function disposeRequest():void
		{
			this.clearModule();

			super.disposeRequest();
		}

		override public function dispose():void
		{
			this.clearModule();

			super.dispose();
		}
	}
}