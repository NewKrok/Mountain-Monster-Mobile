/**
 * Created by newkrok on 31/01/16.
 */
package src.menu.module.task.view
{
	import net.fpp.starling.StaticAssetManager;
	import net.fpp.starling.module.AView;
	import net.fpp.starling.module.events.ModuleEvent;

	import src.assets.Fonts;

	import starling.display.Button;

	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

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
			this.addChild( this._rewardView );

			this._rewardView.setCarGraphicId( id );

			this._rewardView.x = this.width / 2 - this._rewardView.width / 2;
			this._rewardView.y = this.height / 2 - this._rewardView.height / 2;
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
			this._title = new TextField( this.width, 25, 'COMPLETED TASKS 20/20' );

			this._title.touchable = false;
			this._title.fontSize = 20;
			this._title.color = 0xFFFF00;
			this._title.fontName = Fonts.getAachenLightFont( ).name;
			this._title.hAlign = HAlign.CENTER;
			this._title.vAlign = VAlign.CENTER;

			this._title.y = 10;
			this.addChild( this._title );
		}

		private function createSubTitle():void
		{
			this._subTitle = new TextField( this.width, 50, 'CONGRATULATIONS! YOU COMPLETED\n ALL TASKS IN THIS LEVEL PACK!' );

			this._subTitle.touchable = false;
			this._subTitle.fontSize = 15;
			this._subTitle.color = 0xFFFFFF;
			this._subTitle.fontName = Fonts.getAachenLightFont( ).name;
			this._subTitle.hAlign = HAlign.CENTER;
			this._subTitle.vAlign = VAlign.TOP;

			this._subTitle.y = this._title.y + this._title.height;
			this.addChild( this._subTitle );
		}

		private function createBackground():void
		{
			this._back = new Quad( this.stage.stageWidth, this.stage.stageHeight, 0x000000, true );
			this._back.width = this.stage.stageWidth;
			this._back.height = this.stage.stageHeight;
			this._back.alpha = .8;
			this.addChild( this._back );
		}

		private function createBackButton():void
		{
			this.addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), 'CLOSE' ) );

			this._backButton.fontName = Fonts.getAachenLightFont().name;
			this._backButton.fontSize = 18;
			this._backButton.fontColor = 0xFFFFFF;
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

			this._rewardView.removeFromParent( true );
			this._rewardView = null;

			super.dispose();
		}
	}
}