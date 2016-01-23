/**
 * Created by newkrok on 22/01/16.
 */
package src.menu.module.task.view
{
	import flash.geom.Rectangle;

	import net.fpp.starling.StaticAssetManager;

	import src.assets.Fonts;
	import src.common.TasksManager;

	import starling.display.Button;
	import starling.display.Image;
	import starling.utils.VAlign;

	public class TaskButton extends Button
	{
		private var _newIcon:Image;

		public function TaskButton( worldID:uint )
		{
			super( StaticAssetManager.instance.getTexture( 'task_button' ), '' );

			this.fontSize = 13;
			this.fontColor = 0xFFFFFF;
			this.fontName = Fonts.getAachenLightFont().name;
			this.textVAlign = VAlign.CENTER;

			var newTextBounds:Rectangle = this.textBounds;
			newTextBounds.top = 8;
			this.textBounds = newTextBounds;

			this.setUnlockedTasks( TasksManager.getCompletedTasksByWorldID( worldID ) );

			if ( TasksManager.hasNonViewedTaskByWorldID( worldID ) )
			{
				this.showNewIcon();
			}
		}

		public function reset():void
		{
			this.disposeNewIcon();
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
			if ( this._newIcon )
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