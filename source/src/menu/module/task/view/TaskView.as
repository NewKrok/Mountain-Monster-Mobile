/**
 * Created by newkrok on 24/01/16.
 */
package src.menu.module.task.view
{
	import caurina.transitions.Tweener;

	import net.fpp.starling.StaticAssetManager;

	import net.fpp.starling.module.AView;

	import src.assets.Fonts;
	import src.menu.module.task.events.TaskModuleEvent;

	import starling.display.Image;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class TaskView extends AView
	{
		private var _back:Image;

		private var _description:TextField;

		private var _taskID:uint;

		private var _isEarned:Boolean;

		public function TaskView()
		{
		}

		override protected function onInit():void
		{
			this._description = new TextField( 10, 10, '' );

			this._description.touchable = false;
			this._description.fontSize = 12;
			this._description.color = 0xFFFFFF;
			this._description.fontName = Fonts.getAachenLightFont().name;
			this._description.hAlign = HAlign.CENTER;
			this._description.vAlign = VAlign.CENTER;

			this._description.x = 5;
			this._description.y = 5;

			this.addChild( this._description );
		}

		public function setToCompleted():void
		{
			if ( !this._isEarned )
			{
				this._isEarned = true;
				this.setBackground( 'task_background_completed' );
			}
		}

		public function startUnlockRoutine():void
		{
			Tweener.addTween( this, {x: x + 50, time: .3, delay: .5} );
			Tweener.addTween( this, {x: -width * 2, time: .5, delay: 1.5, alpha: 0, onComplete: onRemovedHandler} );
		}

		private function onRemovedHandler():void
		{
			this.setToLocked();
			
			this.removeFromParent();

			this.dispatchEvent( new TaskModuleEvent( TaskModuleEvent.REMOVE_TASK_REQUEST, _taskID ) );
		}

		public function setToLocked():void
		{
			if( this._back )
			{
				this.removeBackground();
			}

			if ( this._isEarned || !this._back )
			{
				this._isEarned = false;
				this.setBackground( 'task_background' );
			}
		}

		private function removeBackground():void
		{
			this._back.removeFromParent( true );
			this._back = null;
		}

		private function setBackground( textureName:String ):void
		{
			this._back = new Image( StaticAssetManager.instance.getTexture( textureName ) );

			this.pivotX = this._back.width / 2;

			this.addChildAt( this._back, 0 );
		}

		public function setDescriptionText( text:String ):void
		{
			this._description.text = text;

			this._description.width = this.width - 10;
			this._description.height = this.height - 5;
		}

		public function setTaskID( value:uint ):void
		{
			this._taskID = value;
		}

		public function resetPosition():void
		{
			this.x = 0;
		}

		override public function dispose():void
		{
			this._description.removeFromParent( true );
			this._description = null;

			this._back.removeFromParent( true );
			this._back = null;

			super.dispose();
		}
	}
}