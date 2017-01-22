/**
 * Created by newkrok on 09/01/16.
 */
package src.menu.module.carselect.view
{
	import net.fpp.common.starling.StaticAssetManager;
	import net.fpp.common.starling.module.AModuleView;
	import net.fpp.common.starling.module.event.ModuleEvent;

	import src.assets.Fonts;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;

	public class CarSelectModuleView extends AModuleView
	{
		private var _carlist:CarList;

		private var _back:Quad;

		private var _backButton:Button;

		override protected function onInit():void
		{
			this._back = new Quad( this.stage.stageWidth, this.stage.stageHeight, 0x000000 );
			this._back.width = this.stage.stageWidth;
			this._back.height = this.stage.stageHeight;
			this._back.alpha = .8;
			this.addChild( this._back );

			this.addChild( this._carlist = new CarList( this.stage.stageWidth ) );
			this._carlist.y = this.height / 2 - this._carlist.height / 2 - 40;

			this.addChild( _backButton = new Button( StaticAssetManager.instance.getTexture( "base_button" ), 'CLOSE' ) );

			var buttonTextFormat:TextFormat = new TextFormat();
			buttonTextFormat.font = Fonts.getAachenLightFont().name;
			buttonTextFormat.size = 18;
			buttonTextFormat.color = 0xFFFFFF;

			this._backButton.textFormat = buttonTextFormat;

			this._backButton.x = stage.stageWidth / 2 - this._backButton.width / 2;
			this._backButton.y = stage.stageHeight - this._backButton.height - 10;
			this._backButton.addEventListener( Event.TRIGGERED, this.backToMapRequest );
		}

		private function backToMapRequest( event:Event ):void
		{
			this.dispatchEvent( new ModuleEvent( ModuleEvent.DISPOSE_REQUEST ) );
		}

		public function unlockCar( carId:uint ):void
		{
			this._carlist.unlockCar( carId );
		}

		override public function dispose():void
		{
			this._carlist.removeFromParent( true );
			this._carlist = null;

			this._back.removeFromParent( true );
			this._back = null;

			this._backButton.removeEventListener( Event.TRIGGERED, backToMapRequest );
			this._backButton.removeFromParent( true );
			this._backButton = null;

			super.dispose();
		}
	}
}