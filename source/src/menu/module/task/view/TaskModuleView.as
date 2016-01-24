/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task.view
{
	import net.fpp.achievement.AchievementVO;
	import net.fpp.starling.StaticAssetManager;
	import net.fpp.starling.display.UIBox;
	import net.fpp.starling.module.AModuleView;
	import net.fpp.starling.module.events.ModuleEvent;

	import src.assets.Fonts;

	import src.common.TasksManager;
	import src.menu.module.task.TaskModel;

	import starling.display.Button;

	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class TaskModuleView extends AModuleView
	{
		private var _back:Quad;

		private var _taskViews:Vector.<TaskView> = new <TaskView>[];

		private var _title:TextField;
		private var _subTitle:TextField;

		private var _list:UIBox;

		private var _backButton:Button;

		public function TaskModuleView()
		{
		}

		override protected function onInit():void
		{
			this.createBackground();
			this.createTitles();
			this.createTaskViews();
			this.createBackButton();
		}

		private function createTitles():void
		{
			this.createTitle();
			this.createSubTitle();
		}

		private function createTitle():void
		{
			var worldID:uint = ( this._model as TaskModel ).getWorldID();

			this._title = new TextField( this.width, 25, 'COMPLETED TASKS ' + TasksManager.getCompletedTasksByWorldID( worldID ) + '/20' );

			this._title.touchable = false;
			this._title.fontSize = 20;
			this._title.color = 0xFFFFFF;
			this._title.fontName = Fonts.getAachenLightFont( ).name;
			this._title.hAlign = HAlign.CENTER;
			this._title.vAlign = VAlign.CENTER;

			this._title.y = 10;
			this.addChild( this._title );
		}

		private function createSubTitle():void
		{
			this._subTitle = new TextField( this.width, 25, 'COMPLETE ALL TASK TO UNLOCK A NEW CAR!' );

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

		private function createTaskViews():void
		{
			var worldID:uint = ( this._model as TaskModel ).getWorldID();

			var tasks:Vector.<AchievementVO> = TasksManager.getTasksByWorldID( worldID );

			this._list = new UIBox();
			this._list.touchable = false;
			this._list.gap = 5;
			this.addChild( this._list );

			for( var i:int = 0; i < tasks.length; i++ )
			{
				var descriptionText:String = tasks[ i ].description.replace( '$value', tasks[ i ].currentValue ).toUpperCase();

				var taskView:TaskView = new TaskView( descriptionText );

				this._list.addChild( taskView );

				this._taskViews.push( taskView );
			}

			this._list.x = this.width / 2 - this._list.width / 2;
			this._list.y = this.height / 2 - this._list.height / 2;
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
			for( var i:int = 0; i < this._taskViews.length; i++ )
			{
				this._taskViews[ i ].removeFromParent( true );
				this._taskViews[ i ] = null;
			}
			this._taskViews.length = 0;
			this._taskViews = null;

			this._list.removeFromParent( true );
			this._list = null;

			this._title.removeFromParent( true );
			this._title = null;

			this._subTitle.removeFromParent( true );
			this._subTitle = null;

			super.dispose();
		}
	}
}