/**
 * Created by newkrok on 31/01/16.
 */
package src.menu.module.task.view
{
	import src.constant.CTask;
	import src.display.AnimatedUIBox;

	import net.fpp.achievement.AchievementVO;
	import net.fpp.starling.StaticAssetManager;
	import net.fpp.starling.module.AView;
	import net.fpp.starling.module.events.ModuleEvent;

	import src.assets.Fonts;
	import src.menu.module.task.events.TaskModuleEvent;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class TasksInProgressView extends AView
	{
		private var _back:Quad;

		private var _taskViews:Vector.<TaskView> = new <TaskView>[];

		private var _title:TextField;
		private var _subTitle:TextField;

		private var _list:AnimatedUIBox;

		private var _backButton:Button;

		override protected function onInit():void
		{
			this.createBackground();
			this.createTitles();
			this.createBackButton();
			this.createListContainer();
			this.createList();
		}

		private function createTitles():void
		{
			this.createTitle();
			this.createSubTitle();
		}

		private function createTitle():void
		{
			this._title = new TextField( this.width, 25, '' );

			this._title.touchable = false;
			this._title.fontSize = 20;
			this._title.color = 0xFFFFFF;
			this._title.fontName = Fonts.getAachenLightFont().name;
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
			this._subTitle.fontName = Fonts.getAachenLightFont().name;
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

		private function createListContainer():void
		{
			this._list = new AnimatedUIBox();

			this._list.touchable = false;
			this._list.gap = 5;
			this._list.x = this.stage.stageWidth / 2;
			this._list.y = 69;

			this.addChild( this._list );
		}

		private function createList():void
		{
			for( var i:int = 0; i < 3; i++ )
			{
				var taskView:TaskView = new TaskView();

				this._taskViews.push( taskView );
			}
		}

		public function setCompletedTasksCount( count:uint ):void
		{
			this._title.text = 'COMPLETED TASKS ' + count + '/' + CTask.MAXIMUM_TASK_PER_WORLD;
		}

		public function setTasks( tasks:Vector.<AchievementVO> ):void
		{
			var isCompleteRoutinAlreadyStarted:Boolean = false;

			for( var i:int = 0; i < CTask.MAX_TASK_COUNT_AT_THE_SAME_TIME; i++ )
			{
				var taskView:TaskView = this._taskViews[ i ];
				var hasNewTask:Boolean = i < tasks.length;

				if( !taskView.parent )
				{
					this._list.addChild( taskView );
					taskView.resetPosition();
				}

				if( hasNewTask && tasks[ i ].isEarned )
				{
					taskView.addEventListener( TaskModuleEvent.REMOVE_TASK_REQUEST, onRemoveTaskRequest );
					taskView.setToCompleted();

					if( !isCompleteRoutinAlreadyStarted )
					{
						isCompleteRoutinAlreadyStarted = true;
						taskView.startUnlockRoutine();
					}
				}
				else
				{
					taskView.setToLocked();
				}

				if ( hasNewTask )
				{
					var descriptionText:String = tasks[ i ].description.replace( '$value', tasks[ i ].currentValue ).toUpperCase();
					taskView.setDescriptionText( descriptionText );
					taskView.setTaskID( tasks[ i ].id );
				}
				else
				{
					taskView.visible = false;
				}
			}
		}

		private function onRemoveTaskRequest( e:TaskModuleEvent ):void
		{
			e.currentTarget.removeEventListener( TaskModuleEvent.REMOVE_TASK_REQUEST, onRemoveTaskRequest );

			this.orderTaskViews();

			this.dispatchEvent( e );
		}

		private function orderTaskViews():void
		{
			for ( var i:int = 0; i < this._taskViews.length; i++ )
			{
				if ( !this._taskViews[i].parent )
				{
					var taskView:TaskView = this._taskViews[i];

					this._taskViews.splice( i, 1 );
					this._taskViews.push( taskView );

					break;
				}
			}
		}

		override public function dispose():void
		{
			this._back.removeFromParent( true );
			this._back = null;

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

			this._backButton.removeFromParent( true );
			this._backButton = null;

			super.dispose();
		}
	}
}