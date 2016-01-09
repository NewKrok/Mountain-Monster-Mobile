/**
 * Created by newkrok on 09/01/16.
 */
package src.game.module.snow.view
{
	import net.fpp.starling.module.AView;

	public class SnowModuleView extends AView
	{
		private const NUMBER_OF_SNOWFLAKE:uint = 100;

		private var _snowflakes:Vector.<Snowflake> = new <Snowflake>[];

		override protected function onInit():void
		{
			this.touchable = false;

			for( var i:int = 0; i < this.NUMBER_OF_SNOWFLAKE; i++ )
			{
				var snowflake:Snowflake = new Snowflake();
				snowflake.touchable = false;
				this.addChild( snowflake );

				this._snowflakes.push( snowflake );
			}
		}

		public function update():void
		{
			for( var i:int = 0; i < this.NUMBER_OF_SNOWFLAKE; i++ )
			{
				this._snowflakes[ i ].update();
			}
		}

		override public function dispose():void
		{
			if( this._snowflakes )
			{
				for( var i:int = 0; i < this.NUMBER_OF_SNOWFLAKE; i++ )
				{
					this._snowflakes[ i ].removeFromParent( true );
					this._snowflakes[ i ] = null;
				}
				this._snowflakes.length = 0;
				this._snowflakes = null;
			}
		}
	}
}