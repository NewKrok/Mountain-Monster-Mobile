/**
 * Created by newkrok on 24/01/16.
 */
package src.menu.module.task.view
{
	import net.fpp.starling.StaticAssetManager;

	import net.fpp.starling.module.AView;

	import src.assets.Fonts;

	import starling.display.Image;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class TaskView extends AView
	{
		private var _back:Image;

		private var _description:TextField;

		private var _descriptionText:String;

		public function TaskView( descriptionText:String )
		{
			this._descriptionText = descriptionText;
		}

		override protected function onInit():void
		{
			this._back = new Image( StaticAssetManager.instance.getTexture( 'task_background' ) );
			this.addChild( this._back );

			this._description = new TextField( this.width - 10, this.height - 5, this._descriptionText );

			this._description.touchable = false;
			this._description.fontSize = 12;
			this._description.color = 0xFFFFFF;
			this._description.fontName = Fonts.getAachenLightFont( ).name;
			this._description.hAlign = HAlign.CENTER;
			this._description.vAlign = VAlign.CENTER;

			this._description.x = 5;
			this._description.y = 5;
			this.addChild( this._description );
		}

		override public function dispose():void
		{
			this._back.removeFromParent( true );
			this._back = null;

			super.dispose();
		}
	}
}