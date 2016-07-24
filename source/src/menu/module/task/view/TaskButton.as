/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task.view
{
	import flash.geom.Rectangle;

	import net.fpp.common.starling.StaticAssetManager;

	import src.assets.Fonts;
	import src.common.TasksManager;

	import starling.display.Button;
	import starling.display.Image;
	import starling.text.TextFormat;
	import starling.utils.Align;

	public class TaskButton extends Button
	{
		private var _newIcon:Image;

		private var _worldID:uint;

		public function TaskButton( worldID:uint )
		{
			this._worldID = worldID;

			super( StaticAssetManager.instance.getTexture( 'task_button' ), '' );

			var titleTextFormat:TextFormat = new TextFormat();
			titleTextFormat.font = Fonts.getAachenLightFont().name;
			titleTextFormat.size = 13;
			titleTextFormat.color = 0xFFFFFF;
			titleTextFormat.verticalAlign = Align.CENTER;

			this.textFormat = titleTextFormat;

			var newTextBounds:Rectangle = this.textBounds;
			newTextBounds.top = 8;
			this.textBounds = newTextBounds;

			this.updateCounter();

			if( TasksManager.hasNonViewedTaskByWorldID( this._worldID ) )
			{
				this.showNewIcon();
			}
		}

		public function reset():void
		{
			this.disposeNewIcon();
		}

		public function updateCounter():void
		{
			this.setUnlockedTasks( TasksManager.getCompletedTasksByWorldID( this._worldID ) );
		}

		private function setUnlockedTasks( unlockedTasks:uint ):void
		{
			this.text = 'TASKS\n' + unlockedTasks + '/20';
		}

		private function showNewIcon():void
		{
			this._newIcon = new Image( StaticAssetManager.instance.getTexture( 'new_icon' ) );

			this._newIcon.x = this.width - this._newIcon.width - 4;
			this._newIcon.y = 2;

			this.addChild( this._newIcon );
		}

		private function disposeNewIcon():void
		{
			if( this._newIcon )
			{
				this._newIcon.removeFromParent( true );
				this._newIcon = null;
			}
		}

		override public function dispose():void
		{
			this.disposeNewIcon();

			super.dispose();
		}
	}
}