/**
 * Created by newkrok on 15/11/15.
 */
package src.menu.module.menubackground.view
{
	import caurina.transitions.Tweener;

	import flash.geom.Point;

	import net.fpp.starling.StaticAssetManager;
	import net.fpp.starling.module.AModuleView;

	import src.menu.module.menubackground.constant.CBackgroundView;

	import starling.display.Image;

	import starling.display.Sprite;
	import starling.textures.Texture;

	public class MenuBackgroundView extends AModuleView
	{
		private var _container:Sprite;
		private var _backContainer:Sprite;
		private var _frontContainer:Sprite;

		private var _levelPackId:uint = uint.MAX_VALUE;

		public function MenuBackgroundView()
		{
		}

		override protected function onInit():void
		{
			this._container = new Sprite();
			this.addChild( this._container );
		}

		public function setLevelPackId( id:uint ):void
		{
			if( this._levelPackId != id )
			{
				this._levelPackId = id;

				this.clearView();
				this.buildView();

				this.update( new Point() );
			}
		}

		private function clearView():void
		{
			if( this._backContainer )
			{
				this._backContainer.removeFromParent( true );
				this._backContainer = null;
			}

			if( this._frontContainer )
			{
				this._frontContainer.removeFromParent( true );
				this._frontContainer = null;
			}
		}

		private function buildView():void
		{
			this._backContainer = this.createBackgroundElements( 'back_world_' + this._levelPackId + '_a' );
			this._container.addChild( this._backContainer );

			this._frontContainer = this.createBackgroundElements( 'back_world_' + this._levelPackId + '_b' );
			this._container.addChild( this._frontContainer );
		}

		private function createBackgroundElements( textureName:String ):Sprite
		{
			var container:Sprite = new Sprite();
			var textures:Vector.<Texture> = StaticAssetManager.instance.getTextures( textureName );

			for( var i = 0; i < 5; i++ )
			{
				var textureIndex:int = i == 4 ? 0 : i;
				var backgroundPiece:Image = new Image( textures[ textureIndex ] );
				container.addChild( backgroundPiece );

				backgroundPiece.scaleX = backgroundPiece.scaleY = 1.2;
				backgroundPiece.x = i * ( backgroundPiece.width - .5 );
			}

			textures.length = 0;
			textures = null;

			container.flatten( true );

			return container;
		}

		private function resetPositions():void
		{
			this._backContainer.x = this.stage.stageWidth / 2 - this._backContainer.width / 2;
			this._backContainer.y = this.stage.stageHeight / 2 - this._backContainer.height / 2;

			this._frontContainer.x = this.stage.stageWidth / 2 - this._frontContainer.width / 2;
			this._frontContainer.y = this.stage.stageHeight / 2 - this._frontContainer.height / 2 + 50;
		}

		public function update( offsetPercent:Point ):void
		{
			this.updateContainerPosition(
					this._backContainer,
					offsetPercent,
					CBackgroundView.BACK_BACKGROUND_MAX_X_OFFSET,
					CBackgroundView.BACK_BACKGROUND_MAX_Y_OFFSET,
					CBackgroundView.BACK_BACKGROUND_BASE_Y_OFFSET
			);

			this.updateContainerPosition(
					this._frontContainer,
					offsetPercent,
					CBackgroundView.FRONT_BACKGROUND_MAX_X_OFFSET,
					CBackgroundView.FRONT_BACKGROUND_MAX_Y_OFFSET,
					CBackgroundView.FRONT_BACKGROUND_BASE_Y_OFFSET
			);
		}

		private function updateContainerPosition( container:Sprite, offsetPercent:Point, maxXOffset:Number, maxYOffset:Number, baseYOffset:Number ):void
		{
			var centerX:Number = this.stage.stageWidth / 2 - container.width / 2;
			var centerY:Number = this.stage.stageHeight / 2 - container.height / 2;

			var newX:Number = centerX + maxXOffset * offsetPercent.x;
			var newY:Number = centerY + baseYOffset + maxYOffset * offsetPercent.y;

			Tweener.removeTweens( container );
			Tweener.addTween( container, {time: .3, x: newX, y: newY, transition: 'linear'} );
		}

		override public function dispose():void
		{
			this.clearView();

			this._container.removeFromParent( true );
			this._container = null;
		}
	}
}