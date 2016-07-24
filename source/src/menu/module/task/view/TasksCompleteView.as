/**
 * Created by newkrok on 31/01/16.
 */
package src.menu.module.task.view
{
	import caurina.transitions.Tweener;

	import net.fpp.common.starling.StaticAssetManager;
	import net.fpp.common.starling.module.AView;
	import net.fpp.common.starling.module.events.ModuleEvent;

	import src.assets.Fonts;
	import src.constant.CTask;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.utils.Align;

	public class TasksCompleteView extends AView
	{
		private var _back:Quad;

		private var _title:TextField;
		private var _subTitle:TextField;

		private var _rewardView:RewardView;

		private var _backButton:Button;

		public function setRewardCarGraphicId( id:uint ):void
		{
			this._rewardView = new RewardView();

			this._rewardView.setCarGraphicId( id );

			this._rewardView.x = this.width / 2;
			this._rewardView.y = this.height / 2;

			this._rewardView.scaleX = .2;
			this._rewardView.scaleY = .2;

			this._rewardView.alpha = 0;

			this.addChild( this._rewardView );

			Tweener.addTween( this._rewardView, {scaleX: 1, scaleY: 1, alpha: 1, time: 1} );
		}

		override protected function onInit():void
		{
			this.createBackground();
			this.createTitles();
			this.createBackButton();
		}

		private function createTitles():void
		{
			this.createTitle();
			this.createSubTitle();
		}

		private function createTitle():void
		{
			var titleTextFormat:TextFormat = new TextFormat();
			titleTextFormat.font = Fonts.getAachenLightFont().name;
			titleTextFormat.size = 20;
			titleTextFormat.color = 0xFFFF00;
			titleTextFormat.horizontalAlign = Align.CENTER;
			titleTextFormat.verticalAlign = Align.CENTER;

			this._title = new TextField( this.width, 25, 'COMPLETED TASKS ' + CTask.MAXIMUM_TASK_PER_WORLD + '/' + CTask.MAXIMUM_TASK_PER_WORLD, titleTextFormat );
			this._title.touchable = false;

			this._title.y = 10;
			this.addChild( this._title );
		}

		private function createSubTitle():void
		{
			var titleTextFormat:TextFormat = new TextFormat();
			titleTextFormat.font = Fonts.getAachenLightFont().name;
			titleTextFormat.size = 15;
			titleTextFormat.color = 0xFFFFFF;
			titleTextFormat.horizontalAlign = Align.CENTER;
			titleTextFormat.verticalAlign = Align.TOP;

			this._subTitle = new TextField( this.width, 50, 'CONGRATULATIONS! YOU COMPLETED\n ALL TASKS IN THIS LEVEL PACK!', titleTextFormat );
			this._subTitle.touchable = false;

			this._subTitle.y = this._title.y + this._title.height;
			this.addChild( this._subTitle );
		}

		private function createBackground():void
		{
			this._back = new Quad( this.stage.stageWidth, this.stage.stageHeight, 0x000000 );
			this._back.width = this.stage.stageWidth;
			this._back.height = this.stage.stageHeight;
			this._back.alpha = .8;
			this.addChild( this._back );
		}

		private function createBackButton():void
		{
			this.addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), 'CLOSE' ) );

			var buttonTextFormat:TextFormat = new TextFormat();
			buttonTextFormat.font = Fonts.getAachenLightFont().name;
			buttonTextFormat.size = 18;
			buttonTextFormat.color = 0xFFFFFF;

			this._backButton.textFormat = buttonTextFormat;
			this._backButton.x = this.stage.stageWidth / 2 - this._backButton.width / 2;
			this._backButton.y = this.stage.stageHeight - this._backButton.height - 10;

			this._backButton.addEventListener( Event.TRIGGERED, this.backToMapRequest );
		}

		private function backToMapRequest( event:Event ):void
		{
			this.dispatchEvent( new ModuleEvent( ModuleEvent.DISPOSE_REQUEST ) );
		}

		override public function dispose():void
		{
			this._back.removeFromParent( true );
			this._back = null;

			this._title.removeFromParent( true );
			this._title = null;

			this._subTitle.removeFromParent( true );
			this._subTitle = null;

			this._backButton.removeFromParent( true );
			this._backButton = null;

			Tweener.removeTweens( this._rewardView );
			this._rewardView.removeFromParent( true );
			this._rewardView = null;

			super.dispose();
		}
	}
}